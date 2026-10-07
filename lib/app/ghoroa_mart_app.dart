import 'package:flutter/material.dart';
import 'package:ghoroa_mart/app/app_theme.dart';
import 'package:ghoroa_mart/app/routes.dart';
import 'package:ghoroa_mart/features/auth/presentation/screens/splash_screen.dart';

class GhoroaMartApp extends StatelessWidget {
  const GhoroaMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ghoroa Mart',
      initialRoute: SplashScreen.name,
      onGenerateRoute: AppRoutes.OnGenerateRoute,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}