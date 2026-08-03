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
import '../../../../core/widget/app_logo.dart';
import '../../../../core/widget/app_text_field.dart';
import '../../logic/login_cubit/login_cubit.dart';
import '../../logic/login_cubit/login_state.dart';
import '../widgets/password_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: const _LoginScreenBody(),
    );
  }
}

class _LoginScreenBody extends StatefulWidget {
  const _LoginScreenBody();

  @override
  State<_LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<_LoginScreenBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Rate-limit countdown
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
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: _handleStateChanges,
            builder: (context, state) {
              final isLoading = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              final isRateLimited = _rateLimitSeconds > 0;

              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      verticalSpace(100.h),
                      Center(child: AppLogo(height: 40.h)),
                      verticalSpace(60.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.tr('login_title'),
                              style: context.textStyles.xl2Semibold,
                            ),
                            verticalSpace(20.h),
                            _buildEmailField(),
                            verticalSpace(12.h),
                            _buildPasswordField(),
                            verticalSpace(8.h),
                            _buildForgotPasswordLink(),
                            verticalSpace(12.h),
                            _buildErrorText(state),
                            if (isRateLimited)
                              Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: Text(
                                  context
                                      .tr('error_rate_limited_login')
                                      .replaceFirst(
                                        '{seconds}',
                                        '$_rateLimitSeconds',
                                      ),
                                  textAlign: TextAlign.center,
                                  style: context.textStyles.xsMedium.copyWith(
                                    color: context.colors.error,
                                  ),
                                ),
                              ),
                            AppButton(
                              text: context.tr('login'),
                              isLoading: isLoading,
                              onPressed: (isLoading || isRateLimited)
                                  ? null
                                  : _onLogin,
                            ),
                            verticalSpace(22.h),
                            _buildCreateAccountLink(),
                            verticalSpace(120.h),
                            _buildDeviceLinkedInfo(),
                            verticalSpace(24.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(context.tr('email')),
        verticalSpace(5.h),
        AppTextField(
          hintText: context.tr('email_hint'),
          keyboardType: TextInputType.emailAddress,
          controller: _emailController,
          validator: (value) => AppValidators.validateEmail(value, context),
          autofillHints: const [AutofillHints.email],
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(context.tr('password')),
        verticalSpace(5.h),
        PasswordTextField(
          hintText: context.tr('password_hint'),
          controller: _passwordController,
          validator: (value) => AppValidators.validatePassword(value, context),
        ),
      ],
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(label, style: context.textStyles.smRegular);
  }

  Widget _buildForgotPasswordLink() {
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.forgotPasswordScreen),
      child: Text(
        context.tr('forgot_password'),
        style: context.textStyles.smRegular,
      ),
    );
  }

  Widget _buildErrorText(LoginState state) {
    return state.maybeWhen(
      error: (error, errorCode) {
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: Text(
            error,
            style: context.textStyles.xsMedium.copyWith(
              color: context.colors.error,
            ),
          ),
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }

  Widget _buildCreateAccountLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: GestureDetector(
            onTap: () => context.pushReplacementNamed(Routes.registerScreen),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: context.textStyles.xsMedium,
                children: [
                  TextSpan(
                    text: context.tr('dont_have_account'),
                    style: context.textStyles.smRegular,
                  ),
                  TextSpan(
                    text: context.tr('create_account'),
                    style: context.textStyles.smMedium.copyWith(
                      color: context.colors.textexternail,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDeviceLinkedInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.lock_outline, color: context.colors.ink400, size: 18.sp),
        horizontalSpace(8.w),
        Flexible(
          child: Text(
            context.tr('device_linked_info'),
            textAlign: TextAlign.center,
            style: context.textStyles.xsMedium,
          ),
        ),
      ],
    );
  }

  void _handleStateChanges(BuildContext context, LoginState state) {
    state.whenOrNull(
      rateLimited: (seconds) => _startRateLimitCountdown(seconds),
      success: (role) {
        context.pushNamedAndRemoveUntil(
          Routes.homeScreen,
          predicate: (_) => false,
        );
      },
      otpRequired: (verificationId) {
        context.pushNamed(Routes.verifyOtpScreen);
      },
      pendingApproval: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.tr('login_pending_approval')),
            backgroundColor: context.colors.primary,
            duration: const Duration(seconds: 30),
          ),
        );
      },
      twoFactorSetupRequired: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.tr('login_2fa_not_supported'))),
        );
      },
      twoFactorRequired: (verificationId) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.tr('login_2fa_not_supported'))),
        );
      },
    );
  }

  void _onLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(
        _emailController.text.trim(),
        _passwordController.text,
      );
      _passwordController.clear();
    }
  }
}
