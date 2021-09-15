import 'package:coachmaker/coachmaker.dart';
import 'package:flutter/material.dart';

class ScrollManualHeightExample extends StatefulWidget {
  ScrollManualHeightExample({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ScrollManualHeightExampleState createState() =>
      _ScrollManualHeightExampleState();
}

class _ScrollManualHeightExampleState extends State<ScrollManualHeightExample> {
  final ScrollController _scrollController = ScrollController();

  List listku = [];
  @override
  void initState() {
    listku.addAll(List.generate(100, (index) => '$index'));
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CoachPoint(
              initial: '1',
              child: Container(
                height: 100,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: 500,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CoachPoint(
              initial: '2',
              child: Container(
                height: 300,
                color: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CoachPoint(
              initial: '3',
              child: Container(
                height: 500,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            height: 500,
          ),
          SizedBox(
            height: 500,
          ),
          SizedBox(
            height: 500,
          ),
          SizedBox(
            height: 500,
          ),
          SizedBox(
            height: 500,
          ),
          SizedBox(
            height: 500,
          ),
          SizedBox(
            height: 500,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CoachPoint(
        initial: 'floatBtn',
        child: FloatingActionButton(
          onPressed: () {
            CoachMaker(context,
                    initialList: [
                      CoachModel(
                        initial: '1',
                        title: 'Burung kakak tua',
                        maxWidth: 400,
                        subtitle: [
                          'Burung kakak tua\nHinggap di jendela\nNenek sudah tua\nGiginya tinggal dua',
                        ],
                        header: Image.asset(
                          'images/logo.png',
                          height: 50,
                          width: 50,
                        ),
                        scrollOptions: ScrollOptions(
                            scrollController: _scrollController,
                            manualHeight: 600),
                      ),
                      CoachModel(
                          initial: '2',
                          title: 'Belajar Berhitung',
                          maxWidth: 400,
                          subtitle: [
                            '1',
                            '2',
                            '3',
                            '4',
                            '5',
                          ],
                          scrollOptions: ScrollOptions(
                              scrollController: _scrollController,
                              manualHeight: 900),
                          header: Image.asset(
                            'images/logo.png',
                            height: 50,
                            width: 50,
                          )),
                      CoachModel(
                          initial: '3',
                          title: 'Nomer 60',
                          maxWidth: 400,
                          subtitle: [
                            'Tuh kan loncat',
                          ],
                          scrollOptions: ScrollOptions(
                              scrollController: _scrollController,
                              isLast: true),
                          header: Image.asset(
                            'images/logo.png',
                            height: 50,
                            width: 50,
                          )),
                      CoachModel(
                          initial: 'floatBtn',
                          title: 'Huftt lelah juga',
                          maxWidth: 400,
                          subtitle: [
                            'Dahlah ya',
                          ],
                          header: Image.asset(
                            'images/logo.png',
                            height: 50,
                            width: 50,
                          )),
                    ],
                    skip: () {},
                    nextStep: CoachMakerControl.next,
                    buttonOptions: CoachButtonOptions(
                        skipTitle: 'Lewati',
                        buttonTitle: 'Lanjut',
                        buttonStyle: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                            elevation: MaterialStateProperty.all(0))))
                .show();
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
