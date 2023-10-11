import 'strings.dart';

/// The translations for English (`en`).
class StringsEn extends Strings {
  StringsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get favorites => 'Favorites';

  @override
  String get settings => 'Settings';

  @override
  String get surahs => 'Surahs';

  @override
  String get surah => 'Surah';

  @override
  String get reciters => 'Reciters';

  @override
  String get verses => 'Verses';

  @override
  String get noFav => 'No favorite surahs !';

  @override
  String get app => 'App';

  @override
  String get darkMode => 'Dark mode';

  @override
  String get darkModeSub => 'Turn on the dark mode';

  @override
  String get language => 'Language';

  @override
  String get arabic => 'Arabic';

  @override
  String get english => 'English';

  @override
  String get general => 'General';

  @override
  String get aboutApp => 'About app';

  @override
  String get aboutAppSub => 'Hear Quran';

  @override
  String get licenses => 'Licenses';

  @override
  String get licensesSub => 'See app licenses';

  @override
  String get ok => 'Ok';

  @override
  String get cancel => 'Cancel';

  @override
  String get offlineMode => 'Offline Mode';

  @override
  String get offlineModeDes => 'Plays only downloaded surahs, no new content will be downloaded even with an internet connection.';

  @override
  String get offlineHint => 'You are currently in offline mode and unable to play surahs that aren\'t downloaded. Would you like to switch to online mode? Go Settings to change this.';

  @override
  String get aboutDes => 'Hear Quran app is your simple Quran audio library. Listen online or offline to recitations by the most famous Quran reciters, accessible anytime after installing your selected Surahs.';
}
