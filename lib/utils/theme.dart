import 'package:flutter/material.dart';
import 'package:superrewards/utils/resources.dart';

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: colorPrimary, // Button color
    foregroundColor: colorSecondary, // Text color
  ),
);

final appTheme = ThemeData(
  primarySwatch: colorPrimary,
  elevatedButtonTheme: elevatedButtonTheme,
  appBarTheme: const AppBarTheme(
    backgroundColor: colorPrimary,
    iconTheme: IconThemeData(color: colorSecondary),
    titleTextStyle: TextStyle(color: colorSecondary, fontSize: textSizeTitle),
  ),
);