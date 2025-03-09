import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'package:provider/provider.dart';
import 'utils/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const BusinessDashboardApp(),
    ),
  );
}

class BusinessDashboardApp extends StatelessWidget {
  const BusinessDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'NortSide Group Management App',
      theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: const DashboardScreen(),
    );
  }
}
