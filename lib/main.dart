import 'package:code_con_course_fe/presentation/constant.dart';
import 'package:code_con_course_fe/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
            textTheme: GoogleFonts.poppinsTextTheme()),
        home: HomePage());
  }
}
