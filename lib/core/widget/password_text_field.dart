import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';
import 'app_text_field.dart';

/// Password entry with a show/hide toggle, shared app-wide.
///
/// Lived under `features/auth/ui/widgets/` while sign-in was its only caller.
/// The change-password screen in the `user` feature needs exactly the same
/// control — a rep typing a password they cannot see, twice, into a form
/// that then rejects it for a typo is the worst version of that screen — so
/// it moved to `core/` rather than having `user` reach into `auth` for a
/// text field.
///
/// The reveal toggle is the whole point: `AppTextField(obscureText: true)`
/// gives an obscured field with no way to check what was typed.
class PasswordTextField extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const PasswordTextField({
    super.key,
    required this.hintText,
    this.validator,
    this.controller,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      autofillHints: const [AutofillHints.password],
      textDirection: TextDirection.ltr,
      hintText: widget.hintText,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: _obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: context.colors.Color70,
          size: 20.sp,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    );
  }
}
