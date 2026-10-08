import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ghoroa_mart/app/app_theme.dart';
import 'package:ghoroa_mart/app/routes.dart';
import 'package:ghoroa_mart/features/auth/presentation/screens/splash_screen.dart';
import 'package:ghoroa_mart/l10n/app_localizations.dart';

class GhoroaMartApp extends StatelessWidget {
  const GhoroaMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ghoroa Mart',
      initialRoute: SplashScreen.name,

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // Spanish
      ],

      supportedLocales: [Locale('en'), Locale('bn')],

      locale: Locale('en'),

      onGenerateRoute: AppRoutes.OnGenerateRoute,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
