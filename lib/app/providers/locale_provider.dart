import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier{
  final String _localKey='locale';

  Locale _currentLocale =Locale('en');

  List<Locale> get supportedLocales=>[
    Locale('en'),
    Locale('bn')
  ];
  Locale get currentLocale=>_currentLocale;
  void changeLocale(Locale locale){
    _currentLocale=locale;
    _saveCurrentLocale(locale);
    notifyListeners();
  }

  Future<void> init()async{
    await _setCurrentLocale();
  }
  

  Future<void> _saveCurrentLocale(Locale locale)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.setString(_localKey, locale.languageCode);
  }


  Future<void> _setCurrentLocale()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String? languageCode=sharedPreferences.getString(_localKey);
    if(languageCode!=null){
      _currentLocale=Locale(languageCode);
    }
  }
}