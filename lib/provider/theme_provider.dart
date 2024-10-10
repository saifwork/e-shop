import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // Initially setting light theme with Poppins font
  ThemeData themeData = ThemeData.light().copyWith(
    primaryColor: const Color(0xFFCED3DC),
    scaffoldBackgroundColor: const Color(0xFFCED3DC),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Color(0xff0C54BE),
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins', // Applying Poppins Bold
      ),
      bodyLarge: TextStyle(
        color: Color(0xff0C54BE),
        fontSize: 16,
        fontWeight: FontWeight.w500, // Poppins Medium
        fontFamily: 'Poppins', // Applying Poppins Medium
      ),
      bodyMedium: TextStyle(
        color: Color(0xFFCED3DC),
        fontSize: 14,
        fontWeight: FontWeight.w400, // Regular weight
        fontFamily: 'Poppins', // Applying Poppins Regular
      ),
      labelSmall: TextStyle(
        color: Color(0xff303F60),
        fontSize: 14,
        fontFamily: 'Poppins',
      ),
      labelMedium: TextStyle(
        color: Color(0xff303F60),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: const Color(0xff0C54BE), // Example for blueColor in button
    ),
  );

  bool isDarkMode = false; // Track the theme mode

  ThemeData get getThemeData => themeData;

  Color primaryColor = const Color(0xFFCED3DC);
  Color get getPrimaryColor => primaryColor;

  Color lightColor = const Color(0xffF5F9FD);
  Color get getLightColor => lightColor;

  Color primaryText = const Color(0xff303F60);
  Color get getPrimaryText => primaryText;

  Color secondaryText = const Color(0xffF5F9FD);
  Color get getSecondaryText => secondaryText;

  Color blueColor = const Color(0xff0C54BE);
  Color get getBlueColor => blueColor;

  // Method to toggle between light and dark themes
  void toggleTheme() {
    if (isDarkMode) {
      themeData = ThemeData.light().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: lightColor,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color(0xff303F60),
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins', // Applying Poppins Bold
          ),
          bodyLarge: TextStyle(
            color: Color(0xff303F60),
            fontSize: 16,
            fontWeight: FontWeight.w500, // Poppins Medium
            fontFamily: 'Poppins', // Applying Poppins Medium
          ),
          bodyMedium: TextStyle(
            color: Color(0xff0C54BE),
            fontSize: 14,
            fontWeight: FontWeight.w400, // Regular weight
            fontFamily: 'Poppins', // Applying Poppins Regular
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: blueColor,
        ),
      );
      isDarkMode = false;
    } else {
      themeData = ThemeData.dark().copyWith(
        primaryColor: Colors.grey[800], // Example for dark theme
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins', // Applying Poppins Bold
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500, // Poppins Medium
            fontFamily: 'Poppins', // Applying Poppins Medium
          ),
          bodyMedium: TextStyle(
            color: Color(0xff0C54BE),
            fontSize: 14,
            fontWeight: FontWeight.w400, // Regular weight
            fontFamily: 'Poppins', // Applying Poppins Regular
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: blueColor,
        ),
      );
      isDarkMode = true;
    }

    notifyListeners(); // Notify listeners about theme change
  }
}