import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/helpers/validators.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/app_header.dart';
import '../../logic/email_verification_cubit/email_verification_cubit.dart';
import '../../logic/email_verification_cubit/email_verification_state.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EmailVerificationCubit>(),
      child: const _EmailVerificationBody(),
    );
  }
}

class _EmailVerificationBody extends StatefulWidget {
  const _EmailVerificationBody();

  @override
  State<_EmailVerificationBody> createState() => _EmailVerificationBodyState();
}

class _EmailVerificationBodyState extends State<_EmailVerificationBody> {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();

  // late String _verificationId;
  int _remainingSeconds = 60;
  Timer? _timer;

  // Rate-limit countdown
  int _rateLimitSeconds = 0;
  Timer? _rateLimitTimer;

  @override
  void initState() {
    super.initState();

    _startTimer();
  }

  void _startTimer() {
    _remainingSeconds = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          timer.cancel();
        }
      });
    });
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
    _pinController.dispose();
    _focusNode.dispose();
    _timer?.cancel();
    _rateLimitTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 44.w,
      height: 76.h,
      textStyle: context.textStyles.xl2Semibold,
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.field),
        border: Border.all(color: context.colors.ink200),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: context.colors.brand300, width: 2),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: context.colors.brand300.withAlpha(128)),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: context.colors.error, width: 2),
      ),
    );

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SafeArea(
            child: BlocConsumer<EmailVerificationCubit, EmailVerificationState>(
              listener: _handleStateChanges,
              builder: (context, state) {
                final isVerifying = state.maybeWhen(
                  verifying: () => true,
                  orElse: () => false,
                );
                final isResending = state.maybeWhen(
                  resendingCode: () => true,
                  orElse: () => false,
                );
                final isRateLimited = _rateLimitSeconds > 0;

                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 20.h,
                    ),
                    child: Column(
                      children: [
                        verticalSpace(16.h),
                        const AppHeader(title: 'verify_email_title'),
                        verticalSpace(30.h),
                        Text(
                          context.tr('enter_code'),
                          style: context.textStyles.lgBold,
                        ),
                        _buildMailIllustration(),
                        verticalSpace(30.h),

                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Pinput(
                            controller: _pinController,
                            focusNode: _focusNode,
                            length: 6,
                            defaultPinTheme: defaultPinTheme,
                            focusedPinTheme: focusedPinTheme,
                            submittedPinTheme: submittedPinTheme,
                            errorPinTheme: errorPinTheme,
                            keyboardType: TextInputType.number,
                            autofocus: true,
                            enabled: !isVerifying && !isRateLimited,
                            separatorBuilder: (index) => SizedBox(width: 8.w),
                            onCompleted: (pin) {
                              _onVerify();
                            },
                          ),
                        ),
                        verticalSpace(24.h),
                        _buildErrorText(state),
                        if (isRateLimited)
                          Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: Text(
                              context
                                  .tr('error_rate_limited_otp')
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
                          text: context.tr('confirm'),
                          isLoading: isVerifying,
                          onPressed: (isVerifying || isRateLimited)
                              ? null
                              : _onVerify,
                        ),
                        verticalSpace(22.h),
                        _buildResendSection(isResending),
                        verticalSpace(12.h),
                        _buildChangeEmailLink(),
                        verticalSpace(24.h),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMailIllustration() {
    return Image.asset(
      'assets/images/otp.png',
      // width: 400.w,
      height: 200.h,
    );
  }

  Widget _buildErrorText(EmailVerificationState state) {
    return state.maybeWhen(
      error: (error) => Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: Text(
          error,
          style: context.textStyles.smRegular.copyWith(
            color: context.colors.error,
          ),
        ),
      ),
      orElse: () => const SizedBox.shrink(),
    );
  }

  Widget _buildResendSection(bool isResending) {
    if (isResending) {
      return SizedBox(
        height: 20.h,
        width: 20.w,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: context.colors.primary,
        ),
      );
    }

    return GestureDetector(
      onTap: _remainingSeconds == 0
          ? () {
              context.read<EmailVerificationCubit>().resendCode();
              _startTimer();
            }
          : null,
      child: Text.rich(
        TextSpan(
          style: context.textStyles.xsMedium,
          children: [
            TextSpan(text: '${context.tr('resend_code')} '),
            TextSpan(
              text: '$_remainingSeconds ${context.tr('seconds')}',
              style: context.textStyles.xsMedium.copyWith(
                color: context.colors.textexternail,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChangeEmailLink() {
    return GestureDetector(
      onTap: () => context.pop(),
      child: Text(
        context.tr('change_email'),
        style: context.textStyles.xsMedium.copyWith(
          color: context.colors.primary,
          decorationColor: context.colors.primary,
        ),
      ),
    );
  }

  void _handleStateChanges(BuildContext context, EmailVerificationState state) {
    state.whenOrNull(
      rateLimited: (seconds) => _startRateLimitCountdown(seconds),
      verified: (role) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.tr('email_verified')),
            backgroundColor: context.colors.success,
          ),
        );
        context.pushNamedAndRemoveUntil(
          Routes.homeScreen,
          predicate: (_) => false,
        );
      },
      pendingApproval: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.tr('login_pending_approval')),
            duration: const Duration(seconds: 30),
          ),
        );
        context.pushReplacementNamed(Routes.loginScreen);
      },
      roleNotAllowed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.tr('login_role_not_allowed')),
            backgroundColor: context.colors.error,
            duration: const Duration(seconds: 8),
          ),
        );
        context.pushReplacementNamed(Routes.loginScreen);
      },
      twoFactorSetupRequired: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.tr('login_2fa_not_supported'))),
        );
      },
      twoFactorRequired: (verificationId) {
        // Same screen, new verificationId — the cubit already re-armed the
        // stored verificationId; just reset the code field for a second entry.
        _pinController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.tr('login_2fa_not_supported'))),
        );
      },
      codeResent: (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.tr('code_resent')),
            backgroundColor: context.colors.success,
          ),
        );
      },
    );
  }

  void _onVerify() {
    final error = AppValidators.validateOtp(_pinController.text, context);
    if (error != null) {
      context.read<EmailVerificationCubit>().emitError(error);
      return;
    }
    context.read<EmailVerificationCubit>().verifyCode(_pinController.text);
  }
}
