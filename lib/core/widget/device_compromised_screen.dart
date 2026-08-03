import 'dart:io';

import 'package:flutter/material.dart';

import '../theming/app_colors.dart';
import '../theming/app_radius.dart';
import '../theming/app_themes.dart';
import '../theming/styles.dart';

/// Minimal standalone app shown when the device is rooted or jailbroken.
/// Runs entirely outside the normal routing/DI setup so it cannot be bypassed
/// by navigating to another route. Still uses [AppThemes.darkTheme] so the
/// standard `context.colors`/`context.textStyles` design tokens resolve
/// normally here too.
class DeviceCompromisedApp extends StatelessWidget {
  const DeviceCompromisedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.darkTheme,
      home: const _DeviceCompromisedScreen(),
    );
  }
}

class _DeviceCompromisedScreen extends StatelessWidget {
  const _DeviceCompromisedScreen();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.page,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.security_update_warning_rounded,
                size: 80,
                color: colors.error,
              ),
              const SizedBox(height: 24),
              Text(
                'Security Alert',
                style: context.textStyles.xl2Semibold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'This app cannot run on rooted or jailbroken devices.\n\n'
                'Your device appears to have been modified, which may '
                'expose your financial data to unauthorized access.',
                style: context.textStyles.smRegular,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: colors.error,
                  side: BorderSide(color: colors.error),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.field),
                  ),
                ),
                onPressed: () => exit(0),
                icon: const Icon(Icons.exit_to_app),
                label: Text('Exit App', style: context.textStyles.smMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
