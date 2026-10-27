import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ghoroa_mart/app/app_theme.dart';
import 'package:ghoroa_mart/app/providers/locale_provider.dart';
import 'package:ghoroa_mart/app/routes.dart';
import 'package:ghoroa_mart/features/auth/presentation/screens/splash_screen.dart';
import 'package:ghoroa_mart/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class GhoroaMartApp extends StatefulWidget {
  const GhoroaMartApp({super.key});

  @override
  State<GhoroaMartApp> createState() => _GhoroaMartAppState();
}

class _GhoroaMartAppState extends State<GhoroaMartApp> {
  final LocaleProvider _localeProvider = LocaleProvider();

  @override
  void initState() {
    super.initState();
    _localeProvider.init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: _localeProvider)],
      child: Consumer<LocaleProvider>(
        builder: (context, _, _) {
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

            onGenerateRoute: AppRoutes.OnGenerateRoute,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            supportedLocales: _localeProvider.supportedLocales,
            locale: _localeProvider.currentLocale,
          );
        },
      ),
    );
  }
}
