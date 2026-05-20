import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData light = FlexThemeData.light(
    scheme: FlexScheme.deepBlue,

    scaffoldBackground: const Color(
      0xFFF5F7FA,
    ),

    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,

    blendLevel: 10,

    useMaterial3: true,
  );

  static ThemeData dark = FlexThemeData.dark(
    scheme: FlexScheme.deepBlue,

    scaffoldBackground: const Color(
      0xFF121212,
    ),

    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,

    blendLevel: 15,

    useMaterial3: true,
  );
}