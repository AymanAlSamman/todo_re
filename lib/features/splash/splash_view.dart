import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/login/login_view.dart';
import 'package:todo/layout_view.dart';
import 'package:todo/settings_provider.dart';

class SplashView extends StatefulWidget {
  static const String routeName = '/';

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LoginView.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);
    return Scaffold(
      backgroundColor:
          vm.isDark() ? const Color(0xff060E1E) : const Color(0xffDFECDB),
      body: Center(child: Image.asset('assets/images/todo_logo.png')),
    );
  }
}
