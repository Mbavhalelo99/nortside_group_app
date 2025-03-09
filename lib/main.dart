import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(BusinessDashboardApp());
}

class BusinessDashboardApp extends StatelessWidget {
  const BusinessDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}
