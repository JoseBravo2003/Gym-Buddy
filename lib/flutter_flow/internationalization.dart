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
      'es': '¿Listo para ponerte en forma?',
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
    'h44sxtt1': {
      'es': 'Click para regresar',
      'en': 'Click to return',
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
  // Ejercicios
  {
    '1vcrxe2z': {
      'es': 'Ejercicios',
      'en': 'Exercises',
    },
    'b0i1i7nu': {
      'es': 'Clicl para regresar',
      'en': 'Click to return',
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
      'es': 'Bienvenido de nuevo\n',
      'en': 'Welcome back',
    },
    'a1tbcn10': {
      'es': 'Perfil',
      'en': 'Profile',
    },
    '4nebl4yh': {
      'es': 'El entrenamiento de hoy',
      'en': 'Today\'s training',
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
      'es': 'Acciones rápidas\n',
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
      'es': 'Apartado de ayuda',
      'en': 'Help section',
    },
    'kbzc14ux': {
      'es': 'Entrenadores',
      'en': 'Coaches',
    },
    'cdel4gxb': {
      'es': 'Ingresa para obtener ayuda ',
      'en': 'Sign in for help',
    },
  },
  // RutinaCopy
  {
    '5q14ww2k': {
      'es': 'Tus Rutinas',
      'en': 'Your Routines',
    },
    'e1bs4r0v': {
      'es': 'Crear rutina',
      'en': 'Create routine',
    },
    'ybvy1p7u': {
      'es': 'Filtrar',
      'en': 'Filter',
    },
    'or6f55w8': {
      'es': 'Entrenamiento Lunes',
      'en': 'Monday Training',
    },
    'ulwlqn1e': {
      'es': '12 Exercises | 75 minutes',
      'en': '12 Exercises | 75 minutes',
    },
    '3ngy06tu': {
      'es': 'See more',
      'en': 'See more',
    },
    '9t6gwcdx': {
      'es': 'Entrenamiento Martes',
      'en': 'Tuesday Training',
    },
    '6jqc8c8o': {
      'es': '9 Ejercicios - 120 minutos',
      'en': '9 Exercises - 120 minutes',
    },
    'no57o4z7': {
      'es': 'See more',
      'en': 'See more',
    },
    '1a9k4vj4': {
      'es': 'Miercoles de Pierna',
      'en': 'Wednesday Leg',
    },
    'xudco5eo': {
      'es': '15 Ejercicios | 180 minutos',
      'en': '15 Exercises | 180 minutes',
    },
    '3nz6q991': {
      'es': 'See more',
      'en': 'See more',
    },
  },
  // Contacto
  {
    'wh7fcnvb': {
      'es': 'Entrenadores personales',
      'en': 'Personal Trainers',
    },
    '9rxlpi12': {
      'es':
          'Nuestros entrenadores certificados están aquí para ayudarle a alcanzar sus objetivos de acondicionamiento físico.',
      'en':
          'Our certified trainers are here to help you reach your fitness goals',
    },
    '2asd9xwf': {
      'es': 'David Martinez',
      'en': 'David Martinez',
    },
    '608p5tq1': {
      'es': 'Fuerza y ​​acondicionamiento',
      'en': 'Strength & Conditioning',
    },
    'dzkry6xz': {
      'es': '+1 (555) 123-4567',
      'en': '+1 (555) 123-4567',
    },
    '4zhl2jfi': {
      'es':
          'Se especializa en levantamiento de pesas y entrenamiento funcional con más de 8 años de experiencia ayudando a los clientes a alcanzar sus objetivos de fuerza.',
      'en':
          'Specializes in powerlifting and functional training with 8+ years of experience helping clients achieve their strength goals.',
    },
    'hehixl58': {
      'es': 'Sarah Wilson',
      'en': 'Sarah Wilson',
    },
    '625gwvrx': {
      'es': 'Nutrición y pérdida de peso',
      'en': 'Nutrition & Weight Loss',
    },
    '86r0qs4e': {
      'es': '+1 (555) 987-6543',
      'en': '+1 (555) 987-6543',
    },
    '0imyjz6z': {
      'es':
          'Nutricionista certificada y especialista en pérdida de peso con un enfoque holístico para la transformación de la salud y el fitness.',
      'en':
          'Certified nutritionist and weight loss specialist with a holistic approach to health and fitness transformation.',
    },
    '514ejt2t': {
      'es': 'Michael Chang',
      'en': 'Michael Chang',
    },
    'fkms08v4': {
      'es': 'HIIT & Cardio',
      'en': 'HIIT & Cardio',
    },
    '1taumwah': {
      'es': '+1 (555) 456-7890',
      'en': '+1 (555) 456-7890',
    },
    'bh0exur6': {
      'es':
          'Entrenador energético especializado en entrenamientos HIIT y programas cardiovasculares, que ayuda a los clientes a maximizar la quema de grasa y la resistencia.',
      'en':
          'High-energy trainer specializing in HIIT workouts and cardio programs, helping clients maximize fat burn and endurance.',
    },
  },
  // EditarPerfil
  {
    's88i3lx3': {
      'es': 'Cambiar Imagen',
      'en': '',
    },
    'si1rjahp': {
      'es': 'Nombre',
      'en': '',
    },
    'm2f0hsly': {
      'es': 'Apellidos',
      'en': '',
    },
    'hp8q79h5': {
      'es': 'Correo',
      'en': '',
    },
    'w6e8bj8p': {
      'es': 'Peso',
      'en': '',
    },
    'jmcyg1h9': {
      'es': 'Edad',
      'en': '',
    },
    'jbk01z1o': {
      'es': 'Guardar ',
      'en': '',
    },
    '355kcute': {
      'es': 'Editar Perfil',
      'en': '',
    },
  },
  // History
  {
    'jaliyks7': {
      'es': 'History',
      'en': '',
    },
    'l4ngot37': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // startwoekout
  {
    'eyzavaz5': {
      'es': 'Inicio Rapido',
      'en': '',
    },
    '5ugne24g': {
      'es': 'Empezar un nuevo ejercicio',
      'en': '',
    },
    'kjq2wi4b': {
      'es': 'Rutina',
      'en': '',
    },
    'flu4752j': {
      'es': 'Ejemplos de Rutinas',
      'en': '',
    },
    'neyl0j7g': {
      'es': 'Inicio',
      'en': '',
    },
    'ci2nwjji': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // exercises
  {
    'puvoeruk': {
      'es': 'Exercises',
      'en': '',
    },
    '31ep3xl5': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // test
  {
    'mfvbnoa2': {
      'es': 'Page Title',
      'en': '',
    },
    'z7tqnamn': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // testCopy
  {
    '0ky1hrx5': {
      'es': 'Entrenamiento Aleatorio',
      'en': '',
    },
    'q4v7z9qh': {
      'es': 'Hello World',
      'en': '',
    },
    'uj7jan53': {
      'es': 'Notas',
      'en': '',
    },
    'l8h5ij5o': {
      'es': 'Agregar Ejercicio',
      'en': '',
    },
    'puzyhv26': {
      'es': 'Cancelar',
      'en': '',
    },
    '5xrim2ol': {
      'es': 'Page Title',
      'en': '',
    },
    'fxc6x4ze': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // exercisesCopy
  {
    'tsims18t': {
      'es': 'Exercises',
      'en': '',
    },
    'susnxxo5': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // workouHistorEmpty
  {
    '6lpgq1yi': {
      'es': 'No has realizado ejercicios',
      'en': '',
    },
    'efo9dtca': {
      'es': 'Completa ejerciciso y saldran aqui ',
      'en': '',
    },
    'jsm6q498': {
      'es': 'Empezemos Ejercitarnos',
      'en': '',
    },
  },
  // startWorkoutComp
  {
    '4syjfvi8': {
      'es': 'Entrenamiento Aleatorio',
      'en': '',
    },
    'f7jagtuq': {
      'es': 'Tiempo',
      'en': '',
    },
    'cubv0j82': {
      'es': 'Notas',
      'en': '',
    },
    '7ts35hna': {
      'es': 'Hello World',
      'en': '',
    },
    'ht1re2yn': {
      'es': 'Nuevo Set',
      'en': '',
    },
    'hrrlrtgm': {
      'es': 'Agregar Ejercicio',
      'en': '',
    },
    'zf2owk2y': {
      'es': 'Cancelar',
      'en': '',
    },
  },
  // inputWei
  {
    'r1axf34m': {
      'es': 'TextField',
      'en': '',
    },
  },
  // inputReps
  {
    'qupmsin7': {
      'es': 'TextField',
      'en': '',
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
