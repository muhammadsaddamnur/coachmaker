import 'package:flutter/material.dart';

class WidgetCard extends StatefulWidget {
  final double x, y, h, w;
  final bool enable;
  final Widget? child;
  const WidgetCard(
      {Key? key,
      required this.enable,
      required this.x,
      required this.y,
      required this.h,
      required this.w,
      this.child})
      : super(key: key);

  @override
  _WidgetCardState createState() => _WidgetCardState();
}

class _WidgetCardState extends State<WidgetCard> {
  double left = 0;
  double top = 0;
  double h = 0;
  double w = 0;
  double x = 0;
  double y = 0;
  double hCard = 0;
  double wCard = 0;

  @override
  void initState() {
    super.initState();
    start();
  }

  void start() async {
    Future.delayed(Duration.zero, () {
      RenderBox box = GlobalObjectKey('pointWidget1234567890')
          .currentContext!
          .findRenderObject() as RenderBox;
      setState(() {
        hCard = box.size.height;
        wCard = box.size.width;
      });
    });

    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      x = widget.x;
      y = widget.y;
      h = widget.h;
      w = widget.w;

      top = x + h + 24;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: ((MediaQuery.of(context).size.width / 2) - (wCard / 2)),
      top: y + h > MediaQuery.of(context).size.height
          ? y - hCard - 24
          : y + h + 8,
      child: Material(
        color: Colors.transparent,
        child: AnimatedOpacity(
          duration: Duration(seconds: 1),
          opacity: top == 0
              ? 0
              : widget.enable
                  ? 1
                  : 0,
          child: widget.child != null
              ? SizedBox(
                  key: GlobalObjectKey('pointWidget1234567890'),
                  child: widget.child,
                )
              : Container(
                  width: MediaQuery.of(context).size.width - 80,
                  key: GlobalObjectKey('pointWidget1234567890'),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 35,
                          height: 35,
                          child: Image.network(
                            'https://miro.medium.com/max/700/1*EmDB27i0r74-ynuin1GcWA.png',
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Great Job!',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'wasdjafoaisfjoasjfoijfoijoaisfjoaifjoiasjfoiasjfiojasofijaoifjisofjoaisfjoaisfjoiajfiosjfoij',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
