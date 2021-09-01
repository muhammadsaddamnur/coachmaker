import 'package:flutter/material.dart';

class CoachPoint extends StatelessWidget {
  final String initial;
  final Widget child;
  const CoachPoint({Key? key, required this.initial, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: GlobalObjectKey('$initial'),
      child: child,
    );
  }
}
