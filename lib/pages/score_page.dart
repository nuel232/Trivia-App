import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/components/my_button.dart';
import 'package:trivia_app/models/quiz_questions.dart';
import 'package:trivia_app/pages/home_page.dart';
import 'package:trivia_app/pages/review.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final quizProvider = context.read<QuizQuestions>();
    final score = quizProvider.calculateScore();
    final total = quizProvider.quizQuestions.length;
    final percentage = (score / total * 100).toInt();
    final colorScheme = Theme.of(context).colorScheme;

    // Determine message based on score
    String message;
    IconData icon;
    Color iconColor;

    if (percentage >= 80) {
      message = 'Excellent! 🎉';
      icon = Icons.emoji_events;
      iconColor = Colors.amber;
    } else if (percentage >= 60) {
      message = 'Good Job! 👍';
      icon = Icons.thumb_up;
      iconColor = Colors.blue;
    } else if (percentage >= 40) {
      message = 'Not Bad! 💪';
      icon = Icons.trending_up;
      iconColor = Colors.orange;
    } else {
      message = 'Keep Practicing! 📚';
      icon = Icons.school;
      iconColor = Colors.red;
    }

    return Scaffold(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Trophy/Icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 106, 93, 255),
                      Colors.deepPurple,
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 60, color: iconColor),
              ),

              SizedBox(height: 30),

              // Message
              Text(
                message,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 20),

              // Score Container
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Color.fromARGB(225, 28, 40, 61),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color.fromARGB(225, 49, 65, 88)),
                ),
                child: Column(
                  children: [
                    Text(
                      'Your Score',
                      style: TextStyle(fontSize: 20, color: Colors.white70),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '$score / $total',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '$percentage%',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Review Button
              MyButton(
                text: 'Review Answers',
                icon: Icons.list_alt,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 106, 93, 255),
                    Colors.deepPurple,
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Review()),
                  );
                },
              ),

              SizedBox(height: 15),

              // Home Button
              MyButton(
                text: 'Back to Home',
                icon: Icons.home,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.grey.shade700, Colors.grey.shade900],
                ),
                onTap: () {
                  quizProvider.resetQuiz(); // Clear answers
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
