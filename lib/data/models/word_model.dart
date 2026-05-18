import 'package:isar_community/isar.dart';
import 'package:writeit/domain/entities/word_entity.dart';

part 'word_model.g.dart';

@collection
class WordModel {

  WordModel();

  Id id = Isar.autoIncrement;

  List<String> originals = [];

  List<String> translations = [];

  bool isFavorite = false;

  DateTime createdAt = DateTime.now();

  DateTime updatedAt = DateTime.now();

  factory WordModel.fromEntity(
      WordEntity entity,
      ) {
    return WordModel()
      ..id = entity.id
      ..originals = entity.originals
      ..translations = entity.translations
      ..isFavorite = entity.isFavorite
      ..createdAt = entity.createdAt
      ..updatedAt = entity.updatedAt;
  }

  @ignore
  WordEntity get toEntity => WordEntity(
    id: id,
    originals: originals,
    translations: translations,
    isFavorite: isFavorite,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}