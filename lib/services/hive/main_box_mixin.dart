import 'package:hear_quran/services/hive/enums.dart';
import 'package:hear_quran/services/hive/main_box.dart';

mixin MainBoxMixin {
  final Future<void> Function<T>(BoxKeys key, T value) set = MainBox.set;
  final T Function<T>(BoxKeys key) get = MainBox.get;
}
