import 'dart:ui';

class LocalizationHelper {
  static const String localeVN = 'vi';
  static const String localeEN = 'en';

  static List<Locale> get supportedLocale =>
      [const Locale(localeVN), const Locale(localeEN)];
}
