part of 'word_bloc.dart';

abstract class WordState {}

class WordInitial extends WordState {}

class WordLoaded extends WordState {

  final List<WordEntity> words;

  WordLoaded(this.words);
}