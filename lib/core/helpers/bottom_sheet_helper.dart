import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_colors.dart';
import '../widget/bottom_sheet_grabber.dart';

/// ✅ Bottom Sheet Animation Helper
/// Shows a modal bottom sheet with smooth slide-up animation and drag support
///
/// Features:
/// - Slide up from bottom with smooth animation
/// - Draggable handle with DraggableScrollableSheet
/// - Dimmed backdrop (40% opacity)
/// - Customizable sizes and background color
/// - Support for scrollable and non-scrollable content
///
/// Usage:
/// ```dart
/// // For simple content (wrapped in ListView)
/// await showAnimatedBottomSheet(
///   context: context,
///   initialChildSize: 0.45,
///   builder: (context) => YourSimpleContent(),
/// );
///
/// // For scrollable content with own scroll controller
/// await showAnimatedBottomSheet(
///   context: context,
///   initialChildSize: 0.45,
///   useScrollWrapper: false,
///   builder: (context) => YourScrollableContent(),
/// );
/// ```
Future<T?> showAnimatedBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  double initialChildSize = 0.45,
  double minChildSize = 0.3,
  double maxChildSize = 0.85,
  bool enableGrabber = true,
  bool useScrollWrapper = true,
  Color? backgroundColor,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    backgroundColor: backgroundColor ?? context.colors.Color13,
    builder: (bottomSheetContext) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: DraggableScrollableSheet(
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          expand: false,
          builder: (sheetContext, scrollController) {
            return ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              child: Container(
                decoration: BoxDecoration(
                  // color: (backgroundColor ?? sheetContext.colors.Color10),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                  border: Border(
                    top: BorderSide(
                      color: sheetContext.colors.Color10,
                      width: 1,
                    ),
                  ),
                ),
                child: useScrollWrapper
                    ? _ScrollableContent(
                        scrollController: scrollController,
                        enableGrabber: enableGrabber,
                        builder: builder,
                        bottomSheetContext: bottomSheetContext,
                      )
                    : _NonScrollableContent(
                        enableGrabber: enableGrabber,
                        builder: builder,
                        bottomSheetContext: bottomSheetContext,
                      ),
              ),
            );
          },
        ),
      );
    },
  );
}

class _ScrollableContent extends StatelessWidget {
  final ScrollController scrollController;
  final bool enableGrabber;
  final WidgetBuilder builder;
  final BuildContext bottomSheetContext;

  const _ScrollableContent({
    required this.scrollController,
    required this.enableGrabber,
    required this.builder,
    required this.bottomSheetContext,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        if (enableGrabber) ...[
          SizedBox(height: 12.h),
          const BottomSheetGrabber(),
          SizedBox(height: 12.h),
        ] else
          SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: builder(bottomSheetContext),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}

class _NonScrollableContent extends StatelessWidget {
  final bool enableGrabber;
  final WidgetBuilder builder;
  final BuildContext bottomSheetContext;

  const _NonScrollableContent({
    required this.enableGrabber,
    required this.builder,
    required this.bottomSheetContext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (enableGrabber) ...[
          SizedBox(height: 12.h),
          const BottomSheetGrabber(),
          SizedBox(height: 12.h),
        ] else
          SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: builder(bottomSheetContext),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
