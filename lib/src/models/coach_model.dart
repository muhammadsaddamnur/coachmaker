import 'package:flutter/material.dart';

class CoachModel {
  CoachModel(
      {this.initial,
      this.title,
      this.subtitle,
      this.header,
      this.maxWidth,
      this.alignment = Alignment.center,
      this.nextOnTapCallBack,
      this.scrollOptions});

  String? initial;
  String? title;
  List<dynamic>? subtitle;
  Widget? header;
  double? maxWidth;
  AlignmentGeometry? alignment;
  Future<bool> Function()? nextOnTapCallBack;
  ScrollOptions? scrollOptions;
}

class ScrollOptions {
  ScrollOptions(
      {this.scrollController,
      this.manualHeight,
      this.scrollToIndex,
      this.isLast = false});

  double? manualHeight;
  ScrollController? scrollController;
  int? scrollToIndex;
  bool isLast;
}
