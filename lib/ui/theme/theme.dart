import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.black26,
    useMaterial3: true,
    dividerColor: Colors.white24,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black26,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
      labelSmall: TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
    ),
    listTileTheme: const ListTileThemeData(
        iconColor: Colors.white
    )
);