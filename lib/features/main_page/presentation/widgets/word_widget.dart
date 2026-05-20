import 'package:flutter/material.dart';
import 'package:writeit/domain/entities/word_entity.dart';

class WordWidget extends StatelessWidget {

  final WordEntity word;

  const WordWidget({
    super.key,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(

      key: ValueKey(word.id),

      background: Container(
        alignment: Alignment.centerLeft,

        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),

        decoration: BoxDecoration(
          color: Colors.yellowAccent.shade700,

          borderRadius: BorderRadius.circular(16),
        ),

        child: Container(
          padding: const EdgeInsets.all(10),

          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.18),

            shape: BoxShape.circle,
          ),

          child: const Icon(
            Icons.star_border,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),

      secondaryBackground: Container(
        alignment: Alignment.centerRight,

        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),

        decoration: BoxDecoration(
          color: Colors.red.shade700,

          borderRadius: BorderRadius.circular(16),
        ),

        child: Container(
          padding: const EdgeInsets.all(10),

          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.18),

            shape: BoxShape.circle,
          ),

          child: const Icon(
            Icons.delete_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      confirmDismiss: (direction) async {

        if (direction ==
            DismissDirection.startToEnd) {

          debugPrint('favorite');
        }

        if (direction ==
            DismissDirection.endToStart) {

          debugPrint('delete');
        }

        return false;
      },

      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),

        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Theme.of(context)
            .colorScheme
            .surface,

          borderRadius:
          BorderRadius.circular(16),

          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color:
              Colors.black.withOpacity(0.08),
            ),
          ],
        ),

        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              /// originals

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: word.originals
                      .map(
                        (original) => Padding(
                      padding:
                      const EdgeInsets.only(
                        bottom: 4,
                      ),

                      child: Text(
                        original,

                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight:
                          FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),

              /// divider

              Padding(
                padding:
                const EdgeInsets.symmetric(
                  horizontal: 16,
                ),

                child: Container(
                  width: 1,
                  color: Colors.grey.shade300,
                ),
              ),

              /// translations

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.end,

                  children: word.translations
                      .map(
                        (translation) => Padding(
                      padding:
                      const EdgeInsets.only(
                        bottom: 4,
                      ),

                      child: Text(
                        translation,

                        textAlign:
                        TextAlign.end,

                        style: TextStyle(
                          fontSize: 16,
                          color:
                          Colors.grey.shade800,
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}