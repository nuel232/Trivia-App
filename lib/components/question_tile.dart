import 'package:flutter/material.dart';
import 'package:trivia_app/models/quiz.dart';

class QuestionTile extends StatelessWidget {
  final Quiz quiz;

  const QuestionTile({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        border: Border.all(color: Colors.blue),

        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Question ${quiz.id} of 10',
            textAlign: TextAlign.start,
            style: TextStyle(color: colorScheme.onSecondary, fontSize: 18),
          ),

          Text(quiz.question),

          SizedBox(height: 20),

          ...quiz.options.asMap().entries.map((entry) {
            int index = entry.key;
            String option = entry.value;

            return GestureDetector(
              onTap: () {
                // Handle answer selection
                print('Selected: $option');
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text('${String.fromCharCode(65 + index)}. '), // A, B, C, D
                    Text(option),
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
