import 'package:device_info/device_info.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsHandler {
  static bool filesAllowed = false;
  static int sdkVersion = -1;

  static Future<void> initlizeHandler() async {
    sdkVersion = (await DeviceInfoPlugin().androidInfo).version.sdkInt;
    await checkFilesAllowed();
  }

  static Future checkFilesAllowed() async {
    if (sdkVersion > 32) {
      // handle android 13 permissions
      filesAllowed = (await Permission.audio.status).isGranted;
    } else {
      // handle below android 13 devices's permissions
      filesAllowed = (await Permission.storage.status).isGranted;
    }
  }

  static Future askForStorage() async {
    if (sdkVersion > 32) {
      // handle android 13 permissions
      filesAllowed = (await Permission.audio.request()).isGranted;
    } else {
      // handle below android 13 devices's permissions
      filesAllowed = (await Permission.storage.request()).isGranted;
    }
  }
}
