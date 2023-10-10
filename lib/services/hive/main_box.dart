import 'package:hear_quran/services/hive/defualts_box_values.dart';
import 'package:hear_quran/services/hive/enums.dart';
import 'package:hive_flutter/adapters.dart';

class MainBox {
  static Box? box;
  static const boxName = "mainBox";

  static Future<void> initilazieMainBox() async {
    await Hive.initFlutter();
    box = await Hive.openBox(boxName);
    await DefualtBoxValues().initializeLastValues();
  }

  static Future<void> set<T>(BoxKeys key, T value) async {
    await box?.put(key.name, value);
  }

  static T get<T>(BoxKeys key) {
    if (box == null) {
      return key.defaultValue;
    }
    return box!.get(key.name, defaultValue: key.defaultValue);
  }

  static Future<void> closeBox() async {
    await box?.close();
  }
}
