import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const MentalHealthSuiteApp());
}

class MentalHealthSuiteApp extends StatelessWidget {
  const MentalHealthSuiteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saúde Mental Multi-App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}