import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:writeit/features/main_page/presentation/bloc/word_bloc.dart';

import 'package:writeit/features/main_page/presentation/widgets/add_button.dart';
import 'package:writeit/features/main_page/presentation/widgets/word_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
        
            const AddButton(),
        
            Expanded(
              child: BlocBuilder<
                  WordBloc,
                  WordState>(
                builder: (context, state) {
        
                  if (state is WordLoaded) {
        
                    final words =
                        state.words;
        
                    return ListView.builder(
        
                      padding:
                      const EdgeInsets.only(
                        bottom: 24,
                      ),
        
                      itemCount:
                      words.length,
        
                      itemBuilder:
                          (context, index) {
        
                        return WordWidget(
                          word: words[index],
                        );
                      },
                    );
                  }
        
                  return const Center(
                    child:
                    CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}