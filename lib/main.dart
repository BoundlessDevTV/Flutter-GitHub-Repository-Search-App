import 'package:flutter/material.dart';
import 'package:github_api/core/const/constants.dart';
import 'package:github_api/features/repositories/presentation/pages/repositories_search_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: colorMidnightBlue,
          textTheme:
              GoogleFonts.poppinsTextTheme().apply(bodyColor: colorPalePink)),
      home: const RepositoriesSearchPage(),
    );
  }
}
