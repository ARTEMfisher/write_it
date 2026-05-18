import 'package:go_router/go_router.dart';

import 'package:writeit/features/main_page/presentation/screens/main_page.dart';

final appRouter = GoRouter(
  routes: [

    GoRoute(
      path: '/',
      builder: (context, state) {
        return const MainPage();
      },
    ),
  ],
);