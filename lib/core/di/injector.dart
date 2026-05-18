import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';

import 'package:writeit/core/services/database_service.dart';

import 'package:writeit/data/datasources/word_local_data_source.dart';
import 'package:writeit/data/repositories/word_repository_impl.dart';

import 'package:writeit/domain/repositories/word_repository.dart';

import 'package:writeit/features/main_page/presentation/bloc/word_bloc.dart';

final injector = GetIt.instance;

Future<void> setupLocator() async {

  final databaseService =
  DatabaseService();

  await databaseService.init();

  /// database

  injector.registerSingleton<DatabaseService>(
    databaseService,
  );

  injector.registerSingleton<Isar>(
    databaseService.isar,
  );

  /// datasources

  injector.registerLazySingleton(
        () => WordLocalDataSource(
      injector<Isar>(),
    ),
  );

  /// repositories

  injector.registerLazySingleton<WordRepository>(
        () => WordRepositoryImpl(
      injector<WordLocalDataSource>(),
    ),
  );

  /// BLoC

  injector.registerFactory(
        () => WordBloc(
      injector<WordRepository>(),
    ),
  );
}