import 'package:e_book/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextStyles {
  static TextStyle normalTextStyle() {
    return const TextStyle(color: Colors.black, fontSize: 14);
  }

  static TextStyle headerTextStyle() {
    return const TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
  }

  static TextStyle header2TextStyle() {
    return const TextStyle(
        color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold);
  }

  static TextStyle header3TextStyle() {
    return const TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);
  }

  static TextStyle lighterHeaderTextStyle() {
    return const TextStyle(
      color: Color.fromARGB(255, 24, 24, 24),
      fontSize: 16,
    );
  }

  static TextStyle backgroundHeaderTextStyle() {
    return const TextStyle(
        color: AppColors.backroundColor,
        fontSize: 18,
        fontWeight: FontWeight.bold);
  }

  static TextStyle backgroundHeader2TextStyle() {
    return const TextStyle(
        color: AppColors.backroundColor,
        fontSize: 17,
        fontWeight: FontWeight.bold);
  }

  static TextStyle backgroundHeader3TextStyle() {
    return const TextStyle(
        color: AppColors.backroundColor,
        fontSize: 16,
        fontWeight: FontWeight.bold);
  }

  static TextStyle backgroundNormalTextStyle() {
    return const TextStyle(
      color: AppColors.backroundColor,
      fontSize: 14,
      decoration: TextDecoration.underline,
    );
  }

  static TextStyle seeMoreNormalTextStyle() {
    return const TextStyle(
      color: AppColors.backroundColor,
      fontSize: 14,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.backroundColor,
    );
  }

  static TextStyle warningTextStyle() {
    return const TextStyle(
        color: AppColors.warningColor,
        fontSize: 16,
        fontWeight: FontWeight.bold);
  }

  // dark themes
  static TextStyle normalDarkTextStyle() {
    return const TextStyle(color: Colors.white, fontSize: 14);
  }

  static TextStyle headerDarkTextStyle() {
    return const TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
  }

  static TextStyle header2DarkTextStyle() {
    return const TextStyle(
        color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold);
  }

  static TextStyle header3DarkTextStyle() {
    return const TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
  }

  static TextStyle backgroundDarkHeaderTextStyle() {
    return const TextStyle(
        color: Color.fromARGB(255, 0, 151, 252),
        fontSize: 18,
        fontWeight: FontWeight.bold);
  }

  static TextStyle backgroundHeader2DarkTextStyle() {
    return const TextStyle(
        color: AppColors.backroundColor,
        fontSize: 17,
        fontWeight: FontWeight.bold);
  }

  static TextStyle backgroundHeader3DarkTextStyle() {
    return const TextStyle(
        color: AppColors.backroundColor,
        fontSize: 16,
        fontWeight: FontWeight.bold);
  }

  static TextStyle backgroundNormalDarkTextStyle() {
    return const TextStyle(
      color: AppColors.backroundColor,
      fontSize: 14,
      decoration: TextDecoration.underline,
    );
  }

  static TextStyle seeMoreNormalDarkTextStyle() {
    return const TextStyle(
      color: Color.fromARGB(255, 0, 138, 231),
      fontSize: 14,
      decoration: TextDecoration.underline,
      decorationColor: Color.fromARGB(255, 0, 138, 231),
    );
  }

  static TextStyle warningDarkTextStyle() {
    return const TextStyle(
        color: AppColors.warningColor,
        fontSize: 16,
        fontWeight: FontWeight.bold);
  }
}
