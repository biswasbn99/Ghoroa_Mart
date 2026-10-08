import 'package:flutter/material.dart';
import 'package:ghoroa_mart/l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext{
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}