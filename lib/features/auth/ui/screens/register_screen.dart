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
// import '../../../../core/widget/app_logo.dart';
import '../../../../core/widget/app_text_field.dart';
import '../../data/models/register_request.dart';
import '../../logic/register_cubit/register_cubit.dart';
import '../../logic/register_cubit/register_state.dart';
import '../widgets/password_strength_indicator.dart';
import '../widgets/password_text_field.dart';
import '../widgets/phone_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: const _RegisterScreenBody(),
    );
  }
}

class _RegisterScreenBody extends StatefulWidget {
  const _RegisterScreenBody();

  @override
  State<_RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<_RegisterScreenBody> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _managerCodeController = TextEditingController();
  final _phoneFieldKey = GlobalKey<PhoneTextFieldState>();

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
    _passwordController.removeListener(_onPasswordChanged);
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _managerCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<RegisterCubit, RegisterState>(
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
                    children: [
                      // verticalSpace(40.h),
                      // Center(child: AppLogo(height: 28.h)),
                      verticalSpace(30.h),
                      Text(
                        context.tr('register_title'),
                        style: context.textStyles.xl2Semibold,
                      ),
                      verticalSpace(28.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildNameRow(),
                            verticalSpace(12.h),
                            _buildEmailField(),
                            verticalSpace(12.h),
                            _buildPhoneField(),
                            verticalSpace(12.h),
                            _buildManagerCodeField(),
                            verticalSpace(12.h),
                            _buildPasswordField(),
                            verticalSpace(10.h),
                            if (_password.isNotEmpty)
                              PasswordStrengthIndicator(password: _password),
                            verticalSpace(18.h),
                            _buildConfirmPasswordField(),
                            verticalSpace(24.h),
                            _buildErrorText(state),
                            if (isRateLimited)
                              Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: Text(
                                  context
                                      .tr('error_rate_limited_register')
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
                              text: context.tr('create_account'),
                              isLoading: isLoading,
                              onPressed: (isLoading || isRateLimited)
                                  ? null
                                  : _onRegister,
                            ),
                            verticalSpace(22.h),
                            _buildLoginLink(context),
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

  Widget _buildNameRow() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFieldLabel(context.tr('first_name')),
              verticalSpace(5.h),
              AppTextField(
                hintText: context.tr('first_name_hint'),
                controller: _firstNameController,
                validator: (value) => AppValidators.name(context, value),
                keyboardType: TextInputType.name,
                autofillHints: const [AutofillHints.givenName],
              ),
            ],
          ),
        ),
        horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFieldLabel(context.tr('last_name')),
              verticalSpace(5.h),
              AppTextField(
                hintText: context.tr('last_name_hint'),
                controller: _lastNameController,
                validator: (value) => AppValidators.name(context, value),
                keyboardType: TextInputType.name,
                autofillHints: const [AutofillHints.familyName],
              ),
            ],
          ),
        ),
      ],
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
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) => AppValidators.validateEmail(value, context),
          autofillHints: const [AutofillHints.email],
        ),
      ],
    );
  }

  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(context.tr('phone_number')),
        verticalSpace(5.h),
        PhoneTextField(
          key: _phoneFieldKey,
          controller: _phoneController,
          validator: (value) => AppValidators.phone(context, value),
        ),
      ],
    );
  }

  Widget _buildManagerCodeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(context.tr('manager_code')),
        verticalSpace(5.h),
        AppTextField(
          hintText: context.tr('manager_code_hint'),
          controller: _managerCodeController,
          // Manager codes are always Latin/English content regardless of
          // app language — force LTR.
          textDirection: TextDirection.ltr,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return context.tr('error_empty_field');
            }
            return null;
          },
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

  Widget _buildConfirmPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(context.tr('confirm_password')),
        verticalSpace(5.h),
        PasswordTextField(
          hintText: context.tr('confirm_password_hint'),
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

  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: context.textStyles.smRegular.copyWith(fontWeight: FontWeight.w600),
    );
  }

  Widget _buildErrorText(RegisterState state) {
    return state.maybeWhen(
      error: (error, errorcode) => Padding(
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

  Widget _buildLoginLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: GestureDetector(
            onTap: () => context.pushReplacementNamed(Routes.loginScreen),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: context.textStyles.xsMedium,
                children: [
                  TextSpan(
                    text: context.tr('already_have_account'),
                    style: context.textStyles.smRegular,
                  ),
                  TextSpan(
                    text: context.tr('login'),
                    style: context.textStyles.smRegular.copyWith(
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

  void _handleStateChanges(BuildContext context, RegisterState state) {
    state.whenOrNull(
      success: (message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.tr('register_success')),
            backgroundColor: context.colors.success,
          ),
        );

        context.pushReplacementNamed(Routes.verifyOtpScreen);
      },
      rateLimited: (seconds) => _startRateLimitCountdown(seconds),
    );
  }

  void _onRegister() async {
    if (_formKey.currentState!.validate()) {
      final phoneState = _phoneFieldKey.currentState;
      final fullPhone = phoneState?.fullPhoneNumber ?? _phoneController.text;
      // UI layer only collects user input; the cubit fills in the six
      // DeviceInfo fields (device_service.dart) before calling the API.
      final request = RegisterRequest(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        email: _emailController.text.trim(),
        phone: fullPhone.trim(),
        password: _passwordController.text,
        managerCode: _managerCodeController.text.trim(),
        deviceId: '',
        deviceName: '',
        deviceType: '',
        deviceModel: '',
        osVersion: '',
        appVersion: '',
      );
      context.read<RegisterCubit>().register(request);
      _passwordController.clear();
      _confirmPasswordController.clear();
    }
  }
}
