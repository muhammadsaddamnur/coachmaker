library coachmaker;

export './src/widgets/widget_point.dart';
import 'package:coachmaker/src/widgets/widget_card.dart';
import 'package:flutter/material.dart';

import 'src/widgets/widget_container.dart';

enum CoachMakerControl { none, next, close }

class CoachMaker {
  final List<String> initialList;
  final BuildContext _context;
  final CoachMakerControl pointOnTap;

  CoachMaker(
    this._context, {
    required this.initialList,
    this.pointOnTap = CoachMakerControl.close,
  });

  OverlayEntry? _overlayEntry;
  int currentIndex = 0;
  double x = 0, y = 0, h = 0, w = 0;

  OverlayEntry _buildOverlay() {
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
                GestureDetector(
                  onTap: () {
                    // removeOverlay();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        backgroundBlendMode: BlendMode
                            .dstOut), // This one will handle background + difference out
                  ),
                ),
                // Positioned(
                //   left: x - 8,
                //   top: y - 8,
                //   child: Container(
                //     height: h + 16,
                //     width: w + 16,
                //     decoration: BoxDecoration(
                //       color: Colors.red,
                //     ),
                //   ),
                // ),
                WidgetContainer(
                  x: x - 8,
                  y: y - 8,
                  height: h + 16,
                  width: w + 16,
                  padding: 10,
                  onTap: () {
                    switch (pointOnTap) {
                      case CoachMakerControl.next:
                        nextOverlay();
                        break;
                      case CoachMakerControl.close:
                        removeOverlay();
                        break;
                      case CoachMakerControl.none:
                        break;
                      default:
                    }
                  },
                ),
              ],
            ),
          ),
          // Positioned(
          //   left: x,
          //   top: y + h,
          //   child: Card(
          //     child: Text(
          //       'Overlay',
          //     ),
          //   ),
          // ),
          WidgetCard(
            top: y + h + 24,
          )
        ],
      );
    });
  }

  void show() {
    Future.delayed(Duration.zero, () {
      RenderBox box = GlobalObjectKey(initialList[currentIndex])
          .currentContext!
          .findRenderObject() as RenderBox;

      Offset position = box.localToGlobal(Offset.zero);
      y = position.dy;
      x = position.dx;
      h = box.size.height;
      w = box.size.width;
      print(y);
      print(x);
      print(box.size.height);
      if (_overlayEntry == null) {
        _overlayEntry = _buildOverlay();
        Overlay.of(_context)?.insert(_overlayEntry!);
      }
    });
  }

  void removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void nextOverlay() {
    currentIndex++;
    removeOverlay();
    if (currentIndex < initialList.length) show();
  }
}
