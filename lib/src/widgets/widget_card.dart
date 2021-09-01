import 'package:flutter/material.dart';

class WidgetCard extends StatefulWidget {
  final double left, top;
  const WidgetCard({Key? key, this.left = 0, required this.top})
      : super(key: key);

  @override
  _WidgetCardState createState() => _WidgetCardState();
}

class _WidgetCardState extends State<WidgetCard> {
  double left = 0;
  double top = 0;

  @override
  void initState() {
    start();
    super.initState();
  }

  void start() async {
    await Future.delayed(Duration(milliseconds: 1500));
    setState(() {
      left = widget.left;
      top = widget.top;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Align(
            alignment: Alignment.center,
            child: AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: top == 0 ? 0 : 1,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$top',
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
