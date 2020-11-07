# flutter_question_answer_widget

It's a simple and beautiful Question and Answer package for both android & ios.

## Screenshots 

![example](https://github.com/vignesh7501/flutter_question_answer_widget/blob/main/screenShots/img.jpg?raw=true)

## Usage

[Example](https://github.com/vignesh7501/flutter_question_answer_widget/blob/main/example/lib/main.dart)

To use this package :

* add the dependency to your [pubspec.yaml](https://github.com/vignesh7501/flutter_question_answer_widget/blob/main/example/pubspec.yaml) file.

```yaml
  dependencies:
    flutter:
      sdk: flutter
    flutter_question_answer_widget: latest version
```

### Types
* Single selection
* Multi selection
* Single check selection
* Multi check selection

### How to use

1. Single selection widget

```dart
FlutterQuestionAnswerWidget.singleSelection(
              answered: _value1,
              question: "1. Do you like music?",
              answerList: ["Yes", "No"],
              onChanged: (String value) {
                setState(() {
                  _value1 = value;
                });
              },
            )
```

2. Multi selection widget

```dart
FlutterQuestionAnswerWidget.multiSelectionView(
              answeredList: selectedMovieList,
              question: "1. What is the last movie you watched?",
              answerList: movieList,
              answerWidth: 200,
              selectedAnswerBackGroundColor: Colors.green,
              unSelectedAnswerBackGroundColor: Colors.grey.shade200,
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
            )
```

3. Single check selection

```dart
FlutterQuestionAnswerWidget.singleCheckSelection(
                answered: _value1,
                question: "1. Do you like music?",
                answerList: ["Yes", "No"],
                onChanged: (String value) {
                  setState(() {
                    _value1 = value;
                  });
                },
                activeColor: Colors.red)
```

4. Multi check selection

```dart
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
                activeColor: Colors.red)
```

# License

Copyright 2020 Vignesh Prakash

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
   
## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
