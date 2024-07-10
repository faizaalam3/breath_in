import 'package:breathin/utils/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          "We've got some error to show this screen. Please restart the app".text(),
        ],
      ),
    );
  }
}
