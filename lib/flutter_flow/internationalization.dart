import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'si'];

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
    String? enText = '',
    String? siText = '',
  }) =>
      [enText, siText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    '6zpd63uu': {
      'en': 'Email Address',
      'si': '',
    },
    'hwattpxr': {
      'en': 'Email Address',
      'si': '',
    },
    'o6qwf6sk': {
      'en': 'Password',
      'si': '',
    },
    '9dfzr4we': {
      'en': 'Password',
      'si': '',
    },
    'khcf7nw0': {
      'en': 'Log In',
      'si': '',
    },
    't4cywg4d': {
      'en': 'Don\'t have an account?',
      'si': '',
    },
    'mzm8nfip': {
      'en': 'Create Account',
      'si': '',
    },
    '9ui8mwz3': {
      'en': 'Forgot Password?',
      'si': '',
    },
    'r8mryt9d': {
      'en': 'Continue as Guest',
      'si': '',
    },
    'nzan9pi4': {
      'en': 'Home',
      'si': '',
    },
  },
  // Register
  {
    '0ke5bfum': {
      'en': 'Email Address',
      'si': '',
    },
    'ljusfh0y': {
      'en': 'Email Address',
      'si': '',
    },
    'm28dde6q': {
      'en': 'Choose Password',
      'si': '',
    },
    '4l8pkrbf': {
      'en': 'Choose Password',
      'si': '',
    },
    '7zmgw0a8': {
      'en': 'Confirm Password',
      'si': '',
    },
    'hvpgpw42': {
      'en': 'Confirm Password',
      'si': '',
    },
    'x6ccgqo8': {
      'en': 'Create Account',
      'si': '',
    },
    '77tnm8tu': {
      'en': 'Already have an account?',
      'si': '',
    },
    'eoe4s14i': {
      'en': 'Login',
      'si': '',
    },
    'haia4prw': {
      'en': 'Continue as Guest',
      'si': '',
    },
    'cdgyuiat': {
      'en': 'Home',
      'si': '',
    },
  },
  // MyFriends
  {
    'uea4kofc': {
      'en': 'My Team',
      'si': '',
    },
    'haiqj66w': {
      'en': 'My Friends',
      'si': '',
    },
  },
  // completeProfile
  {
    'gbxlc5th': {
      'en': 'Complete Profile',
      'si': '',
    },
    'z3m2yiv9': {
      'en': 'Your Name',
      'si': '',
    },
    'nuwrjw37': {
      'en': 'What name do you go by?',
      'si': '',
    },
    '0sp3rgyf': {
      'en': 'Your Title',
      'si': '',
    },
    'h71pt3vr': {
      'en': 'What do you do?',
      'si': '',
    },
    '6i0sgbnu': {
      'en': 'Save Profile',
      'si': '',
    },
    'dq4hyj8w': {
      'en': 'Home',
      'si': '',
    },
  },
  // forgotPassword
  {
    'fn5eluok': {
      'en': 'Forgot Password',
      'si': '',
    },
    'x1dn7rso': {
      'en': 'Your Email Address',
      'si': '',
    },
    'ie6vdl3t': {
      'en': 'Please enter a email...',
      'si': '',
    },
    'o2m5arco': {
      'en': 'Send Reset Link',
      'si': '',
    },
    '31j2iuia': {
      'en': 'Home',
      'si': '',
    },
  },
  // chatDetails
  {
    'qnfdydf4': {
      'en': 'Job Title',
      'si': '',
    },
    't4cjhcs4': {
      'en': 'Employed Since',
      'si': '',
    },
    'b2ecvk6b': {
      'en': 'Home',
      'si': '',
    },
  },
  // chatMain
  {
    'u86lbft9': {
      'en': 'All Chats',
      'si': '',
    },
  },
  // changePassword
  {
    '1fj7158f': {
      'en': 'Change Password',
      'si': '',
    },
    '6jny45e5': {
      'en': 'Your Email Address',
      'si': '',
    },
    'shhp2hlc': {
      'en': 'Please enter a email...',
      'si': '',
    },
    '631huopn': {
      'en': 'Send Reset Link',
      'si': '',
    },
    'k5bdtqka': {
      'en': 'Home',
      'si': '',
    },
  },
  // myProfile
  {
    '72jqf8h6': {
      'en': 'Switch to Dark Mode',
      'si': '',
    },
    '9kq3k73n': {
      'en': 'Switch to Light Mode',
      'si': '',
    },
    '1u6ufneu': {
      'en': 'Account Settings',
      'si': '',
    },
    'qyq9fgbp': {
      'en': 'Edit Profile',
      'si': '',
    },
    'mu3jr9la': {
      'en': 'Change Password',
      'si': '',
    },
    'dmsh9if0': {
      'en': 'Log Out',
      'si': '',
    },
  },
  // editProfile
  {
    'nt246ulg': {
      'en': 'Edit Profile',
      'si': '',
    },
    'zgjozq4e': {
      'en': 'Email Address',
      'si': '',
    },
    '0rrzgcfl': {
      'en': 'Full Name',
      'si': '',
    },
    'u75fl9ah': {
      'en': 'Job Title',
      'si': '',
    },
    'a9e1v9eo': {
      'en': 'Save Changes',
      'si': '',
    },
    '71adsfhi': {
      'en': 'Home',
      'si': '',
    },
  },
  // SearchBar
  {
    '23fyslx5': {
      'en': 'Search for friends...',
      'si': '',
    },
    '79fh4re7': {
      'en': 'Find your friend by na',
      'si': '',
    },
  },
  // friendList
  {
    '2b029sqq': {
      'en': 'Alex Edwards',
      'si': '',
    },
    'xdj13f9g': {
      'en': '[userEmail]',
      'si': '',
    },
  },
  // emptyList
  {
    'ott2a5cx': {
      'en': 'No Messages',
      'si': '',
    },
    '67ciereq': {
      'en':
          'Seems you don\'t have any messages here, search your friends list in order to get started.',
      'si': '',
    },
    'hu7m5g3w': {
      'en': 'Find Friends',
      'si': '',
    },
  },
  // Miscellaneous
  {
    'xddfflnk': {
      'en': '',
      'si': '',
    },
    '8flkp5h8': {
      'en': '',
      'si': '',
    },
    'c5ziijij': {
      'en': '',
      'si': '',
    },
    '6h12regk': {
      'en': '',
      'si': '',
    },
    'ct8tool5': {
      'en': '',
      'si': '',
    },
    'x6hh3kxt': {
      'en': '',
      'si': '',
    },
    'bcb4dd5x': {
      'en': '',
      'si': '',
    },
    'v8ccjker': {
      'en': '',
      'si': '',
    },
    'c7k2s21u': {
      'en': '',
      'si': '',
    },
    'jnyjffpw': {
      'en': '',
      'si': '',
    },
    'hzpmo4i5': {
      'en': '',
      'si': '',
    },
    'q12ghht0': {
      'en': '',
      'si': '',
    },
    'stdmxfg2': {
      'en': '',
      'si': '',
    },
    'e3j0o4zc': {
      'en': '',
      'si': '',
    },
    'af7qm3z4': {
      'en': '',
      'si': '',
    },
    '2cdekte3': {
      'en': '',
      'si': '',
    },
    '4h13e3ct': {
      'en': '',
      'si': '',
    },
    '0smbys8b': {
      'en': '',
      'si': '',
    },
    'wbm0dktm': {
      'en': '',
      'si': '',
    },
    'qg0f8cac': {
      'en': '',
      'si': '',
    },
    'y7xgfj4d': {
      'en': '',
      'si': '',
    },
    'yc2paaul': {
      'en': '',
      'si': '',
    },
    'ut185dzn': {
      'en': '',
      'si': '',
    },
    '1wx4jl2r': {
      'en': '',
      'si': '',
    },
    'nzp376jw': {
      'en': '',
      'si': '',
    },
  },
].reduce((a, b) => a..addAll(b));
