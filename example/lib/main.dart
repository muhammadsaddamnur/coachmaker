import 'package:coachmaker/coachmaker.dart';
import 'package:coachmaker/src/models/coach_model.dart';
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
                  'You have pushed the button this many times:',
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.yellow,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'w',
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
                      'You have pushed the button this many times:',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 400,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CoachPoint(
                  initial: '4',
                  child: Container(
                    color: Colors.red,
                    height: 50,
                    width: 100,
                    child: Text(
                      'You have pushed the button this many times:',
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
        initial: '3',
        child: FloatingActionButton(
          onPressed: () {
            CoachMaker(context,
                    initialList: [
                      CoachModel(
                          initial: '1',
                          title: 'Ini Dia Nih',
                          subtitle: [
                            'Ini contoh aja',
                            'banyak banget nih ya wkwkwkwkwkwwkwkwkwkwkwkwkwkwkwkwwkwkwkwkwkwkwkwwkwkwkwkw wkwkwkwkwkwwkwkwkwkwkwkwkwkwkwkwwkwkwkwkwkwkwkwwkwkwkwkw wkwkwkwkwkwwkwkwkwkwkwkwkwkwkwkwwkwkwkwkwkwkwkwwkwkwkwkw'
                          ],
                          header: Image.network(
                            'https://miro.medium.com/max/700/1*EmDB27i0r74-ynuin1GcWA.png',
                            height: 50,
                            width: 50,
                          )),
                      CoachModel(
                          initial: '2',
                          title: 'Ini Dia ',
                          subtitle: [
                            'Nihasdfuafouaifuiaugdaiggiigispogipogipodfihpgfihigfhigfhjigfhjigfihjgfjiopgfijfiojighfjifgjigfipo'
                          ],
                          header: Image.network(
                            'https://miro.medium.com/max/700/1*EmDB27i0r74-ynuin1GcWA.png',
                            height: 50,
                            width: 50,
                          )),
                      CoachModel(
                          initial: '3',
                          title: 'Ini Dia Nih',
                          subtitle: [
                            'Ini contoh aja',
                          ],
                          header: Image.network(
                            'https://miro.medium.com/max/700/1*EmDB27i0r74-ynuin1GcWA.png',
                            height: 50,
                            width: 50,
                          )),
                      CoachModel(
                          initial: '4',
                          title: 'Ini Dia Nih',
                          subtitle: [
                            'Ini contoh aja',
                          ],
                          header: Image.network(
                            'https://miro.medium.com/max/700/1*EmDB27i0r74-ynuin1GcWA.png',
                            height: 50,
                            width: 50,
                          ))
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
