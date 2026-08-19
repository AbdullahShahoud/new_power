import 'package:flutter/material.dart';
import 'package:new_power/core/routing/routes.dart';

import '../../features/auth/ui/screens/email_verification_screen.dart';
import '../../features/auth/ui/screens/forgot_password_screen.dart';
import '../../features/auth/ui/screens/login_screen.dart';
import '../../features/auth/ui/screens/register_screen.dart';
import '../../features/auth/ui/screens/reset_password_screen.dart';
import '../../features/home/ui/main_screen.dart';
import '../../features/home/ui/screens/notifications_screen.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';
import '../../features/projects/data/models/enums.dart';
import '../../features/projects/data/models/project_detail_view.dart';
import '../../features/catalog/data/models/localized.dart';
import '../../features/catalog/ui/screens/catalog_search_screen.dart';
import '../../features/catalog/ui/screens/category_screen.dart';
import '../../features/catalog/ui/screens/product_detail_screen.dart';
import '../../features/projects/ui/screens/account_contacts_screen.dart';
import '../../features/projects/ui/screens/account_picker_screen.dart';
import '../../features/projects/ui/screens/activity_detail_screen.dart';
import '../../features/projects/ui/screens/add_contact_screen.dart';
import '../../features/projects/ui/screens/add_stakeholder_link_screen.dart';
import '../../features/projects/ui/screens/contact_picker_screen.dart';
import '../../features/projects/ui/screens/decision_maker_history_screen.dart';
import '../../features/projects/ui/screens/edit_project_screen.dart';
import '../../features/projects/ui/screens/edit_stakeholder_link_screen.dart';
import '../../features/projects/ui/screens/log_activity_screen.dart';
import '../../features/projects/ui/screens/map_picker_screen.dart';
import '../../features/projects/ui/screens/offline_queue_screen.dart';
import '../../features/projects/ui/screens/outcome_detail_screen.dart';
import '../../features/projects/ui/screens/outcomes_list_screen.dart';
import '../../features/projects/ui/screens/project_detail_screen.dart';
import '../../features/projects/ui/screens/register_account_screen.dart';
import '../../features/projects/ui/screens/register_project_screen.dart';
import '../../features/projects/ui/screens/replace_stakeholder_link_screen.dart';
import '../../features/projects/ui/screens/submit_outcome_screen.dart';
import '../../features/user/ui/screens/change_password_screen.dart';
import '../../features/user/ui/screens/change_username_screen.dart';
import '../widget/startup_error_screen.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startupError:
        return _fadeRoute(const StartupErrorScreen(), settings);
      case Routes.onboardingScreen:
        return _fadeRoute(const OnboardingScreen(), settings);
      // ========================== Auth Routes ==========================
      case Routes.loginScreen:
        return _slideRoute(const LoginScreen(), settings);
      case Routes.registerScreen:
        return _slideRoute(const RegisterScreen(), settings);
      case Routes.forgotPasswordScreen:
        bool fromChangePassword = false;
        if (settings.arguments is Map) {
          final args = settings.arguments as Map;
          fromChangePassword = args['fromChangePassword'] as bool? ?? false;
        }
        return _slideRoute(
          ForgotPasswordScreen(fromChangePassword: fromChangePassword),
          settings,
        );
      case Routes.resetPasswordScreen:
        return _slideRoute(const ResetPasswordScreen(), settings);
      case Routes.verifyOtpScreen:
        return _slideRoute(const EmailVerificationScreen(), settings);
      // ========================== Home ===================================
      case Routes.homeScreen:
        return _fadeRoute(const MainScreen(), settings);
      case Routes.notificationsScreen:
        return _slideRoute(const NotificationsScreen(), settings);
      // ========================== Account settings ========================
      case Routes.changePasswordScreen:
        return _slideRoute(const ChangePasswordScreen(), settings);
      case Routes.changeUsernameScreen:
        final args = settings.arguments as Map?;
        return _slideRoute(
          ChangeUsernameScreen(
            currentUsername: args?['currentUsername'] as String?,
          ),
          settings,
        );
      // ========================== Projects ================================
      case Routes.registerProjectScreen:
        return _slideRoute(const RegisterProjectScreen(), settings);
      case Routes.projectDetailScreen:
        final args = settings.arguments as Map;
        return _slideRoute(
          ProjectDetailScreen(projectId: args['projectId'] as String),
          settings,
        );
      case Routes.editProjectScreen:
        final args = settings.arguments as Map;
        return _slideRoute(
          EditProjectScreen(project: args['project'] as ProjectDetailView),
          settings,
        );
      // ========================== Activities ==============================
      case Routes.logActivityScreen:
        final args = settings.arguments as Map;
        return _slideRoute(
          LogActivityScreen(
            projectId: args['projectId'] as String,
            stakeholders:
                args['stakeholders'] as List<StakeholderRefView>,
          ),
          settings,
        );
      case Routes.activityDetailScreen:
        final args = settings.arguments as Map;
        return _slideRoute(
          ActivityDetailScreen(
            activityId: args['activityId'] as String,
            projectClosed: args['projectClosed'] as bool? ?? false,
          ),
          settings,
        );
      // ========================== Outcomes =================================
      case Routes.submitOutcomeScreen:
        final args = settings.arguments as Map;
        return _slideRoute(
          SubmitOutcomeScreen(
            projectId: args['projectId'] as String,
            initialType:
                args['initialType'] as OutcomeType? ?? OutcomeType.lost,
          ),
          settings,
        );
      case Routes.outcomeDetailScreen:
        final args = settings.arguments as Map;
        return _slideRoute(
          OutcomeDetailScreen(outcomeId: args['outcomeId'] as String),
          settings,
        );
      case Routes.outcomesListScreen:
        return _slideRoute(const OutcomesListScreen(), settings);
      // ========================== Offline sync =============================
      case Routes.offlineQueueScreen:
        return _slideRoute(const OfflineQueueScreen(), settings);
      // ========================== Catalogue =================================
      case Routes.catalogCategoryScreen:
        final args = settings.arguments as Map;
        return _slideRoute(
          CategoryScreen(
            idOrSlug: args['idOrSlug'] as String,
            name: args['name'] as Localized?,
          ),
          settings,
        );
      case Routes.catalogSearchScreen:
        return _slideRoute(const CatalogSearchScreen(), settings);
      case Routes.productDetailScreen:
        final args = settings.arguments as Map;
        return _slideRoute(
          ProductDetailScreen(idOrSlug: args['idOrSlug'] as String),
          settings,
        );
      // ========================== Stakeholders ==============================
      case Routes.accountPickerScreen:
        // Optional: absent for plain stakeholder linking, set by the Won /
        // Lost pickers so the list opens filtered and browsable.
        final args = settings.arguments as Map?;
        return _slideRoute(
          AccountPickerScreen(
            classification:
                args?['classification'] as AccountClassification?,
          ),
          settings,
        );
      case Routes.registerAccountScreen:
        return _slideRoute(const RegisterAccountScreen(), settings);
      case Routes.contactPickerScreen:
        final args = settings.arguments as Map;
        return _slideRoute(
          ContactPickerScreen(accountId: args['accountId'] as String),
          settings,
        );
      case Routes.accountContactsScreen:
        final args = settings.arguments as Map;
        return _slideRoute(
          AccountContactsScreen(
            projectId: args['projectId'] as String,
            accountId: args['accountId'] as String,
            accountName: args['accountName'] as String,
          ),
          settings,
        );
      case Routes.addContactScreen:
        final args = settings.arguments as Map;
        return _slideRoute(
          AddContactScreen(accountId: args['accountId'] as String),
          settings,
        );
      case Routes.decisionMakerHistoryScreen:
        final args = settings.arguments as Map;
        return _slideRoute(
          DecisionMakerHistoryScreen(projectId: args['projectId'] as String),
          settings,
        );
      case Routes.addStakeholderLinkScreen:
        final args = settings.arguments as Map;
        return _slideRoute(
          AddStakeholderLinkScreen(
            projectId: args['projectId'] as String,
            existingLinks:
                (args['existingLinks'] as List<ProjectCompanyOption>?) ??
                const [],
          ),
          settings,
        );
      case Routes.editStakeholderLinkScreen:
        final args = settings.arguments as Map;
        return _slideRoute(
          EditStakeholderLinkScreen(
            projectId: args['projectId'] as String,
            linkId: args['linkId'] as String,
            accountId: args['accountId'] as String,
            initialContactName: args['initialContactName'] as String?,
            initialNote: args['initialNote'] as String?,
          ),
          settings,
        );
      case Routes.replaceStakeholderLinkScreen:
        final args = settings.arguments as Map;
        return _slideRoute(
          ReplaceStakeholderLinkScreen(
            projectId: args['projectId'] as String,
            linkId: args['linkId'] as String,
            outgoingAccountName: args['outgoingAccountName'] as String,
            roleLabel: args['roleLabel'] as String,
          ),
          settings,
        );
      // ========================== Map picker =================================
      case Routes.mapPickerScreen:
        final args = settings.arguments as Map? ?? const {};
        return _slideRoute(
          MapPickerScreen(
            initialLatitude: args['initialLatitude'] as double?,
            initialLongitude: args['initialLongitude'] as double?,
            showNearbyProjects: args['showNearbyProjects'] as bool? ?? false,
          ),
          settings,
        );
      default:
        return null;
    }
  }

  /// ✅ Slide + fade from right (smooth and natural motion)
  /// - Soft slide: 0.08 offset (not dramatic, just noticeable)
  /// - Soft fade: opacity follows animation curve
  /// - Duration: 250ms forward, 220ms reverse
  static PageRouteBuilder _slideRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 280),
      reverseTransitionDuration: const Duration(milliseconds: 240),
      pageBuilder: (context, animation, _) => page,
      transitionsBuilder: (context, animation, _, child) {
        final slideAnimation =
            Tween<Offset>(
              begin: const Offset(0.15, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            );

        final scaleAnimation = Tween<double>(begin: 0.97, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
        );

        return ScaleTransition(
          scale: scaleAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: FadeTransition(opacity: animation, child: child),
          ),
        );
      },
    );
  }

  /// Fade transition (for top-level screens like home, onboarding)
  static PageRouteBuilder _fadeRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeIn),
          child: child,
        );
      },
    );
  }
}
