import 'package:coachmaker/coachmaker.dart';
import 'package:flutter/material.dart';

class ScrollExample extends StatefulWidget {
  ScrollExample({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ScrollExampleState createState() => _ScrollExampleState();
}

class _ScrollExampleState extends State<ScrollExample> {
  final ScrollController _scrollController = ScrollController();

  void scrollToIndex() {
    RenderBox box = const GlobalObjectKey('1')
        .currentContext!
        .findRenderObject() as RenderBox;

    _scrollController.animateTo(box.size.height * 49,
        duration: const Duration(milliseconds: 678), curve: Curves.ease);
  }

  List a = [];
  @override
  void initState() {
    a.addAll(List.generate(100, (index) => '$index'));
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // CoachPoint(
            //   initial: '1',
            //   child: Container(
            //     color: Colors.red,
            //     height: 50,
            //     width: 100,
            //     child: Text(
            //       'Sorot aku kakak',
            //       textAlign: TextAlign.center,
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 5,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     CoachPoint(
            //       initial: '2',
            //       child: Container(
            //         color: Colors.red,
            //         height: 50,
            //         width: 100,
            //         child: Text(
            //           'Sorot aku kakak',
            //           textAlign: TextAlign.center,
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 450,
              width: MediaQuery.of(context).size.width,
              child: CustomScrollView(controller: _scrollController, slivers: [
                SliverToBoxAdapter(
                  child: ListView.builder(
                      itemCount: 100,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CoachPoint(
                          initial: a[index],
                          child: ListTile(
                            title: Text('$index'),
                          ),
                        );
                      }),
                )
              ]),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     CoachPoint(
            //       initial: '3',
            //       child: Container(
            //         color: Colors.red,
            //         height: 50,
            //         width: 100,
            //         child: Text(
            //           'Sorot aku kakak',
            //           textAlign: TextAlign.center,
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            ElevatedButton(
                onPressed: () {
                  scrollToIndex();
                },
                child: Text(''))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CoachPoint(
        initial: 'sa4',
        child: FloatingActionButton(
          onPressed: () {
            CoachMaker(context,
                    initialList: [
                      CoachModel(
                          initial: '1',
                          title: 'Indonesia',
                          maxWidth: 400,
                          subtitle: [
                            'Banyak dah pokoknyaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa!',
                          ],
                          header: Image.asset(
                            'images/logo.png',
                            height: 50,
                            width: 50,
                          ),
                          scrollOptions: ScrollOptions(
                              scrollController: _scrollController,
                              scrollToIndex: 50),
                          callBack: () async {
                            // scrollToIndex();
                            // await Future.delayed(Duration(seconds: 2));
                            // print('objectwwwwwwwwwwwwwwww');
                            return true;
                          }),
                      CoachModel(
                          initial: '50',
                          title: 'Indonesia',
                          maxWidth: 400,
                          subtitle: [
                            '1. Aceh',
                            '2. Jakarta',
                            '3. Bali',
                            '4. Papua',
                            'Banyak dah pokoknyaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa!',
                          ],
                          callBack: () async {
                            // scrollToIndex();
                            // await Future.delayed(Duration(seconds: 2));
                            print('objectwwwwwwwwwwwwwwww');
                            return true;
                          },
                          scrollOptions: ScrollOptions(
                            scrollController: _scrollController,
                            scrollToIndex: 60,
                          ),
                          header: Image.asset(
                            'images/logo.png',
                            height: 50,
                            width: 50,
                          )),
                      CoachModel(
                          initial: '60',
                          title: 'Indonesia',
                          maxWidth: 400,
                          subtitle: [
                            '1. Aceh',
                            '2. Jakarta',
                            '3. Bali',
                            '4. Papua',
                            'Banyak dah pokoknyaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa!',
                          ],
                          callBack: () async {
                            // scrollToIndex();
                            // await Future.delayed(Duration(seconds: 2));
                            print('objectwwwwwwwwwwwwwwww');
                            return true;
                          },
                          scrollOptions: ScrollOptions(
                              scrollController: _scrollController,
                              isLast: true),
                          header: Image.asset(
                            'images/logo.png',
                            height: 50,
                            width: 50,
                          )),
                      CoachModel(
                          initial: 'sa4',
                          title: 'Indonesia',
                          maxWidth: 400,
                          subtitle: [
                            '1. Aceh',
                            '2. Jakarta',
                            '3. Bali',
                            '4. Papua',
                            'Banyak dah pokoknyaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa!',
                          ],
                          header: Image.asset(
                            'images/logo.png',
                            height: 50,
                            width: 50,
                          )),
                      // CoachModel(
                      //     initial: '2',
                      //     title: 'Burung Bangau yang Angkuh',
                      //     maxWidth: 400,
                      //     alignment: Alignment.centerRight,
                      //     subtitle: [
                      //       'Seekor bangau berjalan dengan langkah yang anggun di sepanjang sebuah sungai kecil, matanya menatap air sungai yang jernih, leher dan paruhnya yang panjang siap untuk menangkap mangsa di air sebagai sarapan paginya. Saat itu, sungai dipenuhi dengan ikan-ikan yang berenang, tetapi sang Bangau merasa sedikit angkuh di pagi hari itu.',
                      //       'bagian 2'
                      //     ],
                      //     header: Image.asset(
                      //       'images/logo.png',
                      //       height: 50,
                      //       width: 50,
                      //     )),
                      // CoachModel(
                      //     initial: '3',
                      //     title: 'Burung perkutut, burung kuthilang',
                      //     maxWidth: 400,
                      //     alignment: Alignment.centerRight,
                      //     subtitle: [
                      //       'kamu kentut enggak bilang bilang ',
                      //     ],
                      //     header: Image.asset(
                      //       'images/logo.png',
                      //       height: 50,
                      //       width: 50,
                      //     )),
                      // CoachModel(
                      //     initial: '4',
                      //     title: 'Balonku ada lima',
                      //     maxWidth: 400,
                      //     alignment: Alignment.center,
                      //     subtitle: [
                      //       'Rupa-rupa warnanya\nHijau, kuning, kelabu\n\nMerah muda dan biru\nMeletus balon hijau DOR!',
                      //     ],
                      //     header: Image.asset(
                      //       'images/logo.png',
                      //       height: 50,
                      //       width: 50,
                      //     )),
                    ],
                    // skip: () {},
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
