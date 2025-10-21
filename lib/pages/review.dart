import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/models/quiz_questions.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    // In your score/results page
    final quizProvider = context.read<QuizQuestions>();
    int score = quizProvider.calculateScore();
    int totalQuestions = quizProvider.quizQuestions.length;
    return Scaffold(
      appBar: AppBar(title: Text('Review')),
      body: Column(),
    );
  }
}
