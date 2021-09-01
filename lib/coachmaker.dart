library coachmaker;

export './src/widgets/widget_point.dart';
export './src/models/coach_button_model.dart';
export './src/models/coach_model.dart';

import 'package:coachmaker/src/models/coach_button_model.dart';
import 'package:coachmaker/src/models/coach_model.dart';
import 'package:coachmaker/src/widgets/widget_main.dart';
import 'package:flutter/material.dart';

enum CoachMakerControl { none, next, close }

class CoachMaker {
  final List<CoachModel> initialList;
  final BuildContext _context;
  final CoachMakerControl nextStep;
  final CoachButtonOptions? buttonOptions;

  CoachMaker(this._context,
      {required this.initialList,
      this.nextStep = CoachMakerControl.next,
      this.buttonOptions});

  OverlayEntry? _overlayEntry;
  int _currentIndex = 0;
  double x = 0, y = 0, h = 0, w = 0;

  OverlayEntry _buildOverlay() {
    return OverlayEntry(builder: (context) {
      return WidgetMain(
        x: x - 8,
        y: y - 8,
        h: h + 16,
        w: w + 16,
        padding: 10,
        buttonOptions: buttonOptions ?? CoachButtonOptions(),
        model: initialList[_currentIndex],
        onTapNext: () {
          switch (nextStep) {
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
      RenderBox box = GlobalObjectKey(initialList[_currentIndex].initial!)
          .currentContext!
          .findRenderObject() as RenderBox;

      Offset position = box.localToGlobal(Offset.zero);
      y = position.dy;
      x = position.dx;
      h = box.size.height;
      w = box.size.width;

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
    _currentIndex++;
    removeOverlay();
    if (_currentIndex < initialList.length) show();
  }
}
