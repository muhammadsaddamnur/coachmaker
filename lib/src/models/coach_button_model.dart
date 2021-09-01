import 'package:flutter/material.dart';

class CoachButtonOptions {
  CoachButtonOptions({
    this.buttonTitle = 'Next',
    this.buttonStyle = const ButtonStyle(),
  });

  String? buttonTitle;
  ButtonStyle? buttonStyle;
}
