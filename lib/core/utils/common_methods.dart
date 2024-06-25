import 'package:flutter/material.dart';

import '../customs/custom_text_style.dart';

class CommonMethods {
  static List<Widget> buildAuthorsWithCommas(
      List<String> list, BuildContext context) {
    List<Widget> widgets = [];
    for (int i = 0; i < list.length; i++) {
      widgets.add(Text(
        list[i],
        style: Theme.of(context).textTheme.displaySmall,
      ));
      if (i < list.length - 1) {
        widgets.add(Text(
          ', ',
          style: Theme.of(context).textTheme.displaySmall,
        ));
      }
    }
    return widgets;
  }
}
