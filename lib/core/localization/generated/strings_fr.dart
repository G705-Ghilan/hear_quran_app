import 'strings.dart';

/// The translations for French (`fr`).
class StringsFr extends Strings {
  StringsFr([String locale = 'fr']) : super(locale);

  @override
  String get home => 'Accueil';

  @override
  String get favorites => 'Favoris';

  @override
  String get settings => 'Paramètres';

  @override
  String get surahs => 'Sourates';

  @override
  String get surah => 'Sourate';

  @override
  String get reciters => 'Récitateurs';

  @override
  String get verses => 'Versets';

  @override
  String get noFav => 'Aucune sourate favorite !';

  @override
  String get app => 'Application';

  @override
  String get darkMode => 'Mode sombre';

  @override
  String get darkModeSub => 'Activer le mode sombre';

  @override
  String get language => 'Langue';

  @override
  String get arabic => 'Arabe';

  @override
  String get english => 'Anglais';

  @override
  String get general => 'Général';

  @override
  String get aboutApp => 'À propos de l\'application';

  @override
  String get aboutAppSub => 'Écoutez le Coran';

  @override
  String get licenses => 'Licences';

  @override
  String get licensesSub => 'Voir les licences de l\'application';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Annuler';

  @override
  String get offlineMode => 'Mode hors ligne';

  @override
  String get offlineModeDes => 'Joue uniquement les sourates téléchargées, aucun nouveau contenu ne sera téléchargé même avec une connexion Internet.';

  @override
  String get offlineHint => 'Vous êtes actuellement en mode hors ligne et ne pouvez pas lire les sourates qui ne sont pas téléchargées. Souhaitez-vous passer en mode en ligne ? Allez dans les paramètres pour changer cela.';

  @override
  String get aboutDes => 'L\'application Écoutez le Coran est votre bibliothèque audio du Coran simple. Écoutez en ligne ou hors ligne les récitations des récitants du Coran les plus célèbres, accessibles à tout moment après avoir installé vos sourates sélectionnées.';

  @override
  String get permissions => 'Autorisations';

  @override
  String get permissionsDes => 'Notre application nécessite l\'autorisation de stockage pour enregistrer les sourates que vous avez sélectionnées sur votre appareil, vous permettant de les écouter hors ligne à votre convenance.';

  @override
  String get allow => 'Autoriser';
}
