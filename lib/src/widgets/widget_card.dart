import 'package:coachmaker/src/models/coach_button_model.dart';
import 'package:coachmaker/src/models/coach_model.dart';
import 'package:flutter/material.dart';

class WidgetCard extends StatefulWidget {
  final double x, y, h, w;
  final bool enable;
  final Widget? child;
  final CoachModel model;
  final CoachButtonOptions? buttonOptions;
  final Function()? onTapNext;

  const WidgetCard(
      {Key? key,
      required this.enable,
      required this.x,
      required this.y,
      required this.h,
      required this.w,
      required this.model,
      this.buttonOptions,
      this.child,
      this.onTapNext})
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
  int currentPage = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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

    await Future.delayed(Duration(milliseconds: 1005));
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
      ///only center
      // left: ((MediaQuery.of(context).size.width / 2) - (wCard / 2)),
      left: 0,
      top: y + h + hCard + (widget.model.subtitle!.length == 1 ? 0 : 50) >
              MediaQuery.of(context).size.height
          ? y - hCard - (widget.model.subtitle!.length == 1 ? 24 : 16)
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

          ///remove sizebox for only center
          ///
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: widget.model.alignment!,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Container(
                  width: widget.model.maxWidth == null
                      ? MediaQuery.of(context).size.width - 80
                      : widget.model.maxWidth,
                  key: GlobalObjectKey('pointWidget1234567890'),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.model.header ?? SizedBox(),
                        widget.model.header == null
                            ? SizedBox()
                            : SizedBox(
                                width: 10,
                              ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.model.title}',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                              widget.model.subtitle!.length == 1
                                  ? Text(
                                      '${widget.model.subtitle!.first}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 100,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500),
                                    )
                                  : SizedBox(
                                      height: 50,
                                      child: ScrollConfiguration(
                                        behavior: MyBehavior(),
                                        child: PageView.builder(
                                            onPageChanged: (x) {
                                              setState(() {
                                                currentPage = x;
                                              });
                                            },
                                            controller: _pageController,
                                            itemCount:
                                                widget.model.subtitle!.length,
                                            itemBuilder: (context, index) {
                                              return Text(
                                                '${widget.model.subtitle![index]}',
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              );
                                            }),
                                      ),
                                    ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  widget.model.subtitle!.length == 1
                                      ? SizedBox()
                                      : Row(
                                          children: List.generate(
                                              widget.model.subtitle!.length,
                                              (index) => Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 3),
                                                    child: Container(
                                                      height: 5,
                                                      width: 5,
                                                      decoration: BoxDecoration(
                                                          color: index ==
                                                                  currentPage
                                                              ? Colors.black87
                                                              : Colors.grey,
                                                          shape:
                                                              BoxShape.circle),
                                                    ),
                                                  )),
                                        ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (widget.model.subtitle!.length == 1 ||
                                          _pageController.hasClients) {
                                        if (currentPage + 1 ==
                                            widget.model.subtitle!.length) {
                                          widget.onTapNext!();
                                          if (_pageController.hasClients) {
                                            _pageController.animateToPage(
                                              0,
                                              duration: const Duration(
                                                  milliseconds: 400),
                                              curve: Curves.easeInOut,
                                            );
                                          }
                                        } else {
                                          _pageController.animateToPage(
                                            currentPage + 1,
                                            duration: const Duration(
                                                milliseconds: 400),
                                            curve: Curves.easeInOut,
                                          );
                                        }
                                      }
                                    },
                                    child: Text(
                                        '${widget.buttonOptions!.buttonTitle}'),
                                    style: widget.buttonOptions!.buttonStyle,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
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

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
