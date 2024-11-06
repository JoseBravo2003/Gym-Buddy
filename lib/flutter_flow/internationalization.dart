import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Registro
  {
    '3xrl66pz': {
      'es': 'Crear cuenta',
      'en': 'Create account',
    },
    '9gvxjb04': {
      'es': 'Registrate para ingresar a la aplicacion',
      'en': 'Register to enter the application',
    },
    'ckdpjsob': {
      'es': 'Escribe tu nombre',
      'en': 'Write your name',
    },
    '3znvpfqw': {
      'es': 'Email',
      'en': 'E-mail',
    },
    'kq8vj5sx': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'zs0tekcx': {
      'es': 'Confirmar contraseña',
      'en': 'Confirm Password',
    },
    'bacmjyld': {
      'es': 'Registrarse ',
      'en': 'Register',
    },
    'nv66zr60': {
      'es': '¿Ya tienes una cuenta?',
      'en': 'Already have an account?',
    },
    'xl0njs5c': {
      'es': 'Haz click aqui',
      'en': 'Click here',
    },
    'ooouzwni': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Login1
  {
    'p0egr3pb': {
      'es': ' Gym Buddy',
      'en': 'Gym Buddy',
    },
    'i3c9fs9u': {
      'es': 'Email',
      'en': 'E-mail',
    },
    '6tow17v8': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    '8qvr54cj': {
      'es': 'Ingresar',
      'en': 'Get into',
    },
    'konw244d': {
      'es': '¿Aun no tienes cuenta?',
      'en': 'Don\'t have an account yet?',
    },
    'q7u6034m': {
      'es': 'Haz click aqui',
      'en': 'Click here',
    },
    'ca6lkw58': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Inicio
  {
    'iwwbpt9c': {
      'es': 'Ready to get fit?',
      'en': 'Ready to get fit?',
    },
    'xz4usort': {
      'es': 'Your journey to a healthier you starts here',
      'en': 'Your journey to a healthier you starts here',
    },
    '468ljrdr': {
      'es': 'Start Now',
      'en': 'Start Now',
    },
  },
  // PaginaPrincipal
  {
    'rhcxa68y': {
      'es': 'Welcome back, Alex!',
      'en': 'Welcome back, Alex!',
    },
    'al89suf9': {
      'es': 'Let\'s crush your fitness goals today',
      'en': 'Let\'s crush your fitness goals today',
    },
    'yzm19ylr': {
      'es': 'Today\'s Progress',
      'en': 'Today\'s Progress',
    },
    'v42tkt8d': {
      'es': 'Steps',
      'en': 'Steps',
    },
    'jfnrichw': {
      'es': '7,543 / 10,000',
      'en': '7,543 / 10,000',
    },
    'lk9t57vq': {
      'es': 'Calories Burned',
      'en': 'Calories Burned',
    },
    'mxgij85o': {
      'es': '420 / 600',
      'en': '420 / 600',
    },
    'qoeqbt2q': {
      'es': 'Active Minutes',
      'en': 'Active Minutes',
    },
    'es2hk9as': {
      'es': '45 / 60',
      'en': '45 / 60',
    },
    '7d8x0ohk': {
      'es': 'Quick Actions',
      'en': 'Quick Actions',
    },
    '77dkbj2k': {
      'es': 'Start Workout',
      'en': 'Start Workout',
    },
    'ge1tqyqy': {
      'es': 'Log Meal',
      'en': 'Log Meal',
    },
    'wy6s10sb': {
      'es': 'Weight',
      'en': 'Weight',
    },
    'z1yu9otn': {
      'es': 'Insights',
      'en': 'Insights',
    },
    'ddy6pr7g': {
      'es': 'Upcoming Workouts',
      'en': 'Upcoming Workouts',
    },
    'cac24yiq': {
      'es': 'Strength Training',
      'en': 'Strength Training',
    },
    'rflnhs18': {
      'es': 'Today, 6:00 PM',
      'en': 'Today, 6:00 PM',
    },
    '2f7j1ptl': {
      'es': 'Yoga Session',
      'en': 'Yoga Session',
    },
    '84tinh46': {
      'es': 'Tomorrow, 7:30 AM',
      'en': 'Tomorrow, 7:30 AM',
    },
    'l1tjwkbr': {
      'es': 'View All Workouts',
      'en': 'View All Workouts',
    },
  },
  // Miscellaneous
  {
    'osjbj17r': {
      'es': '',
      'en': '',
    },
    '08xz7cqo': {
      'es': '',
      'en': '',
    },
    'z87ztb6j': {
      'es': '',
      'en': '',
    },
    'xby4zwge': {
      'es': '',
      'en': '',
    },
    '13erkrno': {
      'es': '',
      'en': '',
    },
    'mo03ni0v': {
      'es': '',
      'en': '',
    },
    '0mxcy2tk': {
      'es': '',
      'en': '',
    },
    'cum1qrae': {
      'es': '',
      'en': '',
    },
    '0rovvv8y': {
      'es': '',
      'en': '',
    },
    '5xxiuj29': {
      'es': '',
      'en': '',
    },
    'nxldc34g': {
      'es': '',
      'en': '',
    },
    'wc2ptwns': {
      'es': '',
      'en': '',
    },
    'x4iya865': {
      'es': '',
      'en': '',
    },
    'uknmrzn3': {
      'es': '',
      'en': '',
    },
    'aalk9ukb': {
      'es': '',
      'en': '',
    },
    'okbiqzvi': {
      'es': '',
      'en': '',
    },
    'bt5c3e3e': {
      'es': '',
      'en': '',
    },
    'gmulz3ry': {
      'es': '',
      'en': '',
    },
    '1rkz9tjt': {
      'es': '',
      'en': '',
    },
    'moupwwi4': {
      'es': '',
      'en': '',
    },
    '9dbal8ar': {
      'es': '',
      'en': '',
    },
    'lcfqfo4b': {
      'es': '',
      'en': '',
    },
    'b65ss8gz': {
      'es': '',
      'en': '',
    },
    'oxlg3pst': {
      'es': '',
      'en': '',
    },
    '3xbiu6gu': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
