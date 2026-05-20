import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:writeit/core/di/injector.dart';
import 'package:writeit/app/router/app_router.dart';
import 'package:writeit/core/theme/app_theme.dart';

import 'package:writeit/features/main_page/presentation/bloc/word_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<WordBloc>()
        ..add(LoadWords()),

      child: MaterialApp.router(

        debugShowCheckedModeBanner: false,

        theme: AppTheme.light,

        darkTheme: AppTheme.dark,

        themeMode: ThemeMode.system,

        routerConfig: appRouter,
      ),
    );
  }
}