import 'package:flutter/material.dart';

enum LanguageType { PORTUGUESE, ENGLISH }

const String PORTUGUESE = "pt";
const String ENGLISH = "en";
const String ASSETS_PATH_LOCALISATIONS = "assets/translations";
const Locale PORTUGUESE_LOCAL = Locale("pt", "BR");
const Locale ENGLISH_LOCAL = Locale("en", "US");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.PORTUGUESE:
        return PORTUGUESE;
      case LanguageType.ENGLISH:
        return ENGLISH;
    }
  }
}
