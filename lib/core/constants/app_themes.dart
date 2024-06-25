import 'package:e_book/core/constants/app_color.dart';
import 'package:e_book/core/customs/custom_text_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // static ThemeData lightTheme(BuildContext context) {
  //   return ThemeData(
  //     scaffoldBackgroundColor: Colors.white,
  //     fontFamily: "Muli",
  //     appBarTheme: const AppBarTheme(
  //         color: Colors.white,
  //         elevation: 0,
  //         iconTheme: IconThemeData(color: Colors.black),
  //         titleTextStyle: TextStyle(color: Colors.black)),
  //     textTheme: const TextTheme(
  //       bodyLarge: TextStyle(color: Colors.black),
  //       bodyMedium: TextStyle(color: Colors.black),
  //       bodySmall: TextStyle(color: Colors.black),
  //     ),
  //     inputDecorationTheme: const InputDecorationTheme(
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
  //       enabledBorder: outlineInputBorder,
  //       focusedBorder: outlineInputBorder,
  //       border: outlineInputBorder,
  //     ),
  //     visualDensity: VisualDensity.adaptivePlatformDensity,
  //     elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: ElevatedButton.styleFrom(
  //         elevation: 0,
  //         backgroundColor: AppColors.backroundColor,
  //         foregroundColor: Colors.white,
  //         minimumSize: const Size(double.infinity, 48),
  //         shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(16)),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  static ThemeData lightThemes = ThemeData(
      primaryColor: ThemeData.light().scaffoldBackgroundColor,
      colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.backroundColor,
          background: Colors.white,
          secondary: AppColors.secondaryColor,
          secondaryContainer: AppColors.thirdColor),
      textTheme: TextTheme(
        displayLarge: CustomTextStyles.headerTextStyle(),
        displayMedium: CustomTextStyles.header2TextStyle(),
        displaySmall: CustomTextStyles.header3TextStyle(),
        bodyLarge: CustomTextStyles.normalTextStyle(),
        titleMedium: CustomTextStyles.warningTextStyle(),
        bodyMedium: CustomTextStyles.seeMoreNormalTextStyle(),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.secondaryColor,
        selectedItemColor: Colors.black,
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.thirdColor,
          iconTheme: IconThemeData(color: Colors.black)));

  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.dark().copyWith(
        background: const Color.fromARGB(255, 97, 96, 96),
        primary: AppColors.backroundColor,
        secondary: AppColors.secondaryColor,
        secondaryContainer: AppColors.thirdColor),
    textTheme: TextTheme(
      displayLarge: CustomTextStyles.headerDarkTextStyle(),
      displayMedium: CustomTextStyles.header2DarkTextStyle(),
      displaySmall: CustomTextStyles.header3DarkTextStyle(),
      bodyLarge: CustomTextStyles.normalDarkTextStyle(),
      titleMedium: CustomTextStyles.warningDarkTextStyle(),
      bodyMedium: CustomTextStyles.seeMoreNormalDarkTextStyle(),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.secondaryColor,
      selectedItemColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.thirdColor,
        iconTheme: IconThemeData(color: Colors.white)),
  );
}
