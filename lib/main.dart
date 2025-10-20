import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/models/quiz_questions.dart';
import 'package:trivia_app/pages/home_page.dart';
import 'package:trivia_app/theme/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => QuizQuestions()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
