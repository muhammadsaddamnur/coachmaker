import 'package:coachmaker/src/models/coach_button_model.dart';
import 'package:coachmaker/src/models/coach_model.dart';
import 'package:flutter/material.dart';

class WidgetCard extends StatefulWidget {
  final double x, y, h, w;
  final bool enable;
  final Widget? child;
  final CoachModel model;
  final CoachButtonOptions? buttonOptions;
  final Function()? onSkip;
  final Function()? onTapNext;
  final Duration duration;
  final Widget Function(Function? onSkip, Function onNext)? customNavigator;

  const WidgetCard({
    Key? key,
    required this.enable,
    required this.x,
    required this.y,
    required this.h,
    required this.w,
    required this.model,
    required this.duration,
    this.buttonOptions,
    this.child,
    this.onSkip,
    this.onTapNext,
    this.customNavigator,
  }) : super(key: key);

  @override
  _WidgetCardState createState() => _WidgetCardState();
}

class _WidgetCardState extends State<WidgetCard> {
  ///top position
  ///
  double top = 0;

  ///height
  ///
  double h = 0;

  ///width
  ///
  double w = 0;

  ///horizontal
  ///
  double x = 0;

  ///vertical
  ///
  double y = 0;

  ///height card
  ///
  double hCard = 0;

  ///width card
  ///
  double wCard = 0;

  ///current page card
  ///
  int currentPage = 0;

  ///constroller page card
  ///
  PageController pageController = PageController();

  ///init state
  ///
  @override
  void initState() {
    super.initState();
    start();
  }

  ///dispose
  ///
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  ///start method (animation, show, etc)
  ///
  void start() async {
    Future.delayed(Duration.zero, () {
      ///card global key attribute
      ///
      RenderBox box = GlobalObjectKey('pointWidget1234567890')
          .currentContext!
          .findRenderObject() as RenderBox;

      ///set attribute to variables
      ///
      setState(() {
        hCard = box.size.height;
        wCard = box.size.width;
      });
    });

    ///delay 1.5 seconds
    ///
    // await Future.delayed(Duration(milliseconds: 1005));
    await Future.delayed(widget.duration);

    ///set position
    ///
    setState(() {
      x = widget.x;
      y = widget.y;
      h = widget.h;
      w = widget.w;

      top = x + h + 24;
    });
  }

  ///scroll listview method
  ///
  void scrollToIndex({int index = 0, double? manualHeight}) {
    if (manualHeight != null) {
      widget.model.scrollOptions!.scrollController!.animateTo(manualHeight,
          duration: widget.duration, curve: Curves.ease);
    } else {
      /// if index == 0 scroll to top
      ///
      if (index == 0) {
        widget.model.scrollOptions!.scrollController!
            .animateTo(0, duration: widget.duration, curve: Curves.ease);
      } else {
        ///get first widget attribute of list
        ///
        RenderBox box = GlobalObjectKey(widget.model.initial!)
            .currentContext!
            .findRenderObject() as RenderBox;

        ///scroll to index (height of widget * index)
        ///if your widget of listview cannot same height, please set extraheight
        ///

        widget.model.scrollOptions!.scrollController!.animateTo(
            box.size.height * index,
            duration: widget.duration,
            curve: Curves.ease);
      }
    }
  }

  void onNext() async {
    ///if subtitle length = 1 or pageController has client
    ///
    if (widget.model.subtitle!.length == 1 || pageController.hasClients) {
      ///if current page + 1 == total subtitle length
      ///
      if (currentPage + 1 == widget.model.subtitle!.length) {
        ///if callback not null
        ///
        if (widget.model.nextOnTapCallBack != null) {
          ///using if you want to run method before next step
          ///return boolean
          ///
          bool result = await widget.model.nextOnTapCallBack!.call();

          ///if callback return true
          ///
          if (result) {
            ///next step
            ///
            widget.onTapNext!();

            ///if page controller has client
            ///slide to 0
            ///
            if (pageController.hasClients) {
              pageController.animateToPage(
                0,
                duration: widget.duration,
                curve: Curves.easeInOut,
              );
            }
          }
        } else {
          ///next step
          ///
          widget.onTapNext!();

          ///if page controller has client
          ///slide to 0
          ///
          if (pageController.hasClients) {
            pageController.animateToPage(
              0,
              duration: widget.duration,
              curve: Curves.easeInOut,
            );
          }
        }

        ///check if scroll options not null
        ///
        if (widget.model.scrollOptions != null) {
          ///check if scroll options widget is last
          ///
          if (widget.model.scrollOptions!.isLast == true) {
            ///if last scroll to top
            ///
            scrollToIndex(
              index: 0,
            );

            ///delay 1 seconds
            ///
            await Future.delayed(widget.duration);
          } else {
            ///use manual height
            ///
            if (widget.model.scrollOptions!.manualHeight != null) {
              ///if not last, scroll to manual height
              ///
              scrollToIndex(
                  manualHeight: widget.model.scrollOptions!.manualHeight);
            } else {
              ///if not last, scroll to index
              ///
              scrollToIndex(index: widget.model.scrollOptions!.scrollToIndex!);
            }

            ///delay 1 seconds
            ///
            await Future.delayed(widget.duration);
          }
        }
      } else {
        ///next page (card)
        ///
        pageController.animateToPage(
          currentPage + 1,
          duration: widget.duration,
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left:
          MediaQuery.of(context).size.height > MediaQuery.of(context).size.width
              ?

              ///potrait
              ///
              0
              :

              ///lanscape
              ///
              x + w < (MediaQuery.of(context).size.width / 2)
                  ? h > hCard
                      ? x - (w / 2) + 8
                      : (x + w * -1) - 8
                  : (x < (MediaQuery.of(context).size.width / 2)
                      ? h > hCard
                          ? x + w + wCard > MediaQuery.of(context).size.width
                              ? x - wCard
                              : x - (w / 2) + 8
                          : 0
                      : x - w - (w / 2) - wCard - 16),
      top:
          MediaQuery.of(context).size.height > MediaQuery.of(context).size.width
              ?

              ///potrait
              ///
              y + h + hCard + (widget.model.subtitle!.length == 1 ? 0 : 50) >
                      MediaQuery.of(context).size.height
                  ? y - hCard - (widget.model.subtitle!.length == 1 ? 24 : 16)
                  : y + h + 24
              :

              ///landscape
              ///
              y > MediaQuery.of(context).size.height / 2
                  ? y - hCard - (widget.model.subtitle!.length == 1 ? 24 : 16)
                  : y < (MediaQuery.of(context).size.height / 2)
                      ? y + h > hCard
                          ? y
                          : y + h + 8
                      : x < (MediaQuery.of(context).size.width / 2)
                          ? y
                          : y + h + 8,
      child: Material(
        color: Colors.transparent,
        child: AnimatedOpacity(
          duration: widget.duration,
          opacity: top == 0
              ? 0
              : widget.enable
                  ? 1
                  : 0,
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
                                            controller: pageController,
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
                                  widget.customNavigator != null
                                      ? widget.customNavigator!(
                                          widget.onSkip ?? null,
                                          onNext,
                                        )
                                      : Row(
                                          children: [
                                            (widget.onSkip == null
                                                ? SizedBox()
                                                : MaterialButton(
                                                    onPressed: widget.onSkip,
                                                    child: Text(
                                                      '${widget.buttonOptions!.skipTitle}',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  )),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            ElevatedButton(
                                              onPressed: onNext,
                                              child: Text(
                                                  '${widget.buttonOptions!.buttonTitle}'),
                                              style: widget
                                                  .buttonOptions!.buttonStyle,
                                            ),
                                          ],
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
