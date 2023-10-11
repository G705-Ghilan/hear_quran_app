import 'strings.dart';

/// The translations for Turkish (`tr`).
class StringsTr extends Strings {
  StringsTr([String locale = 'tr']) : super(locale);

  @override
  String get home => 'Anasayfa';

  @override
  String get favorites => 'Favoriler';

  @override
  String get settings => 'Ayarlar';

  @override
  String get surahs => 'Sureler';

  @override
  String get surah => 'Sure';

  @override
  String get reciters => 'Hafızlar';

  @override
  String get verses => 'Ayetler';

  @override
  String get noFav => 'Favori sure yok!';

  @override
  String get app => 'Uygulama';

  @override
  String get darkMode => 'Karanlık Mod';

  @override
  String get darkModeSub => 'Karanlık modu aç';

  @override
  String get language => 'Dil';

  @override
  String get arabic => 'Arapça';

  @override
  String get english => 'İngilizce';

  @override
  String get general => 'Genel';

  @override
  String get aboutApp => 'Uygulama Hakkında';

  @override
  String get aboutAppSub => 'Kur\'an\'ı Dinle';

  @override
  String get licenses => 'Lisanslar';

  @override
  String get licensesSub => 'Uygulama lisanslarını gör';

  @override
  String get ok => 'Tamam';

  @override
  String get cancel => 'İptal';

  @override
  String get offlineMode => 'Çevrimdışı Mod';

  @override
  String get offlineModeDes => 'Yalnızca indirilen sureler çalınır, internet bağlantısı olsa bile yeni içerik indirilmez.';

  @override
  String get offlineHint => 'Şu anda çevrimdışı moddasınız ve indirilmemiş sureleri çalamazsınız. Çevrimiçi moda geçmek ister misiniz? Bunu değiştirmek için Ayarlara gidin.';

  @override
  String get aboutDes => 'Kur\'an\'ı Dinle uygulaması, basit bir Kur\'an ses kütüphanenizdir. En ünlü Kur\'an hafızları tarafından yapılan okumaları seçtiğiniz sureleri yükledikten sonra istediğiniz zaman çevrimiçi veya çevrimdışı dinleyin.';
}
