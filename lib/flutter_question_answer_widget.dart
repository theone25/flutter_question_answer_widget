library flutter_question_answer_widget;

import 'package:flutter/material.dart';
import 'package:flutter_question_answer_widget/multi_selection_widget.dart';
import 'package:flutter_question_answer_widget/single_check_selection_widget.dart';
import 'package:flutter_question_answer_widget/single_selection_widget.dart';

import 'multi_check_selection_widget.dart';

class FlutterQuestionAnswerWidget {
  /// single answer selection
  ///
  /// it's button type view
  /// it'll return only single value based on [answerList] selection.
  static Widget singleSelection(
      {@required String question,
      @required List answerList,
      @required String answered,
      @required ValueChanged<String> onChanged,
      EdgeInsets answerMargin,
      double answerWidth,
      double answerHeight,
      Color selectedAnswerBackGroundColor,
      Color unSelectedAnswerBackGroundColor,
      Color selectedAnswerTextColor,
      Color unSelectedAnswerTextColor,
      double answersFontSize,
      String answersFontFamily,
      TextStyle questionTextStyle,
      TextOverflow questionOverFlow,
      int questionMaxLine}) {
    return SingleSelectionWidget(
      question: question,
      answerList: answerList,
      answered: answered,
      onChanged: onChanged,
      answerMargin: answerMargin,
      questionOverFlow: questionOverFlow,
      answersFontFamily: answersFontFamily,
      answersFontSize: answersFontSize,
      questionMaxLine: questionMaxLine,
      questionTextStyle: questionTextStyle,
      answerHeight: answerHeight,
      answerWidth: answerWidth,
      selectedAnswerBackGroundColor: selectedAnswerBackGroundColor,
      unSelectedAnswerBackGroundColor: unSelectedAnswerBackGroundColor,
      selectedAnswerTextColor: selectedAnswerTextColor,
      unSelectedAnswerTextColor: unSelectedAnswerTextColor,
    );
  }

  /// multi answer selection
  ///
  /// it's button type view
  /// it'll return multiple value based on [answerList] selection.
  static Widget multiSelectionView(
      {@required String question,
      @required List answerList,
      @required List answeredList,
      @required ValueChanged<String> onChanged,
      EdgeInsets answerMargin,
      double answerWidth,
      double answerHeight,
      Color selectedAnswerBackGroundColor,
      Color unSelectedAnswerBackGroundColor,
      Color selectedAnswerTextColor,
      Color unSelectedAnswerTextColor,
      double answersFontSize,
      String answersFontFamily,
      TextStyle questionTextStyle,
      TextOverflow questionOverFlow,
      int questionMaxLine}) {
    return MultiSelectionWidget(
      question: question,
      answerList: answerList,
      answeredList: answeredList,
      onChanged: onChanged,
      answerMargin: answerMargin,
      questionOverFlow: questionOverFlow,
      answersFontFamily: answersFontFamily,
      answersFontSize: answersFontSize,
      questionMaxLine: questionMaxLine,
      questionTextStyle: questionTextStyle,
      answerHeight: answerHeight,
      answerWidth: answerWidth,
      selectedAnswerBackGroundColor: selectedAnswerBackGroundColor,
      unSelectedAnswerBackGroundColor: unSelectedAnswerBackGroundColor,
      selectedAnswerTextColor: selectedAnswerTextColor,
      unSelectedAnswerTextColor: unSelectedAnswerTextColor,
    );
  }

  /// single answer selection
  ///
  /// it's check box type
  /// it'll return only single value based on [answerList] selection.
  static Widget singleCheckSelection(
      {@required String question,
      @required List answerList,
      @required String answered,
      @required ValueChanged<String> onChanged,
      EdgeInsets answerMargin,
      Color activeColor,
      Color answerTextColor,
      double answersFontSize,
      String answersFontFamily,
      TextStyle questionTextStyle,
      TextOverflow questionOverFlow,
      int questionMaxLine}) {
    return SingleCheckSelectionWidget(
      question: question,
      answerList: answerList,
      answered: answered,
      onChanged: onChanged,
      answerMargin: answerMargin,
      questionOverFlow: questionOverFlow,
      answersFontFamily: answersFontFamily,
      answersFontSize: answersFontSize,
      questionMaxLine: questionMaxLine,
      questionTextStyle: questionTextStyle,
      activeColor: activeColor,
      answerTextColor: answerTextColor,
    );
  }

  /// single answer selection
  ///
  /// it's check box type
  /// it'll return multiple value based on [answerList] selection.
  static Widget multiCheckSelection(
      {@required String question,
      @required List answerList,
      @required List answered,
      @required ValueChanged<String> onChanged,
      EdgeInsets answerMargin,
      Color activeColor,
      Color answerTextColor,
      double answersFontSize,
      String answersFontFamily,
      TextStyle questionTextStyle,
      TextOverflow questionOverFlow,
      int questionMaxLine}) {
    return MultiCheckSelectionWidget(
      question: question,
      answerList: answerList,
      answered: answered,
      onChanged: onChanged,
      answerMargin: answerMargin,
      questionOverFlow: questionOverFlow,
      answersFontFamily: answersFontFamily,
      answersFontSize: answersFontSize,
      questionMaxLine: questionMaxLine,
      questionTextStyle: questionTextStyle,
      activeColor: activeColor,
      answerTextColor: answerTextColor,
    );
  }
}

enum QuestionAnsType {
  SingleSelection,
  MultiSelection,
  SingleCheck,
  MultiCheck,
  Radio,
}
