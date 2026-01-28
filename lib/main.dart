import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    flutter_body_health_calculator_app()
  );
}

class flutter_body_health_calculator_app extends StatelessWidget {
  const flutter_body_health_calculator_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}