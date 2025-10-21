import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/components/my_button.dart';
import 'package:trivia_app/models/quiz.dart';
import 'package:trivia_app/pages/question_page.dart';
import 'package:trivia_app/theme/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text('Tech Trivia'),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Icon(
                themeProvider.isLightMode
                    ? Icons.wb_sunny_rounded
                    : Icons.nights_stay_rounded,
                size: 20,
                color: colorScheme.onSecondary,
              ),
              Switch(
                value: !themeProvider.isLightMode,
                onChanged: (value) => themeProvider.toggleTheme(),
                activeColor: colorScheme.tertiary,
              ),
            ],
          ),
        ],
      ),
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
              // padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colorScheme.onSurface),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10,
                    ),
                    child: Text(
                      'Challenge your mind with fast-paced tech quizzes. Learn, play, and have fun!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 106, 93, 255),
                          Colors.deepPurple,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'P',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onPrimary,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    'welcome, player',
                    style: TextStyle(
                      color: colorScheme.onPrimary,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'keep growing your knowledge!',
                    style: TextStyle(color: colorScheme.onSurface),
                  ),

                  SizedBox(height: 10),

                  MyButton(
                    text: 'start quiz',
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
                        MaterialPageRoute(builder: (context) => QuestionPage()),
                      );
                    },
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
