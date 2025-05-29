import 'package:code_con_course_fe/presentation/constant.dart';
import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: tertiaryColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: const Text(
        'v1.0.0 - 2024 CodeCon. All rights reserved.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
