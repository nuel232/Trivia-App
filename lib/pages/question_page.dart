import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/components/my_button.dart';
import 'package:trivia_app/components/question_tile.dart';
import 'package:trivia_app/models/quiz_questions.dart';

class QuestionPage extends StatefulWidget {
  QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentPage = 0;
  // to track which page you're on
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (_currentPage < 10) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void prevPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizQuestions>().quizQuestions;

    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text('quiz')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colorScheme.surface, colorScheme.primary],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              height: 400,
              child: PageView.builder(
                controller: _pageController,
                itemCount: quiz.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final currentQuiz = quiz[index];
                  return QuestionTile(quiz: currentQuiz);
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                  icon: Icons.arrow_back,

                  text: 'Previous',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 16,
                  ),
                  onTap: () => prevPage(),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 106, 93, 255),
                      Colors.deepPurple,
                    ],
                  ),
                ),
                MyButton(
                  text: 'Next',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 16,
                  ),
                  onTap: () => nextPage(),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 106, 93, 255),
                      Colors.deepPurple,
                    ],
                  ),
                  icon2: Icons.arrow_forward,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
