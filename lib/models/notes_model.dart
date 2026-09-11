import 'package:hive_flutter/hive_flutter.dart';
// part 'notes_model.g.dart';
part 'notes_model.g.dart';

enum Categories { private, programing }

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String date;
  @HiveField(3)
  String? id;
  @HiveField(4)
  Categories? categorie;
  NoteModel({this.title, required this.description, required this.date}) {
    id = id ?? DateTime.now().microsecondsSinceEpoch.toString();
    categorie = categorie ?? Categories.private;
  }
}
