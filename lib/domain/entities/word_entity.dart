class WordEntity {

  final int id;

  final List<String> originals;

  final List<String> translations;

  final bool isFavorite;

  final DateTime createdAt;

  final DateTime updatedAt;

  const WordEntity({
    required this.id,
    required this.originals,
    required this.translations,
    required this.isFavorite,
    required this.createdAt,
    required this.updatedAt,
  });
}