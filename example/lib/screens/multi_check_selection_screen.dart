import 'package:flutter/material.dart';
import 'package:flutter_question_answer_widget/flutter_question_answer_widget.dart';

class MultiCheckSelectionScreen extends StatefulWidget {
  @override
  _MultiCheckSelectionScreenState createState() =>
      _MultiCheckSelectionScreenState();
}

class _MultiCheckSelectionScreenState extends State<MultiCheckSelectionScreen> {
  List movieList = [
    "Man of steel",
    "Batman vs Superman",
    "Suicide Squad",
    "Justice League",
    "Wonder Woman"
  ];
  List selectedMovieList = [];

  List heroList = ["Batman", "Superman", "Wonder Women"];
  List selectedHeroList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi Check Selection"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            FlutterQuestionAnswerWidget.multiCheckSelection(
                answered: selectedMovieList,
                question: "1. Do you like music?",
                answerList: movieList,
                onChanged: (String value) {
                  if (selectedMovieList.contains(value)) {
                    setState(() {
                      selectedMovieList.remove(value);
                    });
                  } else {
                    setState(() {
                      selectedMovieList.add(value);
                    });
                  }
                },
                activeColor: Colors.red),
            FlutterQuestionAnswerWidget.multiCheckSelection(
              answered: selectedHeroList,
              question: "2. Did you ever went to New York?",
              answerList: heroList,
              onChanged: (String value) {
                if (selectedHeroList.contains(value)) {
                  setState(() {
                    selectedHeroList.remove(value);
                  });
                } else {
                  setState(() {
                    selectedHeroList.add(value);
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
