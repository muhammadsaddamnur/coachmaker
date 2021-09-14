import 'package:flutter/material.dart';

class CoachButtonOptions {
  CoachButtonOptions({
    this.skipTitle = 'Skip',
    this.buttonTitle = 'Next',
    this.buttonStyle = const ButtonStyle(),
  });

  String? skipTitle;
  ButtonStyle? skipStyle;
  String? buttonTitle;
  ButtonStyle? buttonStyle;
}
