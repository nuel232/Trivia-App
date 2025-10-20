import 'package:flutter/material.dart';
import 'package:trivia_app/models/quiz.dart';

class QuestionPage extends StatelessWidget {
  final Quiz quiz;

  const QuestionPage({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('quiz')));
  }
}
