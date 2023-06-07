import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'lightColors.dart';

class ThemeVariables {
  static const primary = LightColors.white;
  static const secondary = LightColors.blue;
  static const tertiary = LightColors.softBlue;
  static const inversePrimary = LightColors.softCyan;
  static const inverseSurface = LightColors.darkBlueBlack;
  static const onInverseSurface = LightColors.white;
  static const onTertiary = LightColors.white;
  static const onPrimary = LightColors.darkGrey;
  static const onSecondary = LightColors.white;
  static const surface = LightColors.white;
  static const onSurface = LightColors.darkBlueBlack;
  static const background = LightColors.white;
  static const onBackground = LightColors.darkGrey;
  static const error = Colors.red;
  static const onError = LightColors.white;
  static const brightness = Brightness.light;

  static const inputColor = LightColors.softGrey;
}

ThemeData getThemeDtaLight() => ThemeData(
  //*colors
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme(
          primary: ThemeVariables.primary,
          secondary: ThemeVariables.secondary,
          tertiary: ThemeVariables.tertiary,
          onPrimary: ThemeVariables.onPrimary,
          onSecondary: ThemeVariables.onSecondary,
          onTertiary: ThemeVariables.onTertiary,
          inversePrimary: ThemeVariables.inversePrimary,
          inverseSurface: ThemeVariables.inverseSurface,
          onInverseSurface: ThemeVariables.onInverseSurface,
          surface: ThemeVariables.surface,
          onSurface: ThemeVariables.onSurface,
          background: ThemeVariables.background,
          onBackground: ThemeVariables.onBackground,
          error: ThemeVariables.error,
          onError: ThemeVariables.onError,
          brightness: ThemeVariables.brightness),
      fontFamily: GoogleFonts.poppins().fontFamily,
      iconTheme: const IconThemeData(color: ThemeVariables.onBackground),
      //*inputDecoration
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: ThemeVariables.inputColor,
        filled: true,
        
        prefixIconColor: ThemeVariables.secondary,
        suffixIconColor: ThemeVariables.secondary,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gapPadding: 4,
            borderSide: BorderSide.none),
      ),
      //*elevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ThemeVariables.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      //*outlinedButton
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: ThemeVariables.inverseSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
