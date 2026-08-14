import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// A top bar that fades and slides away as the user scrolls down, and comes
/// back the moment they scroll up — **without ever moving the content**.
///
/// The three properties this is built to guarantee:
///
/// 1. **Nothing reflows.** The header is painted in a [Stack] *over* the
///    scroll view, and the scroll view carries a fixed `padding.top` equal
///    to [height]. Because that padding never changes, no row on screen
///    shifts when the bar hides or shows — the content simply scrolls under
///    it. A header that lived in a [Column] would resize the viewport on
///    every toggle and drag the whole list up and down.
///
/// 2. **It fades, it doesn't snap.** The bar translates by its own height
///    while its opacity falls off, driven continuously by scroll delta
///    rather than by an animation triggered at a threshold.
///
/// 3. **It cannot cover anything near the top.** In the first [height]
///    pixels of scroll the bar is *pinned to the content*: it moves exactly
///    with it, the way it would if it were part of the list. That is the
///    `min` in [_headerOffset] — the free-floating offset can never exceed
///    how far the content itself has travelled, so revealing the bar at
///    scroll position 40 can only ever uncover 40 pixels of it, never
///    overlap the rows underneath. Past that zone the two decouple and the
///    bar floats.
///
/// The caller supplies its own scrollable and hands over the same
/// [controller]; this widget only listens.
class CollapsingHeader extends StatefulWidget {
  /// Painted at the top, overlaying [child]. Should be exactly [height] tall.
  final Widget header;

  /// The scroll view. Give it `padding: EdgeInsets.only(top: height)` (plus
  /// whatever else it needs) so its first row starts below the bar.
  final Widget child;

  final ScrollController controller;
  final double height;

  /// Painted behind the header while it is visible — usually the page
  /// colour, so content scrolling underneath doesn't show through.
  final Color? backgroundColor;

  const CollapsingHeader({
    super.key,
    required this.header,
    required this.child,
    required this.controller,
    required this.height,
    this.backgroundColor,
  });

  @override
  State<CollapsingHeader> createState() => _CollapsingHeaderState();
}

class _CollapsingHeaderState extends State<CollapsingHeader> {
  /// How far the bar has been pushed up by *gesture direction*, in [0,
  /// height]. Accumulates scroll deltas and is what makes an upward flick
  /// bring the bar back immediately, wherever the user happens to be.
  double _freeOffset = 0;

  /// Current scroll position, clamped to [0, height]. Caps [_freeOffset]
  /// near the top of the list — see the class docs, property 3.
  double _pinnedOffset = 0;

  double _lastPosition = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onScroll);
  }

  @override
  void didUpdateWidget(CollapsingHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onScroll);
      widget.controller.addListener(_onScroll);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (!widget.controller.hasClients) return;
    final position = widget.controller.position;

    // Ignore the rubber-band region at either end: an overscroll bounce is
    // not a decision to hide or show anything, and reacting to it makes the
    // bar flicker at the end of a fling.
    if (position.pixels < position.minScrollExtent ||
        position.pixels > position.maxScrollExtent) {
      _lastPosition = position.pixels;
      return;
    }

    final delta = position.pixels - _lastPosition;
    _lastPosition = position.pixels;

    final nextFree = (_freeOffset + delta).clamp(0.0, widget.height);
    final nextPinned = position.pixels.clamp(0.0, widget.height);

    if (nextFree == _freeOffset && nextPinned == _pinnedOffset) return;
    setState(() {
      _freeOffset = nextFree;
      _pinnedOffset = nextPinned.toDouble();
    });
  }

  /// The offset actually applied. `min` is what keeps the bar from ever
  /// covering content: within the first screenful it can be no further along
  /// than the content itself.
  double get _headerOffset =>
      _freeOffset < _pinnedOffset ? _freeOffset : _pinnedOffset;

  @override
  Widget build(BuildContext context) {
    final offset = _headerOffset;
    final progress = widget.height == 0
        ? 0.0
        : (offset / widget.height).clamp(0.0, 1.0);

    return Stack(
      children: [
        Positioned.fill(child: widget.child),
        Positioned(
          top: -offset,
          left: 0,
          right: 0,
          child: IgnorePointer(
            // Fully faded out means gone: leaving it hit-testable would put
            // an invisible bar over the first row of content.
            ignoring: progress > 0.95,
            child: Opacity(
              opacity: 1 - progress,
              child: Container(
                height: widget.height,
                color: widget.backgroundColor,
                child: widget.header,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Reports the user's scroll *direction* without rebuilding on every pixel —
/// for chrome that only cares about "am I going up or down", such as a FAB
/// that tucks away while a list is moving.
class ScrollDirectionNotifier extends ValueNotifier<ScrollDirection> {
  ScrollDirectionNotifier() : super(ScrollDirection.idle);

  bool handle(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.direction != value) {
      value = notification.direction;
    }
    return false;
  }
}
