import 'package:flutter/material.dart';

class CoachModel {
  CoachModel(
      {this.initial,
      this.title,
      this.subtitle,
      this.header,
      this.maxWidth,
      this.alignment = Alignment.center});

  String? initial;
  String? title;
  List<dynamic>? subtitle;
  Widget? header;
  double? maxWidth;
  AlignmentGeometry? alignment;
}
