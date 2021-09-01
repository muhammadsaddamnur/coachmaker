import 'package:coachmaker/coachmaker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // showPerformanceOverlay: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            CoachPoint(
              initial: '1',
              child: Container(
                color: Colors.red,
                height: 50,
                width: 100,
                child: Text(
                  'Sorot aku kakak',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CoachPoint(
                  initial: '2',
                  child: Container(
                    color: Colors.red,
                    height: 50,
                    width: 100,
                    child: Text(
                      'Sorot aku kakak',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 450,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CoachPoint(
                  initial: '3',
                  child: Container(
                    color: Colors.red,
                    height: 50,
                    width: 100,
                    child: Text(
                      'Sorot aku kakak',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CoachPoint(
        initial: '4',
        child: FloatingActionButton(
          onPressed: () {
            CoachMaker(context,
                    initialList: [
                      CoachModel(
                          initial: '1',
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
                      CoachModel(
                          initial: '2',
                          title: 'Burung Bangau yang Angkuh',
                          maxWidth: 400,
                          alignment: Alignment.centerRight,
                          subtitle: [
                            'Seekor bangau berjalan dengan langkah yang anggun di sepanjang sebuah sungai kecil, matanya menatap air sungai yang jernih, leher dan paruhnya yang panjang siap untuk menangkap mangsa di air sebagai sarapan paginya. Saat itu, sungai dipenuhi dengan ikan-ikan yang berenang, tetapi sang Bangau merasa sedikit angkuh di pagi hari itu.'
                          ],
                          header: Image.asset(
                            'images/logo.png',
                            height: 50,
                            width: 50,
                          )),
                      CoachModel(
                          initial: '3',
                          title: 'Burung perkutut, burung kuthilang',
                          maxWidth: 400,
                          alignment: Alignment.centerRight,
                          subtitle: [
                            'kamu kentut enggak bilang bilang ',
                          ],
                          header: Image.asset(
                            'images/logo.png',
                            height: 50,
                            width: 50,
                          )),
                      CoachModel(
                          initial: '4',
                          title: 'Balonku ada lima',
                          maxWidth: 400,
                          alignment: Alignment.center,
                          subtitle: [
                            'Rupa-rupa warnanya\nHijau, kuning, kelabu\n\nMerah muda dan biru\nMeletus balon hijau DOR!',
                          ],
                          header: Image.asset(
                            'images/logo.png',
                            height: 50,
                            width: 50,
                          )),
                    ],
                    nextStep: CoachMakerControl.next,
                    buttonOptions: CoachButtonOptions(
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
