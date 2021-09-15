import 'package:coachmaker/coachmaker.dart';
import 'package:flutter/material.dart';

class HorizontalExample extends StatefulWidget {
  HorizontalExample({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HorizontalExampleState createState() => _HorizontalExampleState();
}

class _HorizontalExampleState extends State<HorizontalExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: CoachPoint(
            initial: 'iconBtn1',
            child: IconButton(onPressed: () {}, icon: Icon(Icons.menu))),
        title: CoachPoint(
            initial: 'appBar',
            child: Text('Horizontal....................................')),
        actions: [
          CoachPoint(
              initial: 'iconBtn2',
              child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)))
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CoachPoint(
              initial: '1',
              child: Container(
                color: Colors.red,
                height: 200,
                width: 100,
                child: Center(
                  child: Text(
                    'Sorot aku kakak',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            CoachPoint(
              initial: '2',
              child: Container(
                color: Colors.red,
                height: 200,
                width: 100,
                child: Center(
                  child: Text(
                    'Sorot aku kakak',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            CoachPoint(
              initial: '3',
              child: Container(
                color: Colors.red,
                height: 200,
                width: 100,
                child: Center(
                  child: Text(
                    'Sorot aku kakak',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CoachPoint(
              initial: 'floatBtn1',
              child: FloatingActionButton(onPressed: () {})),
          CoachPoint(
              initial: 'floatBtn2',
              child: FloatingActionButton(onPressed: () {})),
          CoachPoint(
            initial: 'floatBtn3',
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
                          ),
                          CoachModel(
                            initial: '2',
                            title: 'Burung Bangau yang Angkuh',
                            maxWidth: 400,
                            subtitle: [
                              'Seekor bangau berjalan dengan langkah yang anggun di sepanjang sebuah sungai kecil, matanya menatap air sungai yang jernih, leher dan paruhnya yang panjang siap untuk menangkap mangsa di air sebagai sarapan paginya. Saat itu, sungai dipenuhi dengan ikan-ikan yang berenang, tetapi sang Bangau merasa sedikit angkuh di pagi hari itu.',
                              'bagian 2'
                            ],
                          ),
                          CoachModel(
                            initial: '3',
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
                          ),
                          CoachModel(
                            initial: 'appBar',
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
                          ),
                          CoachModel(
                            initial: 'iconBtn1',
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
                          ),
                          CoachModel(
                            initial: 'iconBtn2',
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
                          ),
                          CoachModel(
                              initial: 'floatBtn1',
                              title: 'Burung Bangau yang Angkuh',
                              maxWidth: 400,
                              subtitle: [
                                'Seekor bangau berjalan dengan langkah yang anggun di sepanjang sebuah sungai kecil, matanya menatap air sungai yang jernih, leher dan paruhnya yang panjang siap untuk menangkap mangsa di air sebagai sarapan paginya. Saat itu, sungai dipenuhi dengan ikan-ikan yang berenang, tetapi sang Bangau merasa sedikit angkuh di pagi hari itu.',
                                'bagian 2'
                              ],
                              header: Image.asset(
                                'images/logo.png',
                                height: 50,
                                width: 50,
                              )),
                          CoachModel(
                              initial: 'floatBtn2',
                              title: 'Burung Bangau yang Angkuh',
                              maxWidth: 400,
                              subtitle: [
                                'Seekor bangau berjalan dengan langkah yang anggun di sepanjang sebuah sungai kecil, matanya menatap air sungai yang jernih, leher dan paruhnya yang panjang siap untuk menangkap mangsa di air sebagai sarapan paginya. Saat itu, sungai dipenuhi dengan ikan-ikan yang berenang, tetapi sang Bangau merasa sedikit angkuh di pagi hari itu.',
                                'bagian 2'
                              ],
                              header: Image.asset(
                                'images/logo.png',
                                height: 50,
                                width: 50,
                              )),
                          CoachModel(
                              initial: 'floatBtn3',
                              title: 'Burung Bangau yang Angkuh',
                              maxWidth: 400,
                              subtitle: [
                                'Seekor bangau berjalan dengan langkah yang anggun di sepanjang sebuah sungai kecil, matanya menatap air sungai yang jernih, leher dan paruhnya yang panjang siap untuk menangkap mangsa di air sebagai sarapan paginya. Saat itu, sungai dipenuhi dengan ikan-ikan yang berenang, tetapi sang Bangau merasa sedikit angkuh di pagi hari itu.',
                                'bagian 2'
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
        ],
      ),
    );
  }
}
