import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:writeit/data/models/word_model.dart';

class DatabaseService {

  late final Isar isar;

  Future<void> init() async {

    final dir =
    await getApplicationDocumentsDirectory();

    isar = await Isar.open(
      [
        WordModelSchema,
      ],
      directory: dir.path,
      inspector: true,
    );
  }
}