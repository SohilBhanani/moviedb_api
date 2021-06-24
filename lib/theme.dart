import 'package:flutter/material.dart';
import 'package:sohilbhanani_moviedb/colors.dart';

ThemeData appTheme() => ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: kPrim,
      accentColor: kSec,
      fontFamily: 'Ubuntu',
  textTheme: const TextTheme(
    headline1: const TextStyle(
      fontSize: 28,
      fontFamily: 'Pacifico',
    ),
    headline3: const TextStyle(
      fontSize: 28,
      fontFamily: 'Ubuntu',
      fontWeight: FontWeight.w300,
    ),
    headline5: const TextStyle(
      fontSize: 24,
      fontFamily: 'Ubuntu',
    ),
    headline6: const TextStyle(
      fontFamily: 'Ubuntu',
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: const TextStyle(fontFamily: 'Ubuntu', fontSize: 18),
    button: const TextStyle(
      fontFamily: 'Ubuntu',
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
  ),
    );
