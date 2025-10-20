import 'package:flutter/material.dart';
import 'package:trivia_app/models/quiz.dart';

class QuestionTile extends StatelessWidget {
  final Quiz quiz;

  const QuestionTile({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        border: Border.all(color: Colors.blue),

        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(children: [Text('Question ${quiz.id}')]),
    );
  }
}
