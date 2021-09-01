import 'package:flutter/material.dart';

class CoachModel {
  CoachModel({
    this.initial,
    this.title,
    this.subtitle,
    this.header,
  });

  String? initial;
  String? title;
  List<dynamic>? subtitle;
  Widget? header;
}
