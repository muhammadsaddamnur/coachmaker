library coachmaker;

import 'package:flutter/material.dart';

class CoachMaker {
  final List<String> initialList;
  final BuildContext _context;

  CoachMaker(this._context, {required this.initialList});

  OverlayEntry _buildOverlay({x, y, h, w}) {
    return OverlayEntry(builder: (context) {
      return Stack(
        fit: StackFit.expand,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8),
                BlendMode.srcOut), // This one will create the magic
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      backgroundBlendMode: BlendMode
                          .dstOut), // This one will handle background + difference out
                ),
                Positioned(
                  left: x - 8,
                  top: y - 8,
                  child: Container(
                    height: h + 16,
                    width: w + 16,
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: x,
            top: y + h,
            child: Material(
              child: Text(
                'Overlay',
              ),
            ),
          ),
        ],
      );
    });
  }

  void show() {
    Future.delayed(Duration.zero, () {
      RenderBox box =
          GlobalObjectKey('1').currentContext!.findRenderObject() as RenderBox;

      Offset position = box.localToGlobal(Offset.zero);
      double y = position.dy;
      double x = position.dx;
      double height = box.size.height;
      double width = box.size.width;
      print(y);
      print(x);
      print(box.size.height);
      Overlay.of(_context)
          ?.insert(_buildOverlay(x: x, y: y, h: height, w: width));
    });
  }
}

class Point extends StatelessWidget {
  final String initial;
  final Widget child;
  const Point({Key? key, required this.initial, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: GlobalObjectKey('$initial'),
      child: child,
    );
  }
}
