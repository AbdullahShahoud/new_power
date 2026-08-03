import 'dart:ui';

import 'package:flutter/material.dart';

import '../theming/app_colors.dart';

/// Reusable glass-morphism dropdown with search capability
/// Matches KYC personal info screen design
class GlassDropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final String placeholder;
  final ValueChanged<String?> onChanged;
  final bool enabled;
  final TextStyle? textStyle;

  const GlassDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.placeholder,
    required this.onChanged,
    this.enabled = true,
    this.textStyle,
  });

  void _showDropdownDialog(BuildContext context) {
    List<String> filteredItems = items;
    // TextEditingController searchController = TextEditingController();

    showDialog(
      context: context,
      barrierColor: Colors.white.withValues(alpha: 0.25),
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Center(
              child: Container(
                width: 300,
                constraints: const BoxConstraints(maxHeight: 500),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.25),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Items List — StatefulBuilder wraps both search
                    // and list so onChanged can trigger a single rebuild.
                    Expanded(
                      child: StatefulBuilder(
                        builder: (context, setFilterState) {
                          return Column(
                            children: [
                              // Search Field
                              // TextField(
                              //   controller: searchController,
                              //   onChanged: (query) {
                              //     setFilterState(() {
                              //       filteredItems = items
                              //           .where(
                              //             (item) => item
                              //                 .toLowerCase()
                              //                 .contains(query.toLowerCase()),
                              //           )
                              //           .toList();
                              //     });
                              //   },
                              //   decoration: InputDecoration(
                              //     hintText: 'Search...',
                              //     hintStyle: TextStyle(
                              //       color: Colors.white.withValues(alpha: 0.5),
                              //     ),
                              //     prefixIcon: Icon(
                              //       Icons.search,
                              //       color: Colors.white.withValues(alpha: 0.5),
                              //     ),
                              //     border: OutlineInputBorder(
                              //       borderRadius: BorderRadius.circular(8),
                              //       borderSide: BorderSide(
                              //         color: Colors.white.withValues(alpha: 0.2),
                              //       ),
                              //     ),
                              //     contentPadding: const EdgeInsets.symmetric(
                              //       horizontal: 12,
                              //       vertical: 8,
                              //     ),
                              //   ),
                              //   style: const TextStyle(color: Colors.white),
                              // ),
                              // const SizedBox(height: 12),
                              Expanded(
                                child: filteredItems.isEmpty
                                    ? Center(
                                        child: Text(
                                          'No results found',
                                          style: TextStyle(
                                            color: Colors.white.withValues(
                                              alpha: 0.5,
                                            ),
                                          ),
                                        ),
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: filteredItems.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(
                                              filteredItems[index],
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.pop(context);
                                              onChanged(filteredItems[index]);
                                            },
                                          );
                                        },
                                      ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? () => _showDropdownDialog(context) : null,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: context.colors.Color13,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value?.isEmpty ?? true ? placeholder : value!,
              style:
                  textStyle ??
                  TextStyle(
                    color: (value?.isEmpty ?? true)
                        ? context.colors.textColor70
                        : context.colors.textColor,
                  ),
            ),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}
