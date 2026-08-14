import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/app_shadows.dart';
import '../../../../core/theming/styles.dart';

/// A collapsible card section: leading icon, title, optional trailing
/// summary, and a chevron that rotates as it opens.
///
/// Built on the §5 Card recipe (`surface` + `rounded-card` + `shadow-card`)
/// so an expandable section is visually the same object as the static
/// `_SectionCard`s elsewhere in the app — the only difference is that its
/// body is revealed on tap. The header is the full card width so the whole
/// row is the tap target, not just the chevron.
///
/// Uses `AnimatedCrossFade` rather than Material's `ExpansionTile`: the
/// latter brings its own divider/padding/typography defaults that don't
/// match the documented design system, and overriding all of them is more
/// code than owning the ~40 lines here.
class ExpandableSection extends StatefulWidget {
  final IconData icon;
  final String title;

  /// Small muted text on the header's trailing edge — a count, a status,
  /// anything that makes the section scannable while collapsed.
  final String? trailingLabel;

  /// Tinted pill instead of plain muted text for [trailingLabel]. Used
  /// where the summary is a state worth noticing (e.g. "needs attention").
  final Color? trailingLabelColor;

  final bool initiallyExpanded;
  final Widget child;

  const ExpandableSection({
    super.key,
    required this.icon,
    required this.title,
    required this.child,
    this.trailingLabel,
    this.trailingLabelColor,
    this.initiallyExpanded = false,
  });

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  late bool _expanded = widget.initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header — deliberately an InkWell-free GestureDetector, matching
          // the app's no-ripple interaction language (see PressableScale).
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
              child: Row(
                children: [
                  Container(
                    width: 30.w,
                    height: 30.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: _expanded ? colors.brand50 : colors.ink50,
                      borderRadius: BorderRadius.circular(AppRadius.field),
                    ),
                    child: Icon(
                      widget.icon,
                      size: 16.sp,
                      color: _expanded ? colors.brand600 : colors.ink600,
                    ),
                  ),
                  horizontalSpace(10),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: context.textStyles.smBold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (widget.trailingLabel != null) ...[
                    horizontalSpace(8),
                    _TrailingLabel(
                      label: widget.trailingLabel!,
                      color: widget.trailingLabelColor,
                    ),
                  ],
                  horizontalSpace(6),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOutCubic,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 22.sp,
                      color: colors.textColor70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity),
            secondChild: Padding(
              padding: EdgeInsets.fromLTRB(14.w, 0, 14.w, 14.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(height: 1, color: colors.ink200),
                  verticalSpace(12.h),
                  widget.child,
                ],
              ),
            ),
            crossFadeState: _expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 220),
            sizeCurve: Curves.easeOutCubic,
          ),
        ],
      ),
    );
  }
}

class _TrailingLabel extends StatelessWidget {
  final String label;
  final Color? color;

  const _TrailingLabel({required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    if (color == null) {
      return Text(label, style: context.textStyles.xsMedium);
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: color!.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        label,
        style: context.textStyles.xsSemibold.copyWith(color: color),
      ),
    );
  }
}
