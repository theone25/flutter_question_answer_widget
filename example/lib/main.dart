import 'package:example/screens/multi_check_selection_screen.dart';
import 'package:example/screens/multi_selection_screen.dart';
import 'package:example/screens/single_check_selection_screen.dart';
import 'package:example/screens/single_selection_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => SingleSelectionScreen()));
              },
              child: Text("Single Selection"),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => MultiSelectionScreen()));
              },
              child: Text("Multi Selection"),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => SingleCheckSelectionScreen()));
              },
              child: Text("Single Check Selection"),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => MultiCheckSelectionScreen()));
              },
              child: Text("Multi Check Selection"),
            ),
          ],
        ),
      ),
    );
  }
}
