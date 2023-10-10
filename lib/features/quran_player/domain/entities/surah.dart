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

  String getName(String lang) => lang == "en" ? enName : arName;
}
