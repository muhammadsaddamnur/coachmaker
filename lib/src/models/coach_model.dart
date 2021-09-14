import 'package:flutter/material.dart';

class CoachModel {
  CoachModel(
      {this.initial,
      this.title,
      this.subtitle,
      this.header,
      this.maxWidth,
      this.alignment = Alignment.center,
      this.callBack,
      this.scrollOptions});

  String? initial;
  String? title;
  List<dynamic>? subtitle;
  Widget? header;
  double? maxWidth;
  AlignmentGeometry? alignment;
  Future<bool> Function()? callBack;
  ScrollOptions? scrollOptions;
}

class ScrollOptions {
  ScrollOptions(
      {this.scrollController,
      this.extraHeight = 0,
      this.scrollToIndex,
      this.isLast = false});

  double extraHeight;
  ScrollController? scrollController;
  int? scrollToIndex;
  bool isLast;
}
