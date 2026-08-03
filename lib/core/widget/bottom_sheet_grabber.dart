import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_colors.dart';

/// ✅ Draggable handle for bottom sheets
/// Visual indicator that allows users to drag the sheet up/down
class BottomSheetGrabber extends StatelessWidget {
  const BottomSheetGrabber({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40.w,
        height: 4.h,
        decoration: BoxDecoration(
          color: context.colors.Color10,
          borderRadius: BorderRadius.circular(2.r),
        ),
      ),
    );
  }
}
