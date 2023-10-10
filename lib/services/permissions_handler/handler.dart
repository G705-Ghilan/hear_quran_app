import 'package:permission_handler/permission_handler.dart';

class PermissionsHandler {
  static bool filesAllowed = false;

  static Future<void> initlizeHandler() async {
    await checkFilesAllowed();
  }

  static Future checkFilesAllowed() async {
    filesAllowed = !(await Permission.storage.status).isDenied;
  }

  static Future askForStorage() async {
    filesAllowed = !(await Permission.storage.request()).isDenied;
  }
}
