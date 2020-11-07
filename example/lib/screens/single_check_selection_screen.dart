import 'package:flutter/material.dart';
import 'package:flutter_question_answer_widget/flutter_question_answer_widget.dart';

class SingleCheckSelectionScreen extends StatefulWidget {
  @override
  _SingleCheckSelectionScreenState createState() =>
      _SingleCheckSelectionScreenState();
}

class _SingleCheckSelectionScreenState
    extends State<SingleCheckSelectionScreen> {
  String _value1;
  String _value2;
  String _value3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Single Check Selection"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            FlutterQuestionAnswerWidget.singleCheckSelection(
                answered: _value1,
                question: "1. Do you like music?",
                answerList: ["Yes", "No"],
                onChanged: (String value) {
                  setState(() {
                    _value1 = value;
                  });
                },
                activeColor: Colors.red),
            FlutterQuestionAnswerWidget.singleCheckSelection(
              answered: _value2,
              question: "2. Did you ever went to New York?",
              answerList: ["Yes", "No"],
              onChanged: (String value) {
                setState(() {
                  _value2 = value;
                });
              },
            ),
            FlutterQuestionAnswerWidget.singleCheckSelection(
              answered: _value3,
              question: "3. Did you have any plan?",
              answerList: ["Yes", "Maybe", "No"],
              onChanged: (String value) {
                setState(() {
                  _value3 = value;
                });
              },
              activeColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
