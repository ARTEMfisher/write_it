import 'package:isar_community/isar.dart';

import 'package:writeit/data/datasources/word_local_data_source.dart';
import 'package:writeit/data/models/word_model.dart';

import 'package:writeit/domain/entities/word_entity.dart';
import 'package:writeit/domain/repositories/word_repository.dart';

class WordRepositoryImpl
    implements WordRepository {

  final WordLocalDataSource localDs;

  WordRepositoryImpl(this.localDs);

  @override
  Future<void> addWord(
      WordEntity word,
      ) async {

    await localDs.addWord(
      WordModel.fromEntity(word),
    );
  }

  @override
  Future<void> deleteWord(
      Id id,
      ) async {

    await localDs.deleteWord(id);
  }

  @override
  Future<List<WordEntity>> getWords() async {

    final models =
    await localDs.getWords();

    return models
        .map((e) => e.toEntity)
        .toList();
  }

  @override
  Stream<List<WordEntity>> watchWords() {

    return localDs.watchWords().map(
          (models) => models
          .map((e) => e.toEntity)
          .toList(),
    );
  }
}