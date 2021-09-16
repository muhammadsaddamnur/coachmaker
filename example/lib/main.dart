import 'package:coachmaker/coachmaker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Simple(
        title: '',
      ),
    );
  }
}

class Simple extends StatefulWidget {
  Simple({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SimpleState createState() => _SimpleState();
}

class _SimpleState extends State<Simple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: CoachPoint(
                initial: '1',
                child: Container(
                  color: Colors.red,
                  height: 100,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CoachPoint(
                    initial: '3',
                    child: Container(
                      color: Colors.red,
                      height: 50,
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
                    // firstDelay: Duration(seconds: 10),
                    // duration: Duration(milliseconds: 600),
                    initialList: [
                      CoachModel(
                        initial: '1',
                        title: 'Keong Racun',
                        maxWidth: 400,
                        subtitle: [
                          'Dasar kau keong racun\nBaru kenal eh ngajak tidur\nNgomong nggak sopan santun\nKau anggap aku ayam kampung',
                        ],
                        header: Image.network(
                          'https://facebookbrand.com/wp-content/uploads/2019/04/f_logo_RGB-Hex-Blue_512.png?w=512&h=512',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      CoachModel(
                          initial: '2',
                          title: 'Burung Bangau yang Angkuh',
                          maxWidth: 400,
                          alignment: Alignment.centerRight,
                          subtitle: [
                            'Seekor bangau berjalan dengan langkah yang anggun di sepanjang sebuah sungai kecil, matanya menatap air sungai yang jernih, leher dan paruhnya yang panjang siap untuk menangkap mangsa di air sebagai sarapan paginya. Saat itu, sungai dipenuhi dengan ikan-ikan yang berenang, tetapi sang Bangau merasa sedikit angkuh di pagi hari itu.',
                            'bagian 2'
                          ],
                          header: Image.network(
                            'https://lh3.googleusercontent.com/3_OFn2skqHXk-UQ-9RUdNrDl_HQJrMCxks5teQcUrF_bOSeDG1hD8j83FeD31W8hASZCvubzsGfumuJq8kvvSAq03wY87RZ7Otx_DF4',
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
                          header: Image.network(
                            'https://lh3.googleusercontent.com/COxitqgJr1sJnIDe8-jiKhxDx1FrYbtRHKJ9z_hELisAlapwE9LUPh6fcXIfb5vwpbMl4xl9H9TRFPc5NOO8Sb3VSgIBrfRYvW6cUA',
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
                    skip: () {},
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
