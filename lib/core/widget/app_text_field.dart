import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_power/core/theming/app_colors.dart';
import 'package:new_power/core/widget/glow_animation.dart' show GlowAnimation;
import 'package:new_power/core/widget/shake_animation.dart';

import '../theming/app_radius.dart';
import '../theming/styles.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final TextDirection? textDirection;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final void Function(String)? onChanged;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final Color? fillColor;
  final bool enableMicroFeedback;

  const AppTextField({
    super.key,
    required this.hintText,
    this.validator,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines = 1,
    this.onChanged,
    this.textDirection,
    this.readOnly = false,
    this.inputFormatters,
    this.autofillHints,
    this.fillColor,
    this.enableMicroFeedback = true,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _hasError = false;
  bool _isFocused = false;

  late FocusNode _focusNode;
  late GlobalKey<FormFieldState> _formFieldKey;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _formFieldKey = GlobalKey<FormFieldState>();

    _focusNode.addListener(_onFocusChange);
    widget.controller?.addListener(_onTextChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    widget.controller?.removeListener(_onTextChange);
    super.dispose();
  }

  void _onFocusChange() {
    setState(() => _isFocused = _focusNode.hasFocus);
  }

  void _onTextChange() {
    // Validate on text change to clear error state
    if (_hasError) {
      _formFieldKey.currentState?.validate();
    }
  }

  @override
  Widget build(BuildContext context) {
    final field = ShakeAnimation(
      shake: _hasError && widget.enableMicroFeedback,
      child: GlowAnimation(
        isActive: _isFocused && !_hasError && widget.enableMicroFeedback,
        glowColor: context.colors.brand100,
        continuous: true,
        child: TextFormField(
          key: _formFieldKey,
          focusNode: _focusNode,
          controller: widget.controller,
          validator: (value) {
            final error = widget.validator?.call(value);
            if (mounted) {
              setState(() => _hasError = error != null);
              if (_hasError && widget.enableMicroFeedback) {
                HapticFeedback.heavyImpact();
              }
            }
            return error;
          },
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          maxLines: widget.maxLines,
          onChanged: (value) {
            // Clear error state on text change if error exists
            if (_hasError) {
              setState(() => _hasError = false);
            }
            widget.onChanged?.call(value);
          },
          style: context.textStyles.smRegular.copyWith(
            color: context.colors.textColor,
          ),
          textDirection: widget.textDirection,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: context.textStyles.smRegular.copyWith(
              color: context.colors.ink400,
            ),
            filled: true,
            fillColor: widget.fillColor ?? context.colors.surface,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 10.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.field),
              borderSide: BorderSide(color: context.colors.ink200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.field),
              borderSide: BorderSide(color: context.colors.ink200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.field),
              borderSide: BorderSide(
                color: context.colors.brand300,
                width: 2.w,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.field),
              borderSide: BorderSide(color: context.colors.error, width: 2.w),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.field),
              borderSide: BorderSide(color: context.colors.error, width: 2.w),
            ),
          ),
          readOnly: widget.readOnly,
          inputFormatters: widget.inputFormatters,
          autofillHints: widget.autofillHints,
        ),
      ),
    );

    // A forced textDirection (e.g. manager code / phone: always LTR content
    // regardless of app language) needs to wrap the whole field, not just
    // the TextFormField's own `textDirection` param — that alone only
    // affects text flow, not the hint/decoration layout which otherwise
    // still follows the ambient (possibly RTL) Directionality.
    if (widget.textDirection != null) {
      return Directionality(textDirection: widget.textDirection!, child: field);
    }
    return field;
  }
}
