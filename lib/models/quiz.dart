class Quiz {
  final String question;
  List<String> options;
  final String correctAnswer;

  Quiz({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  List<Quiz> _quizQuestions = [
    Quiz(
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
      question: "Which language is primarily used for web development?",
      options: ["Python", "JavaScript", "C++", "Swift"],
      correctAnswer: "JavaScript",
    ),
    Quiz(
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
      question: "Which company developed the Android operating system?",
      options: ["Apple", "Microsoft", "Google", "Samsung"],
      correctAnswer: "Google",
    ),
    Quiz(
      question: "Which of the following is NOT an operating system?",
      options: ["Linux", "Windows", "Oracle", "macOS"],
      correctAnswer: "Oracle",
    ),
    Quiz(
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
      question: "Which of the following is a version control system?",
      options: ["Git", "Node.js", "React", "Docker"],
      correctAnswer: "Git",
    ),
    Quiz(
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
      question: "Which protocol is used to send emails?",
      options: ["HTTP", "SMTP", "FTP", "SNMP"],
      correctAnswer: "SMTP",
    ),
    Quiz(
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
