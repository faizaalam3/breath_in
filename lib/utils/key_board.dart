import 'package:flutter/material.dart';

abstract class KeyBoard {
  static void dismiss() => FocusManager.instance.primaryFocus?.unfocus();
}
