import 'package:flutter/material.dart';
import 'package:trivia_app/models/quiz.dart';

class QuizQuestions extends ChangeNotifier {
  final List<Quiz> _quizQuestions = [
    Quiz(
      id: '1',
      question: "What does CPU stand for?",
      options: [
        "Central Process Unit",
        "Central Processing Unit",
        "Computer Personal Unit",
        "Central Power Unit",
      ],
      correctAnswer: "Central Processing Unit",
    ),
    Quiz(
      id: '2',
      question: "Which language is primarily used for web development?",
      options: ["Python", "JavaScript", "C++", "Swift"],
      correctAnswer: "JavaScript",
    ),
    Quiz(
      id: "3",
      question: "What does 'HTTP' stand for?",
      options: [
        "HyperText Transfer Protocol",
        "HighText Transfer Process",
        "HyperText Transfer Program",
        "Home Tool Transfer Protocol",
      ],
      correctAnswer: "HyperText Transfer Protocol",
    ),
    Quiz(
      id: "4",
      question: "Which company developed the Android operating system?",
      options: ["Apple", "Microsoft", "Google", "Samsung"],
      correctAnswer: "Google",
    ),
    Quiz(
      id: '5',
      question: "Which of the following is NOT an operating system?",
      options: ["Linux", "Windows", "Oracle", "macOS"],
      correctAnswer: "Oracle",
    ),
    Quiz(
      id: '6',
      question: "What does 'GPU' stand for?",
      options: [
        "Graphics Processing Unit",
        "General Processing Unit",
        "Graphical Power Utility",
        "Graphics Power Unit",
      ],
      correctAnswer: "Graphics Processing Unit",
    ),
    Quiz(
      id: "7",
      question: "Which of the following is a version control system?",
      options: ["Git", "Node.js", "React", "Docker"],
      correctAnswer: "Git",
    ),
    Quiz(
      id: "8",
      question: "What is the main function of an operating system?",
      options: [
        "To compile code",
        "To manage hardware and software resources",
        "To run databases",
        "To display web pages",
      ],
      correctAnswer: "To manage hardware and software resources",
    ),
    Quiz(
      id: "9",
      question: "Which protocol is used to send emails?",
      options: ["HTTP", "SMTP", "FTP", "SNMP"],
      correctAnswer: "SMTP",
    ),
    Quiz(
      id: "10",
      question: "In networking, what does 'IP' stand for?",
      options: [
        "Internet Process",
        "Internet Protocol",
        "Internal Program",
        "Interface Path",
      ],
      correctAnswer: "Internet Protocol",
    ),
  ];

  //get the the products and the cart
  List<Quiz> get quizQuestions => _quizQuestions;
}
