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
            CoachPoint(
              initial: '2',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.red,
                  height: 50,
                  width: 100,
                  child: Text(
                    'You have pushed the button this many times:',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CoachPoint(
        initial: '3',
        child: FloatingActionButton(
          onPressed: () {
            CoachMaker(
              context,
              initialList: ['1', '2', '3'],
              pointOnTap: CoachMakerControl.next,
            ).show();
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
