import 'package:flutter/material.dart';
import 'package:todo/core/config/application_theme_manager.dart';
import 'package:todo/features/login/login_view.dart';
import 'package:todo/features/register/register_view.dart';
import 'package:todo/features/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationThemeManager.lightTheme,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        LoginView.routeName: (context) => const LoginView(),
        RegisterView.routeName: (context) => RegisterView(),
      },
    );
  }
}
