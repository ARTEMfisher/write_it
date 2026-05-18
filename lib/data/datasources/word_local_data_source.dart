import 'package:isar_community/isar.dart';
import 'package:writeit/data/models/word_model.dart';

class WordLocalDataSource {

  final Isar isar;

  WordLocalDataSource(this.isar);

  Future<void> addWord(
      WordModel word,
      ) async {

    await isar.writeTxn(() async {
      await isar.wordModels.put(word);
    });
  }

  Future<void> deleteWord(
      Id id,
      ) async {

    await isar.writeTxn(() async {
      await isar.wordModels.delete(id);
    });
  }

  Future<List<WordModel>> getWords() async {
    return await isar.wordModels
        .where()
        .findAll();
  }

  Stream<List<WordModel>> watchWords() {
    return isar.wordModels
        .where()
        .watch(fireImmediately: true);
  }
}