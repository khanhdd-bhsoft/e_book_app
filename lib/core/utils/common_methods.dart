import 'package:flutter/material.dart';

import '../customs/custom_text_style.dart';

class CommonMethods {
  static List<Widget> buildAuthorsWithCommas(List<String> list) {
    List<Widget> widgets = [];
    for (int i = 0; i < list.length; i++) {
      widgets.add(Text(
        list[i],
        style: CustomTextStyles.lighterHeaderTextStyle(),
      ));
      if (i < list.length - 1) {
        widgets.add(Text(
          ', ',
          style: CustomTextStyles.lighterHeaderTextStyle(),
        ));
      }
    }
    return widgets;
  }
}
