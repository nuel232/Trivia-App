import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/models/quiz.dart';
import 'package:trivia_app/models/quiz_questions.dart';

class QuestionTile extends StatelessWidget {
  final Quiz quiz;

  const QuestionTile({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final quizProvider = context.watch<QuizQuestions>();
    final selectedAnswer = quizProvider.getAnswer(
      quiz.id,
    ); // Get current answer

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

            //check if selected
            bool isSelected = selectedAnswer == option;

            return GestureDetector(
              onTap: () {
                quizProvider.saveAnswer(quiz.id, option);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.deepPurple.withOpacity(0.3)
                      : Color.fromARGB(255, 44, 60, 81),
                  border: Border.all(
                    color: isSelected
                        ? Colors.deepPurple
                        : Color.fromARGB(225, 49, 65, 88),
                    width: isSelected ? 2 : 1,
                  ),

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
