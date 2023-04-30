import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'lightcolors.dart';

ThemeData getThemeDtaLight() => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme(
        primary: LightColors.white,
        secondary: LightColors.blue,
        tertiary: LightColors.softBlue,
        inversePrimary: LightColors.softCyan,
        inverseSurface: LightColors.darkBlueBlack,
        onInverseSurface: LightColors.white,
        onTertiary: LightColors.white,
        onPrimary: LightColors.darkGrey,
        onSecondary: LightColors.white,
        surface: LightColors.white,
        onSurface: LightColors.darkBlueBlack,
        background: LightColors.white,
        onBackground: LightColors.darkGrey,
        error: Colors.red,
        onError: LightColors.white,
        brightness: Brightness.light,
      ),
      fontFamily: GoogleFonts.poppins().fontFamily,
      iconTheme: const IconThemeData(color: LightColors.darkGrey),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: LightColors.softGrey,
        filled: true,
        prefixIconColor: LightColors.blue,
        suffixIconColor: LightColors.blue,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gapPadding: 4,
            borderSide: BorderSide.none),
      ),
    );
