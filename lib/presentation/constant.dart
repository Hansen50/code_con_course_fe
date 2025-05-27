import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF3A3089);
const Color secondaryColor = Color(0xFFF7669D);
const Color tertiaryColor = Color(0xFF2E266F);

const sizedBoxWidth5 = SizedBox(width: 5);
const SizedBoxWidth20 = SizedBox(width: 20);

const SizedBoxHeight5 = SizedBox(height: 5);
const SizedBoxHeight10 = SizedBox(height: 10);
const sizedBoxHeight20 = SizedBox(height: 20);
const sizedBoxHeight30 = SizedBox(height: 30);
const sizedBoxHeight40 = SizedBox(height: 40);
const sizedBoxHeight60 = SizedBox(height: 60);

const blueProgressIndicator = SizedBox(
  height: 25,
  width: 25,
  child: CircularProgressIndicator(
    color: primaryColor,
  ),
);

const pinkProgressIndicator = SizedBox(
  height: 25,
  width: 25,
  child: CircularProgressIndicator(
    color: secondaryColor,
  ),
);
