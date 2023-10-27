import 'package:flutter/material.dart';
import 'package:quize_app/screens/quize_screen.dart';
import '../constants/constants.dart';
import '../data/Questions.dart';

class ResultScreen extends StatelessWidget {
  final int correctAnswersCount;
  final String resultText;

  ResultScreen({
    required this.correctAnswersCount,
    required this.resultText
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF040612),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
            ),
            Text(
              '$correctAnswersCount', 
              style: TextStyle(
                fontFamily: 'danablack',
                color: Colors.white,
                fontSize: 120
              ),
            ),
            Text(
              resultText, 
              style: TextStyle(
                fontFamily: 'dana',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 30
              ),
            ),
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => QuizeScreen())
                );
              },
              child: Ink(
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        Color(0xFF0358AE),
                        Color(0xFF2687BC),
                      ]
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'آزمون مجدد',
                        style: TextStyle(
                          fontFamily: 'dana',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 23
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Ink(
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        Color(0xFFC4114A),
                        Color(0xFFFD5C8F),
                      ]
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'بازگشت به خانه',
                        style: TextStyle(
                          fontFamily: 'dana',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 23
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
