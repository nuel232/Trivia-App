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
        color: Color.fromARGB(225, 28, 40, 61),
        border: Border.all(color: Color.fromARGB(225, 49, 65, 88)),

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

          SizedBox(height: 10),

          Text(
            quiz.question,
            style: TextStyle(color: colorScheme.onSecondary, fontSize: 16),
          ),

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
                  color: Color.fromARGB(255, 44, 60, 81),
                  border: Border.all(color: Color.fromARGB(225, 49, 65, 88)),

                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text(
                      '${String.fromCharCode(65 + index)}. ',
                      style: TextStyle(
                        color: colorScheme.onSecondary,
                        fontSize: 16,
                      ),
                    ), // A, B, C, D
                    Expanded(
                      child: Text(
                        option,
                        style: TextStyle(
                          color: colorScheme.onSecondary,
                          fontSize: 16,
                        ),
                        softWrap: true,
                      ),
                    ),
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
