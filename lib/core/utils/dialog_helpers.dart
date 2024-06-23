import 'package:e_book/core/constants/app_color.dart';
import 'package:e_book/core/customs/custom_text_style.dart';
import 'package:flutter/material.dart';

class DialogHelpes {
  Future<void> showBasicDialog(String message, BuildContext context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.thirdColor),
            child: Text(
              message,
              maxLines: 3,
              style: CustomTextStyles.header3TextStyle(),
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}