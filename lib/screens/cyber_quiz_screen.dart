import 'package:flutter/material.dart';

class CyberQuizScreen extends StatefulWidget {
  @override
  _CyberQuizScreenState createState() => _CyberQuizScreenState();
}

class _CyberQuizScreenState extends State<CyberQuizScreen> {
  List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the strongest type of password?',
      'options': ['123456', 'Your birthday', 'Random characters', 'Your pet’s name'],
      'answer': 'Random characters',
    },
    {
      'question': 'What is phishing?',
      'options': ['A cyber attack', 'Fishing in the sea', 'A mobile app', 'A gaming technique'],
      'answer': 'A cyber attack',
    },
    {
      'question': 'Which is safe?',
      'options': ['Public Wi-Fi without VPN', 'HTTPS websites', 'Sharing passwords', 'Unknown apps'],
      'answer': 'HTTPS websites',
    },
    {
      'question': 'What is Two-Factor Authentication?',
      'options': [
        'Using two phones',
        'An extra layer of security',
        'Changing password daily',
        'Sharing OTP with friends'
      ],
      'answer': 'An extra layer of security',
    },
  ];

  int currentQuestionIndex = 0;
  int score = 0;
  bool showResult = false;

  void checkAnswer(String selectedOption) {
    if (selectedOption == questions[currentQuestionIndex]['answer']) {
      score++;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correct Answer! 🎯')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Wrong Answer! ❌')),
      );
    }

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
        } else {
          showResult = true;
        }
      });
    });
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cyber Quiz'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: showResult
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quiz Completed!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            Text(
              'Your Score: $score / ${questions.length}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: resetQuiz,
              icon: Icon(Icons.refresh),
              label: Text('Retry Quiz'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1} of ${questions.length}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 20),
            Text(
              questions[currentQuestionIndex]['question'],
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 30),
            ...questions[currentQuestionIndex]['options'].map<Widget>((option) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 15),
                child: ElevatedButton(
                  onPressed: () => checkAnswer(option),
                  child: Text(option, style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white,
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
