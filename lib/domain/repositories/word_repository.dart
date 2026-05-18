import 'package:isar_community/isar.dart';
import 'package:writeit/domain/entities/word_entity.dart';

abstract class WordRepository {

  Future<void> addWord(
      WordEntity word,
      );

  Future<void> deleteWord(
      Id id,
      );

  Future<List<WordEntity>> getWords();

  Stream<List<WordEntity>> watchWords();
}