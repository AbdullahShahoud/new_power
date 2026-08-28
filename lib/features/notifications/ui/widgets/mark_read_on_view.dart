import 'dart:async';

import 'package:flutter/material.dart';

/// Marks a notification read once the rep has actually **looked** at it.
///
/// The inbox used to require a tap, which made the badge lie: a rep who
/// scrolled the whole list still had every row unread and the bell still
/// showing a count, so the only way to clear it was to open rows one by one
/// — or to tap "mark all read", which also swallows the ones further down
/// that were never seen.
///
/// Two conditions, both deliberate:
///
///  * **[visibleFraction] of the row is inside the viewport.** A row half
///    off the bottom edge has not been read, and marking it would recreate
///    the same lie in the other direction. Scroll *past* something quickly
///    and it stays unread, which is the honest answer.
///  * **It stayed there for [dwell].** A flick through a long list sweeps
///    every row through the viewport for a few milliseconds each; without a
///    dwell that would clear the entire inbox in one gesture.
///
/// Fires at most once per mounted row, and never for a row that is already
/// read.
class MarkReadOnView extends StatefulWidget {
  /// Bumped by the host on every scroll frame. Listening to this rather than
  /// to the `ScrollController` directly keeps the widget usable from any
  /// list, and means one listener per row instead of one per row *plus* a
  /// controller subscription.
  final Listenable scrollTick;

  /// Whether this row still needs marking. `false` short-circuits every
  /// check, so a read row costs nothing.
  final bool isUnread;

  /// Invoked once, when both conditions above are satisfied.
  final VoidCallback onRead;

  final Duration dwell;
  final double visibleFraction;

  final Widget child;

  const MarkReadOnView({
    super.key,
    required this.scrollTick,
    required this.isUnread,
    required this.onRead,
    required this.child,
    this.dwell = const Duration(milliseconds: 600),
    this.visibleFraction = 0.6,
  });

  @override
  State<MarkReadOnView> createState() => _MarkReadOnViewState();
}

class _MarkReadOnViewState extends State<MarkReadOnView> {
  Timer? _dwellTimer;
  bool _fired = false;

  @override
  void initState() {
    super.initState();
    widget.scrollTick.addListener(_evaluate);
    // A row already on screen when the list first builds never produces a
    // scroll event, so the opening viewport has to be checked directly.
    WidgetsBinding.instance.addPostFrameCallback((_) => _evaluate());
  }

  @override
  void didUpdateWidget(MarkReadOnView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scrollTick != widget.scrollTick) {
      oldWidget.scrollTick.removeListener(_evaluate);
      widget.scrollTick.addListener(_evaluate);
    }
  }

  @override
  void dispose() {
    widget.scrollTick.removeListener(_evaluate);
    _dwellTimer?.cancel();
    super.dispose();
  }

  /// Fraction of this row currently inside the enclosing scrollable, or 0
  /// when that cannot be determined (not laid out yet, no Scrollable above).
  double _visibleFraction() {
    if (!mounted) return 0;
    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize || box.size.height == 0) return 0;

    final scrollable = Scrollable.maybeOf(context);
    if (scrollable == null) return 0;
    final viewport = scrollable.context.findRenderObject() as RenderBox?;
    if (viewport == null || !viewport.hasSize) return 0;

    // Measured against the viewport rather than the screen: a list that does
    // not fill the window (a sheet, a tab above a bottom bar) would
    // otherwise count rows hidden behind its own edges as visible.
    final top = box.localToGlobal(Offset.zero, ancestor: viewport).dy;
    final bottom = top + box.size.height;
    final visibleTop = top.clamp(0.0, viewport.size.height);
    final visibleBottom = bottom.clamp(0.0, viewport.size.height);
    return ((visibleBottom - visibleTop) / box.size.height).clamp(0.0, 1.0);
  }

  void _evaluate() {
    if (_fired || !widget.isUnread || !mounted) return;

    if (_visibleFraction() < widget.visibleFraction) {
      // Scrolled back out before the dwell elapsed — the row was passed
      // over, not read.
      _dwellTimer?.cancel();
      _dwellTimer = null;
      return;
    }

    // Already counting down; let it run rather than restarting on every
    // scroll frame, which would stop it ever completing during a slow drag.
    if (_dwellTimer != null) return;

    _dwellTimer = Timer(widget.dwell, () {
      _dwellTimer = null;
      if (_fired || !mounted) return;
      if (_visibleFraction() < widget.visibleFraction) return;
      _fired = true;
      widget.onRead();
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
