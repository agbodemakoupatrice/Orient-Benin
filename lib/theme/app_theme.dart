import 'package:flutter/material.dart';

class AppTheme {
  //======= Couleurs Principales ========
  static const Color primaryColor = Color(0xFF1A7A4A); // vert Bénin
  static const Color secondaryColor = Color(0xFFF5A623); // orange/jaune
  static const Color backgroundColor = Color(0xFFF5F5F5); // gris clair
  static const Color whiteColor = Color(0xFFFFFFFF); // blanc
  static const Color darkColor = Color(0xFF212121); // noir doux
  static const Color greyColor = Color(0xFF9E9E9E); // gris
  static const Color errorColor = Color(0xFFE53935); // rouge erreur

  // ======= Thème Global =====
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      scaffoldBackgroundColor: backgroundColor,

      // Barre du haut (AppBar)
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: whiteColor,
        ),
      ),

      // Boutons princpaux
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: whiteColor,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),

      // champ de texte
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: whiteColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: greyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}
