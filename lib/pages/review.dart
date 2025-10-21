import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/components/my_button.dart';
import 'package:trivia_app/models/quiz_questions.dart';
import 'package:trivia_app/pages/home_page.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    final quizProvider = context.read<QuizQuestions>();
    final questions = quizProvider.quizQuestions;
    final userAnswers = quizProvider.userAnswers;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Review Answers'),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 18, 27, 47),
              Color.fromARGB(255, 41, 45, 107),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  final userAnswer = userAnswers[question.id] ?? '';
                  final isCorrect = userAnswer == question.correctAnswer;
                  final isUnanswered = userAnswer.isEmpty;

                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(225, 28, 40, 61),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isUnanswered
                            ? Colors.orange
                            : isCorrect
                            ? Colors.green
                            : Colors.red,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Question header with result icon
                        Row(
                          children: [
                            Icon(
                              isUnanswered
                                  ? Icons.help_outline
                                  : isCorrect
                                  ? Icons.check_circle
                                  : Icons.cancel,
                              color: isUnanswered
                                  ? Colors.orange
                                  : isCorrect
                                  ? Colors.green
                                  : Colors.red,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Question ${question.id}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 15),

                        // Question text
                        Text(
                          question.question,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),

                        SizedBox(height: 15),

                        // User's answer
                        if (!isUnanswered)
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isCorrect
                                  ? Colors.green.withOpacity(0.2)
                                  : Colors.red.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Your Answer: ',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    userAnswer,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        if (isUnanswered)
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Not Answered',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                        // Correct answer (if wrong or unanswered)
                        if (!isCorrect)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Correct Answer: ',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        question.correctAnswer,
                                        style: TextStyle(
                                          color: Colors.greenAccent,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Back to Home button
            Padding(
              padding: EdgeInsets.all(20),
              child: MyButton(
                text: 'Back to Home',
                icon: Icons.home,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 106, 93, 255),
                    Colors.deepPurple,
                  ],
                ),
                onTap: () {
                  quizProvider.resetQuiz();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
