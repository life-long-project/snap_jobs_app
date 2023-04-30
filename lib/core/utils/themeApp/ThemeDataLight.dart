import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getThemeDtaLight() => ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Colors.blue,
      ),
      fontFamily: GoogleFonts.lato().fontFamily,
      textTheme: const TextTheme(
        displayMedium: TextStyle(
            fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black87),
        displaySmall: TextStyle(
            fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black87),
        bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        bodySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
      ),
      iconTheme: const IconThemeData(color: Colors.black87),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.blue)),
      ),
      buttonTheme: const ButtonThemeData(),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.blue,
          textStyle: const TextStyle(fontSize: 20),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onPrimary: Colors.white,
          textStyle: const TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
      filledButtonTheme: FilledButtonThemeData(),
      buttonBarTheme: ButtonBarThemeData(),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            //size
            fixedSize: MaterialStateProperty.all(const Size.fromHeight(20))),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            //size
            fixedSize: MaterialStateProperty.all(const Size.fromHeight(20))),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: (Colors.blue),
        height: 70.0,
        shadowColor: Colors.white,
      ),
    );
