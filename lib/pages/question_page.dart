import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/components/my_button.dart';
import 'package:trivia_app/components/question_tile.dart';
import 'package:trivia_app/models/quiz_questions.dart';
import 'package:trivia_app/pages/score_page.dart';

class QuestionPage extends StatefulWidget {
  QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final PageController _pageController = PageController(initialPage: 0);

  // to track which page you're on

  int _currentPage = 0;
  // ✅ Timer variables
  Timer? _timer;
  int _timeLeft = 30; // 30 seconds per question
  static const int _initialTime = 30;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  // ✅ Start countdown timer
  void _startTimer() {
    _timer?.cancel(); // Cancel existing timer
    setState(() {
      _timeLeft = _initialTime;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          // Time's up! Auto-advance
          _autoAdvance();
        }
      });
    });
  }

  // ✅ Auto-advance when timer runs out
  void _autoAdvance() {
    final quizProvider = context.read<QuizQuestions>();
    final currentQuiz = quizProvider.quizQuestions[_currentPage];

    // Mark as unanswered if no answer selected
    if (quizProvider.getAnswer(currentQuiz.id) == null) {
      quizProvider.saveAnswer(currentQuiz.id, ''); // Empty = unanswered
    }

    // Move to next or finish
    if (_currentPage < quizProvider.quizQuestions.length - 1) {
      nextPage();
    } else {
      _finishQuiz();
    }
  }

  void nextPage() {
    final quizProvider = context.read<QuizQuestions>();

    if (_currentPage < quizProvider.quizQuestions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      _startTimer(); // Reset timer for next question
    } else {
      _finishQuiz();
    }
  }

  void prevPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      _startTimer(); //  Reset timer when going back
    }
  }

  // Navigate to score page
  void _finishQuiz() {
    _timer?.cancel();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ScorePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = context.watch<QuizQuestions>().quizQuestions;

    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text('quiz'), backgroundColor: Colors.transparent),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ Timer Display
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: _timeLeft <= 10
                    ? Colors.red.withOpacity(0.2)
                    : Colors.deepPurple.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _timeLeft <= 10 ? Colors.red : Colors.deepPurple,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Time Left:',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    '$_timeLeft s',
                    style: TextStyle(
                      color: _timeLeft <= 10 ? Colors.red : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Container(
              // height: MediaQuery.of(context).size.height * 0.65,
              padding: EdgeInsets.all(20),
              height: 500,
              child: PageView.builder(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                itemCount: quizProvider.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final currentQuiz = quizProvider[index];
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
                  text: _currentPage == quizProvider.length - 1
                      ? 'Finish'
                      : 'Next',
                  style: TextStyle(
                    color: colorScheme.onSecondary,
                    fontSize: 16,
                  ),
                  onTap: _currentPage == quizProvider.length - 1
                      ? _finishQuiz
                      : nextPage,
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
