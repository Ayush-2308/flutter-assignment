import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'screens/dashboard_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const DashboardApp());
}

class DashboardApp extends StatelessWidget {
  const DashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Office Dashboard',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 599, name: MOBILE),
          const Breakpoint(start: 600, end: 1099, name: TABLET),
          const Breakpoint(start: 1100, end: double.infinity, name: DESKTOP),
        ],
      ),
      home: const DashboardScreen(),
    );
  }
}
