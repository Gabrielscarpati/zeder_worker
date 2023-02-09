import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class DSTheme {
  static ThemeData theme(BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.blue,
      useMaterial3: true,
      scaffoldBackgroundColor: DSColors.scaffoldBackground,
      textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
    );
  }
}
