import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  CustomErrorWidget({super.key, required this.message});
  String message;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Center(
        child: Text(
          message,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
