import 'package:flutter/material.dart';

// Widget for Result Page

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  // get method for showing score result
  String get resultPhrase {
    var resultText = 'You did it!';
    var scoreValue = resultScore.toString();
    if (resultScore <= 8) {
      resultText = 'You\'re Awesome and Innocent\n' + scoreValue;
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable\n' + scoreValue;
    } else if (resultScore <= 16) {
      resultText = 'You\'re kinda bad\n' + scoreValue;
    } else {
      resultText = 'You\'re bad\n' + scoreValue;
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restrart Quiz!'),
            onPressed: resetHandler,
            textColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
