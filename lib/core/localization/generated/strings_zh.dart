import 'strings.dart';

/// The translations for Chinese (`zh`).
class StringsZh extends Strings {
  StringsZh([String locale = 'zh']) : super(locale);

  @override
  String get home => '首页';

  @override
  String get favorites => '收藏';

  @override
  String get settings => '设置';

  @override
  String get surahs => '章节';

  @override
  String get surah => '章';

  @override
  String get reciters => '诵读者';

  @override
  String get verses => '诗句';

  @override
  String get noFav => '没有收藏的章节！';

  @override
  String get app => '应用';

  @override
  String get darkMode => '暗模式';

  @override
  String get darkModeSub => '开启暗模式';

  @override
  String get language => '语言';

  @override
  String get arabic => '阿拉伯语';

  @override
  String get english => '英语';

  @override
  String get general => '通用';

  @override
  String get aboutApp => '关于应用';

  @override
  String get aboutAppSub => '听受《古兰经》';

  @override
  String get licenses => '许可';

  @override
  String get licensesSub => '查看应用许可';

  @override
  String get ok => '确定';

  @override
  String get cancel => '取消';

  @override
  String get offlineMode => '离线模式';

  @override
  String get offlineModeDes => '只播放已下载的章节，即使有互联网连接也不会下载新内容。';

  @override
  String get offlineHint => '您当前处于离线模式，无法播放未下载的章节。要切换到在线模式吗？转到设置以更改此设置。';

  @override
  String get aboutDes => '听受《古兰经》应用是您简单的《古兰经》音频库。通过最著名的《古兰经》诵读者，在安装您选择的章节后，可随时在线或离线听受。';

  @override
  String get permissions => '权限';

  @override
  String get permissionsDes => '我们的应用需要存储权限以将您选择的苏拉保存到您的设备上，使您能够在方便的时候离线收听。';

  @override
  String get allow => '允许';
}
