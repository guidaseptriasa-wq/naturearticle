import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/forgot_page.dart';
import 'screens/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.green[50],
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/forgot': (context) => const ForgotPasswordPage(),
        '/dashboard': (context) => DashboardPage(),
      },
    );
  }
}