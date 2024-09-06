import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.black26,
    useMaterial3: true,
    dividerColor: Colors.white,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black26,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        elevation: 0,
    ),
    cardTheme: const CardTheme(
      margin: EdgeInsets.all(50.0),

    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 26,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 36,
      ),
      labelMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 28,
      ),
      labelSmall: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
    ),
    listTileTheme: const ListTileThemeData(
        iconColor: Colors.white
    )
);