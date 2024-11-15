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
  // Perfil
  {
    'rktkr0qr': {
      'es': 'Perfil',
      'en': 'Profile',
    },
    'd7ivydiz': {
      'es': 'Maria Arias',
      'en': 'Maria Arias',
    },
    '4eokw301': {
      'es': 'Editar perfil',
      'en': 'Edit profile',
    },
    '7d1d2cr1': {
      'es': 'Informacion Personal',
      'en': 'Personal Information',
    },
    'vf53zgtj': {
      'es': 'Correo',
      'en': 'Mail',
    },
    'xcunfq9n': {
      'es': 'maria.arias@email.com',
      'en': 'maria.arias@email.com',
    },
    'z3ewl9nl': {
      'es': 'Peso',
      'en': 'Weight',
    },
    'cuelss07': {
      'es': '75 kg',
      'en': '75 kg',
    },
    '3ws9tmhv': {
      'es': 'Altura',
      'en': 'Height',
    },
    '6yy1574i': {
      'es': '180 cm',
      'en': '180 cm',
    },
    'zvnwqtkn': {
      'es': 'Genero',
      'en': 'Gender',
    },
    'j6ozhlka': {
      'es': 'Mujer',
      'en': 'Women',
    },
    'a1ntavh8': {
      'es': 'Edad',
      'en': 'Age',
    },
    '1adv7c5z': {
      'es': '28',
      'en': '28',
    },
    'w2xq1pbm': {
      'es': 'Cerra sesión',
      'en': 'Log out',
    },
  },
  // Rutina
  {
    '11zni7dz': {
      'es': 'Workouts',
      'en': 'Workouts',
    },
    't3oqc8ws': {
      'es': 'Choose your training for today',
      'en': 'Choose your training for today',
    },
    '7w4h4f0o': {
      'es': 'Cick para regresar',
      'en': 'Click to return',
    },
    'g0b6fr7x': {
      'es': 'Full Body Workout',
      'en': 'Full Body Workout',
    },
    '2l8fa8k6': {
      'es': '12 Exercises | 45 minutes',
      'en': '12 Exercises | 45 minutes',
    },
    'zvawh4wn': {
      'es': 'See more',
      'en': 'See more',
    },
    'adsbs5lf': {
      'es': 'Full Body Workout',
      'en': 'Full Body Workout',
    },
    'fyi32lt5': {
      'es': '12 Exercises | 45 minutes',
      'en': '12 Exercises | 45 minutes',
    },
    'iznelkfi': {
      'es': 'See more',
      'en': 'See more',
    },
    '7kdg6afh': {
      'es': 'Full Body Workout',
      'en': 'Full Body Workout',
    },
    '7m0d8ch0': {
      'es': '12 Exercises | 45 minutes',
      'en': '12 Exercises | 45 minutes',
    },
    'nthywrzh': {
      'es': 'See more',
      'en': 'See more',
    },
    '3uxahtl1': {
      'es': 'Full Body Workout',
      'en': 'Full Body Workout',
    },
    'yvk2h5y1': {
      'es': '12 Exercises | 45 minutes',
      'en': '12 Exercises | 45 minutes',
    },
    '1exk7wge': {
      'es': 'See more',
      'en': 'See more',
    },
  },
  // Ejercicios
  {
    '1vcrxe2z': {
      'es': 'Ejercicios',
      'en': 'Exercises',
    },
    'b0i1i7nu': {
      'es': '3 Sets',
      'en': '3 Sets',
    },
    'ojrdxwgk': {
      'es': 'Set 1',
      'en': 'Set 1',
    },
    '7m3ezzo6': {
      'es': 'Calentamiento',
      'en': 'Heating',
    },
    'w5rk1u58': {
      'es': 'Correr',
      'en': 'Run',
    },
    'pye4p918': {
      'es': 'Set 2',
      'en': 'Set 2',
    },
    'zkun2dqv': {
      'es': 'Push-ups',
      'en': 'Push-ups',
    },
    'fik1z14p': {
      'es': 'Peso Muerto',
      'en': 'Dead weight',
    },
    'tyrvhxgu': {
      'es': 'Set 3',
      'en': 'Set 3',
    },
    'mqioox7f': {
      'es': 'Squads',
      'en': 'Squads',
    },
    'iulmcgde': {
      'es': 'Press Militar',
      'en': 'Military Press',
    },
    '7plvuxlb': {
      'es': 'Iniciar entrenamiento',
      'en': 'Start training',
    },
  },
  // PaginaP
  {
    '74er4t54': {
      'es': 'Welcome back,',
      'en': 'Welcome back,',
    },
    'a1tbcn10': {
      'es': 'Perfil',
      'en': 'Profile',
    },
    '4nebl4yh': {
      'es': 'Today\'s Workout',
      'en': 'Today\'s Workout',
    },
    'sldhw4is': {
      'es': 'Upper Body Strength',
      'en': 'Upper Body Strength',
    },
    'nzwyiaq2': {
      'es': '8 exercises • 40 min',
      'en': '8 exercises • 40 min',
    },
    'whvrq5jv': {
      'es': 'Start',
      'en': 'Start',
    },
    's7pyzy5v': {
      'es': 'Quick Actions',
      'en': 'Quick Actions',
    },
    '9nf9eliq': {
      'es': 'Ejercicios',
      'en': 'Exercises',
    },
    '9t6vz5yn': {
      'es': 'Rutinas',
      'en': 'Routines',
    },
    '68n4mk8n': {
      'es': 'Recent Workouts',
      'en': 'Recent Workouts',
    },
    'kbzc14ux': {
      'es': 'HIIT Cardio',
      'en': 'HIIT Cardio',
    },
    'cdel4gxb': {
      'es': 'Yesterday • 35 min',
      'en': 'Yesterday • 35 min',
    },
    'ybqrx0i0': {
      'es': 'Yoga Flow',
      'en': 'Yoga Flow',
    },
    '442bwyak': {
      'es': '2 days ago • 45 min',
      'en': '2 days ago • 45 min',
    },
    '93guqc66': {
      'es': 'Routines',
      'en': 'Routines',
    },
    'g3hn27qp': {
      'es': 'Exercises',
      'en': 'Exercises',
    },
    '57km1i6r': {
      'es': 'Profile',
      'en': 'Profile',
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
