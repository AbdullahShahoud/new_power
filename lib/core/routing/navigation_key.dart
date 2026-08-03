import 'package:flutter/material.dart';

/// Global navigator key used for navigation outside of BuildContext
/// (e.g., from DioFactory's interceptor on a security-triggered logout).
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
