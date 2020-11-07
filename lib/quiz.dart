import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

// Class for Question and Answer widget Container

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

// Constructor
  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questions[questionIndex]
              ['questionText'], // Get question from question class
        ),
        ...(questions[questionIndex]['answers'] as List<
                Map<String,
                    Object>>) // Interate answer choice based on answer map
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
