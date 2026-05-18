import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:isar_community/isar.dart';

import 'package:writeit/domain/entities/word_entity.dart';
import 'package:writeit/domain/repositories/word_repository.dart';

part 'word_event.dart';
part 'word_state.dart';

class WordBloc extends Bloc<WordEvent, WordState> {

  final WordRepository repository;

  StreamSubscription? _subscription;

  WordBloc(this.repository)
      : super(WordInitial()) {

    on<LoadWords>(_onLoadWords);

    on<AddWordEvent>(_onAddWord);

    on<DeleteWordEvent>(_onDeleteWord);

    on<_WordsUpdated>(_onWordsUpdated);
  }

  void _onLoadWords(
      LoadWords event,
      Emitter<WordState> emit,
      ) {

    _subscription?.cancel();

    _subscription =
        repository.watchWords().listen(
              (words) {
            add(_WordsUpdated(words));
          },
        );
  }

  Future<void> _onAddWord(
      AddWordEvent event,
      Emitter<WordState> emit,
      ) async {

    await repository.addWord(event.word);
  }

  Future<void> _onDeleteWord(
      DeleteWordEvent event,
      Emitter<WordState> emit,
      ) async {

    await repository.deleteWord(event.id);
  }

  void _onWordsUpdated(
      _WordsUpdated event,
      Emitter<WordState> emit,
      ) {

    emit(WordLoaded(event.words));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();

    return super.close();
  }
}