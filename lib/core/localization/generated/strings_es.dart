import 'strings.dart';

/// The translations for Spanish Castilian (`es`).
class StringsEs extends Strings {
  StringsEs([String locale = 'es']) : super(locale);

  @override
  String get home => 'Inicio';

  @override
  String get favorites => 'Favoritos';

  @override
  String get settings => 'Configuración';

  @override
  String get surahs => 'Suras';

  @override
  String get surah => 'Sura';

  @override
  String get reciters => 'Recitadores';

  @override
  String get verses => 'Versículos';

  @override
  String get noFav => '¡No hay suras favoritas!';

  @override
  String get app => 'Aplicación';

  @override
  String get darkMode => 'Modo oscuro';

  @override
  String get darkModeSub => 'Activar el modo oscuro';

  @override
  String get language => 'Idioma';

  @override
  String get arabic => 'Árabe';

  @override
  String get english => 'Inglés';

  @override
  String get general => 'General';

  @override
  String get aboutApp => 'Acerca de la aplicación';

  @override
  String get aboutAppSub => 'Escuchar el Corán';

  @override
  String get licenses => 'Licencias';

  @override
  String get licensesSub => 'Ver las licencias de la aplicación';

  @override
  String get ok => 'Aceptar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get offlineMode => 'Modo sin conexión';

  @override
  String get offlineModeDes => 'Reproduce solo suras descargadas, no se descargará nuevo contenido incluso con conexión a Internet.';

  @override
  String get offlineHint => 'Actualmente estás en modo sin conexión y no puedes reproducir suras que no estén descargadas. ¿Deseas cambiar al modo en línea? Ve a Configuración para cambiar esto.';

  @override
  String get aboutDes => 'La aplicación Escuchar el Corán es tu sencilla biblioteca de audio del Corán. Escucha en línea o sin conexión las recitaciones de los recitadores del Corán más famosos, accesibles en cualquier momento después de instalar tus suras seleccionadas.';

  @override
  String get permissions => 'Permisos';

  @override
  String get permissionsDes => 'Nuestra aplicación requiere permiso de almacenamiento para guardar las suras seleccionadas en su dispositivo, permitiéndole escucharlas sin conexión cuando lo desee.';

  @override
  String get allow => 'Permitir';

  @override
  String get likeUsingApp => '¿Te gusta usar nuestra aplicación?';

  @override
  String get likeUsingAppDes => 'El que guía a otros hacia un acto de bondad, tendrá una recompensa similar a la de quien lo realiza';

  @override
  String get rateUs => 'Califícanos';

  @override
  String get rateApp => 'Calificar la aplicación';

  @override
  String get rateAppDes => 'Califica nuestra aplicación en Google Play';
}
