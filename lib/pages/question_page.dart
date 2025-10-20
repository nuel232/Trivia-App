import 'package:flutter/material.dart';
import 'package:trivia_app/models/quiz.dart';

class QuestionPage extends StatelessWidget {
  List<Quiz> quizQuestions;

  QuestionPage({super.key, required this.quizQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Question ')),
      body: PageView.builder(
        itemCount: quizQuestions.length,
        itemBuilder: (context, index) {
          return Container(child: Text('hey'));
        },
      ),
    );
  }
}
