part of 'word_bloc.dart';

abstract class WordEvent {}

class LoadWords extends WordEvent {}

class AddWordEvent extends WordEvent {

  final WordEntity word;

  AddWordEvent(this.word);
}

class DeleteWordEvent extends WordEvent {

  final Id id;

  DeleteWordEvent(this.id);
}

class _WordsUpdated extends WordEvent {

  final List<WordEntity> words;

  _WordsUpdated(this.words);
}