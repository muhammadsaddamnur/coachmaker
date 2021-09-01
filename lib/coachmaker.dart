library coachmaker;

export './src/widgets/widget_point.dart';
import 'package:coachmaker/src/widgets/widget_main.dart';
import 'package:flutter/material.dart';

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
      return WidgetMain(
        x: x - 8,
        y: y - 8,
        h: h + 16,
        w: w + 16,
        padding: 10,
        onTapPoint: () {
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
