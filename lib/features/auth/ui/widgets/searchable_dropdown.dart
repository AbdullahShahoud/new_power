import 'package:flutter/material.dart';
// Widget currently returns an empty SizedBox; keep imports minimal

class SearchableDropdown extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final String? selectedItem;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const SearchableDropdown({
    super.key,
    required this.hintText,
    required this.items,
    this.selectedItem,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox();
    // DropdownSearch<String>(
    //   items:(filter, infiniteScrollProps) => items,
    //   selectedItem: selectedItem,
    //   onChanged: onChanged,
    //   validator: validator,
    //   decoratorProps: DropDownDecoratorProps(
    //     decoration: InputDecoration(
    //       hintText: hintText,
    //       hintStyle: TextStyles.font14GreyRegular,
    //       filled: true,
    //       fillColor: ColorsManager.inputBackground,
    //       contentPadding: EdgeInsets.symmetric(
    //         horizontal: 16.w,
    //         vertical: 16.h,
    //       ),
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(12.r),
    //         borderSide: BorderSide.none,
    //       ),
    //       enabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(12.r),
    //         borderSide: BorderSide.none,
    //       ),
    //       focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(12.r),
    //         borderSide: BorderSide(
    //           color: ColorsManager.mainColor,
    //           width: 2.w,
    //         ),
    //       ),
    //       errorBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(12.r),
    //         borderSide: BorderSide(
    //           color: ColorsManager.error,
    //           width: 2.w,
    //         ),
    //       ),
    //     ),
    //   ),
    //   popupProps: PopupProps.menu(
    //     showSearchBox: true,
    //     searchFieldProps: TextFieldProps(
    //       decoration: InputDecoration(
    //         hintText: 'ابحث...',
    //         hintStyle: TextStyles.font14GreyRegular,
    //         prefixIcon: Icon(
    //           Icons.search,
    //           color: ColorsManager.textSecondary,
    //         ),
    //         border: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(8.r),
    //         ),
    //       ),
    //       style: TextStyles.font14BlackRegular,
    //     ),
    //     itemBuilder: (context, item, isSelected,b) {
    //       return Padding(
    //         padding: EdgeInsets.symmetric(
    //           horizontal: 16.w,
    //           vertical: 12.h,
    //         ),
    //         child: Text(
    //           item,
    //           style: isSelected
    //               ? TextStyles.font14BlackBold.copyWith(
    //                   color: ColorsManager.mainColor,
    //                 )
    //               : TextStyles.font14BlackRegular,
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
