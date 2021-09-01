import 'dart:async';

import 'package:flutter/material.dart';

class WidgetContainer extends StatefulWidget {
  final double height, width, x, y, padding, borderRadius;
  final Function? onTap;
  WidgetContainer(
      {required this.height,
      required this.width,
      required this.x,
      required this.y,
      this.padding = 8,
      this.borderRadius = 5,
      this.onTap});

  @override
  _WidgetContainerState createState() => _WidgetContainerState();
}

class _WidgetContainerState extends State<WidgetContainer> {
  bool enable = false;
  double h = 0;
  double w = 0;
  double x = 0;
  double y = 0;

  Timer? timer;

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  void start() async {
    await Future.delayed(Duration(milliseconds: 1));
    setState(() {
      h = widget.height + (widget.padding * 2);
      w = widget.width + (widget.padding * 2);
      x = widget.x - widget.padding;
      y = widget.y - widget.padding;
    });

    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        h = (h == widget.height + (widget.padding * 2))
            ? widget.height - (widget.padding)
            : widget.height + (widget.padding * 2);
        w = (w == widget.width + (widget.padding * 2))
            ? widget.width - (widget.padding)
            : widget.width + (widget.padding * 2);
        x = (x == widget.x - widget.padding)
            ? widget.x + (widget.padding / 2)
            : widget.x - widget.padding;
        y = (y == widget.y - widget.padding)
            ? widget.y + (widget.padding / 2)
            : widget.y - widget.padding;
      });
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      enable = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: x,
      top: y,
      height: h == 0 ? MediaQuery.of(context).size.height : h,
      width: w == 0 ? MediaQuery.of(context).size.width : w,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      child: GestureDetector(
        onTap: () async {
          if (enable) {
            setState(() {
              enable = false;
            });
            timer!.cancel();
            setState(() {
              h = MediaQuery.of(context).size.height;
              w = MediaQuery.of(context).size.width;
              x = 0;
              y = 0;
            });
            await Future.delayed(Duration(seconds: 1));

            widget.onTap!();
          }
        },
        child: Container(
          height: h == 0 ? MediaQuery.of(context).size.height : h,
          width: w == 0 ? MediaQuery.of(context).size.width : w,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(widget.borderRadius)),
        ),
      ),
    );
  }
}
