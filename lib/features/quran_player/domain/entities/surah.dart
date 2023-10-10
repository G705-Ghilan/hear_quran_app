import 'package:equatable/equatable.dart';

class Surah extends Equatable {
  final int id;
  final String arName;
  final String enName;
  final int verses;

  const Surah(
      {required this.id,
      required this.arName,
      required this.enName,
      required this.verses});

  @override
  List<Object?> get props => [id, arName, enName, verses];

  bool match(String text) {
    text = text.toLowerCase();
    return enName.toLowerCase().contains(text) ||
        arName
            .replaceAll(
                RegExp(r'[\u064B-\u0652\u0610-\u061A\u06D6-\u06ED]'), '')
            .replaceAll(RegExp(r'[\u0622\u0623\u0625\u0671\u0672\u0673\u0675]'),
                '\u0627')
            .toLowerCase()
            .contains(text);
  }

  String getName(String lang) => lang == "en" ? enName : arName;
}
