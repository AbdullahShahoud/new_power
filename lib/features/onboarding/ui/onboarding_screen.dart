import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/cache_helper.dart';
import '../../../core/helpers/extensions.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_radius.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widget/app_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, String>> _getPages(BuildContext context) {
    return [
      {
        'title': context.tr('onboarding_title_1'),
        'subtitle': context.tr('onboarding_subtitle_1'),
        'asset': 'assets/images/onbarding1.png',
      },
      {
        'title': context.tr('onboarding_title_2'),
        'subtitle': context.tr('onboarding_subtitle_2'),
        'asset': 'assets/images/onbarding2.png',
      },
      {
        'title': context.tr('onboarding_title_3'),
        'subtitle': context.tr('onboarding_subtitle_3'),
        'asset': 'assets/images/onbarding3.png',
      },
    ];
  }

  void _finishOnboarding() async {
    await CacheHelper.saveData(key: CacheHelper.onBoarding, value: true);
    if (!mounted) return;
    context.pushReplacementNamed(Routes.loginScreen);
  }

  void _next(BuildContext context) {
    if (_currentPage == _getPages(context).length - 1) {
      _finishOnboarding();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = _getPages(context);
    final colors = context.colors;
    final isLastPage = _currentPage == pages.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                reverse: context.isArabic,
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemBuilder: (context, index) {
                  final item = pages[index];
                  return _OnboardingItem(item: item);
                },
              ),
            ),

            // Dots — first dot starts from the left in Arabic, from the
            // right in English (explicit per-locale request, opposite of
            // the default RTL/LTR mirroring).
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Row(
                textDirection: context.isArabic
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pages.length,
                  (i) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                    width: _currentPage == i ? 27.w : 10.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      color: _currentPage == i
                          ? colors.brand500
                          : colors.Color13,
                      borderRadius: BorderRadius.circular(AppRadius.full),
                      boxShadow: _currentPage == i
                          ? [
                              BoxShadow(
                                color: colors.brand500.withValues(alpha: 0.22),
                                spreadRadius: 2,
                              ),
                            ]
                          : null,
                    ),
                  ),
                ),
              ),
            ),

            // Actions area
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: isLastPage
                  ? Column(
                      children: [
                        AppButton(
                          text: context.tr('login'),
                          onPressed: _finishOnboarding,
                        ),
                        verticalSpace(15.h),
                        GestureDetector(
                          onTap: () async {
                            await CacheHelper.saveData(
                              key: CacheHelper.onBoarding,
                              value: true,
                            );
                            if (!context.mounted) return;
                            context.pushReplacementNamed(Routes.registerScreen);
                          },
                          child: RichText(
                            text: TextSpan(
                              style: context.textStyles.xsMedium,
                              children: [
                                TextSpan(
                                  text: context.tr('already_have_account'),
                                ),
                                TextSpan(
                                  text: context.tr('create_account'),
                                  style: context.textStyles.xsMedium.copyWith(
                                    color: colors.textexternail,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        GestureDetector(
                          onTap: () => _next(context),
                          child: Container(
                            width: 56.w,
                            height: 56.h,
                            decoration: BoxDecoration(
                              color: colors.brand500,
                              borderRadius: BorderRadius.circular(
                                AppRadius.field,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: colors.brand500.withValues(
                                    alpha: 0.26,
                                  ),
                                  blurRadius: 18,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: colors.white,
                              size: 28.sp,
                            ),
                          ),
                        ),
                        const Spacer(),

                        TextButton(
                          onPressed: _finishOnboarding,
                          child: Text(
                            context.tr('skip'),
                            style: context.textStyles.smMedium,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingItem extends StatelessWidget {
  const _OnboardingItem({required this.item});

  final Map<String, String> item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustration
          Image.asset(
            item['asset']!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 277.h,
          ),
          verticalSpace(50.h),
          Text(
            item['title']!,
            textAlign: TextAlign.center,
            style: context.textStyles.lgBold,
          ),
          verticalSpace(12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              item['subtitle']!,
              textAlign: TextAlign.center,
              style: context.textStyles.smRegular,
            ),
          ),
        ],
      ),
    );
  }
}
