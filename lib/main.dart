import 'package:flutter/material.dart';

import 'package:writeit/app/app.dart';
import 'package:writeit/core/di/injector.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  runApp(
    const App(),
  );
}