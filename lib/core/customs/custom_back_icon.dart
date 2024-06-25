import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  CustomBackButton({super.key, this.callBack});
  Function? callBack;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Center(
        child: InkWell(
          child: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).appBarTheme.iconTheme!.color,
          ),
          onTap: () {
            if (callBack != null) {
              callBack!();
            }
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
