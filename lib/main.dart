import 'package:flutter/material.dart';
import 'package:topshop/core/configs/theme/app_theme.dart';
import 'package:topshop/presentation/spash/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.appTheme,
      home: const SplashPage(),
    );
  }
}
