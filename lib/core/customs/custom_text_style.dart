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
}
