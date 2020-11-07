import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// Tutorial from https://www.youtube.com/watch?v=x0uinJvhNxI&list=WL&index=22&t=14772s
// Shakir 193908

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 6},
        {'text': 'Tiger', 'score': 3},
        {'text': 'Lion', 'score': 6},
        {'text': 'Elephant', 'score': 1}
      ],
    },
    {
      'questionText': 'Who\'s your favourite instructor?',
      'answers': [
        {'text': 'Max', 'score': 5},
        {'text': 'Seiba', 'score': 7},
        {'text': 'Gawain', 'score': 8},
        {'text': 'Min', 'score': 1}
      ],
    },
  ]; // Question and Answer Map List Variable

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // Add counter to the next question
  void _answerQuestion(int score) {
    _totalScore += score;

    //Change the value of question index during build refresh
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } //Check if theres more question
    else {
      print('No more questions!');
    }
  } //end of answerQuestion func

  // Build method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
} // end of MyApp
