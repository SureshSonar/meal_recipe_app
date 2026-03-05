import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_recipe_app/Screen/homeScreen.dart';

void main() {
  runApp(const recipe_app());
}

class recipe_app extends StatelessWidget {
  const recipe_app({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 134, 55, 55),
          ),
          textTheme: GoogleFonts.latoTextTheme(),
          scaffoldBackgroundColor: Colors.black12,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.white),
          ),
        ),
        home: const homeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
