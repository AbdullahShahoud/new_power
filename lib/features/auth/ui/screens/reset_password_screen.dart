import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/helpers/validators.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/app_header.dart';
import '../../../../core/widget/app_text_field.dart';
import '../../logic/forgot_password_cubit/forgot_password_cubit.dart';
import '../../logic/forgot_password_cubit/forgot_password_state.dart';
import '../widgets/password_strength_indicator.dart';
import '../../../../core/widget/password_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Extract email from route arguments
    final email = ModalRoute.of(context)!.settings.arguments as String;
    // Create a new ForgotPasswordCubit instance for this screen
    // The cubit from the previous route is no longer available in the context
    return BlocProvider(
      create: (context) => getIt<ForgotPasswordCubit>(),
      child: _ResetPasswordBody(email: email),
    );
  }
}

class _ResetPasswordBody extends StatefulWidget {
  final String email;

  const _ResetPasswordBody({required this.email});

  @override
  State<_ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<_ResetPasswordBody> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _otpController = TextEditingController();
  String _password = '';
  int _rateLimitSeconds = 0;
  Timer? _rateLimitTimer;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_onPasswordChanged);
  }

  void _onPasswordChanged() {
    setState(() => _password = _passwordController.text);
  }

  void _startRateLimitCountdown(int seconds) {
    _rateLimitTimer?.cancel();
    setState(() => _rateLimitSeconds = seconds);
    _rateLimitTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_rateLimitSeconds <= 1) {
        t.cancel();
        setState(() => _rateLimitSeconds = 0);
      } else {
        setState(() => _rateLimitSeconds--);
      }
    });
  }

  @override
  void dispose() {
    _rateLimitTimer?.cancel();
    _otpController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
            listener: _handleStateChanges,
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                resettingPassword: () => true,
                orElse: () => false,
              );
              final isRateLimited = _rateLimitSeconds > 0;

              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 25.h,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        verticalSpace(16.h),
                        const AppHeader(title: 'reset_password_title'),
                        verticalSpace(30.h),
                        Text(
                          context.tr('reset_password_desc'),
                          style: context.textStyles.lgBold.copyWith(),
                        ),
                        verticalSpace(20.h),
                        // Reset code is 6-20 uppercase letters/digits
                        // (auth.md) — not a fixed 6-digit OTP, so a plain
                        // text field is used instead of the Pinput boxes.
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: AppTextField(
                            hintText: context.tr('reset_code_hint'),
                            controller: _otpController,
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(20),
                            ],
                            validator: (value) =>
                                AppValidators.validateResetCode(value, context),
                          ),
                        ),
                        verticalSpace(11.h),
                        _buildFieldPassword(),
                        if (_password.isNotEmpty)
                          PasswordStrengthIndicator(password: _password),
                        verticalSpace(18.h),
                        _buildFieldPasswordConfirme(),
                        verticalSpace(28.h),
                        _buildErrorText(state),
                        if (isRateLimited)
                          Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: Text(
                              context
                                  .tr('error_rate_limited_reset_password')
                                  .replaceAll(
                                    '{seconds}',
                                    '$_rateLimitSeconds',
                                  ),
                              style: context.textStyles.xsMedium.copyWith(
                                color: context.colors.error,
                              ),
                            ),
                          ),
                        AppButton(
                          text: context.tr('confirm'),
                          isLoading: isLoading,
                          onPressed: (isLoading || isRateLimited)
                              ? null
                              : _onResetPassword,
                        ),
                        verticalSpace(24.h),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFieldPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.tr('new_password'), style: context.textStyles.smRegular),
        verticalSpace(5.h),
        PasswordTextField(
          hintText: context.tr('new_password_hint'),
          controller: _passwordController,
          validator: (value) => AppValidators.validatePassword(value, context),
        ),
      ],
    );
  }

  Widget _buildFieldPasswordConfirme() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          context.tr('confirm_new_password'),
          style: context.textStyles.smRegular,
        ),
        verticalSpace(5.h),
        PasswordTextField(
          hintText: context.tr('confirm_new_password_hint'),
          controller: _confirmPasswordController,
          validator: (value) => AppValidators.validateConfirmPassword(
            context,
            value,
            _passwordController.text,
          ),
        ),
      ],
    );
  }

  Widget _buildErrorText(ForgotPasswordState state) {
    return state.maybeWhen(
      error: (error) => Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: Text(
          error,
          style: context.textStyles.xsMedium.copyWith(
            color: context.colors.error,
          ),
        ),
      ),
      orElse: () => const SizedBox.shrink(),
    );
  }

  void _handleStateChanges(BuildContext context, ForgotPasswordState state) {
    state.whenOrNull(
      passwordReset: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.tr('password_reset_success')),
            backgroundColor: context.colors.success,
          ),
        );
        // Clear the entire auth stack (forgot → reset) and go to login
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.loginScreen,
          (_) => false,
        );
      },
      rateLimited: (seconds) => _startRateLimitCountdown(seconds),
    );
  }

  void _onResetPassword() {
    if (_formKey.currentState!.validate()) {
      // Reset code alphabet is uppercase letters + digits (auth.md), not the
      // numeric-only OTP used for email/device verification.
      final error = AppValidators.validateResetCode(
        _otpController.text,
        context,
      );
      if (error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error), backgroundColor: context.colors.error),
        );
        return;
      }
      // Email is passed via route arguments, not stored in cubit state
      context.read<ForgotPasswordCubit>().resetPassword(
        code: _otpController.text,
        newPassword: _passwordController.text,
        email: widget.email,
      );
    }
  }
}
