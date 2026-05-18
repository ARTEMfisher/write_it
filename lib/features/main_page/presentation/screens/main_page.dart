import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:writeit/features/main_page/presentation/bloc/word_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WordBloc, WordState>(
        builder: (context, state) {

          if (state is WordLoaded) {

            final words = state.words;

            return ListView.builder(
              itemCount: words.length,
              itemBuilder: (context, index) {

                final word = words[index];

                return ListTile(
                  title: Text(
                    word.originals.join(', '),
                  ),

                  subtitle: Text(
                    word.translations.join(', '),
                  ),

                  trailing: Icon(
                    word.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}