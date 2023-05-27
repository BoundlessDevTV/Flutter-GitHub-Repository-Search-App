import 'package:flutter/material.dart';

import '../const/constants.dart';

Color getLanguageColor(String? language) {
  switch (language) {
    case 'Dart':
      return colorTeal;
    case 'C++':
      return colorHotPink;
    case 'HTML':
      return colorVermilion;
    case 'JavaScript':
      return colorGoldenrod;
    case 'C':
      return colorDimGray;
    case 'Java':
      return colorRusset;
    case 'Makefile':
      return colorDarkLimeGreen;
    case 'Go':
      return colorVividBlue;
    case 'Kotlin':
      return colorLavender;
    case 'Objective-C':
      return colorBrilliantBlue;
    case 'PHP':
      return colorIndigo;
    case 'Shell':
      return colorLimeGreen;
    case 'Objective-C++':
      return colorCornflowerBlue;
    case 'Swift':
      return colorCoral;
    case 'Python':
      return colorSteelBlue;
    case 'Ruby':
      return colorMaroon;
    case 'Rust':
      return colorDesertSand;
    case 'TypeScript':
      return colorCeruleanBlue;
    case 'Dockerfile':
      return colorTealBlue;
    case 'Svelte':
      return colorOrangeRed;
    case 'ASP.NET':
      return colorElectricViolet;
    case 'C#':
      return colorForestGreen;
    case 'CSS':
      return colorDeepPurple;
    case 'Elm':
      return colorSkyBlue;
    case 'Sass':
      return colorDarkMagenta;
    case 'R':
      return colorDodgerBlue;
    default:
      return colorWithe;
  }
}
