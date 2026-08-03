import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions.dart';
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

class ForgotPasswordScreen extends StatelessWidget {
  final bool fromChangePassword;

  const ForgotPasswordScreen({super.key, this.fromChangePassword = false});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgotPasswordCubit>(),
      child: _ForgotPasswordBody(fromChangePassword: fromChangePassword),
    );
  }
}

class _ForgotPasswordBody extends StatefulWidget {
  final bool fromChangePassword;

  const _ForgotPasswordBody({this.fromChangePassword = false});

  @override
  State<_ForgotPasswordBody> createState() => _ForgotPasswordBodyState();
}

class _ForgotPasswordBodyState extends State<_ForgotPasswordBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  int _rateLimitSeconds = 0;
  Timer? _rateLimitTimer;

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
    _emailController.dispose();
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
                sendingCode: () => true,
                orElse: () => false,
              );
              final isRateLimited = _rateLimitSeconds > 0;

              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 20.h,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(16.h),
                        const AppHeader(title: 'forgot_password_title'),
                        verticalSpace(30.h),
                        Text(
                          context.tr('forgot_password_desc'),
                          style: context.textStyles.lgBold.copyWith(
                            fontSize: 17.sp,
                          ),
                        ),
                        verticalSpace(28.h),
                        _buildFieldLabel(context.tr('email')),
                        verticalSpace(5.h),
                        AppTextField(
                          hintText: context.tr('email_hint'),
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>
                              AppValidators.validateEmail(value, context),
                          autofillHints: const [AutofillHints.email],
                        ),
                        verticalSpace(28.h),
                        _buildErrorText(state),
                        if (isRateLimited)
                          Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: Text(
                              context
                                  .tr('error_rate_limited_forgot_password')
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
                          text: context.tr('send_reset_code'),
                          isLoading: isLoading,
                          onPressed: (isLoading || isRateLimited)
                              ? null
                              : _onSendCode,
                        ),
                        verticalSpace(22.h),
                        if (!widget.fromChangePassword) _buildBackToLoginLink(),
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

  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: context.textStyles.smRegular.copyWith(fontWeight: FontWeight.w600),
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

  Widget _buildBackToLoginLink() {
    return Center(
      child: GestureDetector(
        onTap: () => context.pop(),
        child: Text(
          context.tr('back_to_login'),
          style: context.textStyles.xsMedium.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  void _handleStateChanges(BuildContext context, ForgotPasswordState state) {
    state.whenOrNull(
      codeSent: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.tr('code_sent')),
            backgroundColor: context.colors.success,
          ),
        );
        // Use pushNamed (NOT pushReplacementNamed) so the BlocProvider that
        // owns the ForgotPasswordCubit stays alive in the navigation stack.
        // pushReplacementNamed would dispose this screen → close the cubit →
        // cause "Cannot emit after calling close" on the reset screen.
        // Pass email as route argument instead of storing in cubit state
        context.pushNamed(
          Routes.resetPasswordScreen,
          arguments: _emailController.text.trim(),
        );
      },
      rateLimited: (seconds) => _startRateLimitCountdown(seconds),
    );
  }

  void _onSendCode() {
    if (_formKey.currentState!.validate()) {
      context.read<ForgotPasswordCubit>().sendResetCode(
        _emailController.text.trim(),
      );
    }
  }
}
