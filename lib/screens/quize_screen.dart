import 'package:flutter/material.dart';
import 'result_screen.dart';
import '../constants/constants.dart';


class QuizeScreen extends StatefulWidget {
  const QuizeScreen({super.key ,});
  static int showQuestionIndex = 0;
  static int choosedAnswer = 3; //corect answer of q1
  static String resultText = '';
  
  @override
  State<QuizeScreen> createState() => _QuizeScreenState();
}

class _QuizeScreenState extends State<QuizeScreen> {
  String resultText = '';
  int correctAnswersCount = 0;
  int questionsNumber = 1;
  bool isBeforeButtonVisible = false;
  bool isNextButtonVisible = true;
  bool isFinishButtonVisible = false;
  bool showQuestionsNumber = true;

  void ButtonVisibleView() {
    setState(() {
      if(questionsNumber == 20) {
        isNextButtonVisible = false;
        isBeforeButtonVisible = false;
      }
      if(questionsNumber < 20) {
        isNextButtonVisible = true;
      }
      if(questionsNumber > 1) {
        isBeforeButtonVisible = true;
      } else {
        isBeforeButtonVisible = false;
      }
    });
  }
  void ChangeQusetions() {
    setState(() {
      if(questionsNumber == 20) {
        isNextButtonVisible = false;
        Navigator.of(context).pop();
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (context) => ResultScreen(
              correctAnswersCount: correctAnswersCount,
              resultText: resultText
            ),
          ),
        );
        QuizeScreen.showQuestionIndex = 0;
        resultNumber();
      }else {
        QuizeScreen.showQuestionIndex++;
        questionsNumber++;
        isBeforeButtonVisible = true; 
      }
    });
  }
  Image checkCorrectAnswer(index) {
    if (QuizeScreen.choosedAnswer == getQuestionsList()[QuizeScreen.showQuestionIndex].correctAnswer) {
      print('True');
      return getQuestionsList()[QuizeScreen.showQuestionIndex].answerList![index];
    } 
    else {
      print('False');
      return getQuestionsList()[QuizeScreen.showQuestionIndex].answerList![index];
    }
  }

  void resultNumber() {
    if(questionsNumber == 20) {
      correctAnswersCount = correctAnswersCount * 6 + 40;
      if(correctAnswersCount <= 70) {
        resultText = 'بسیار ضغیف';
      }
      if(correctAnswersCount <= 80  && 
          correctAnswersCount > 70) {
        resultText = 'ضغیف';
      }
      if(correctAnswersCount <= 90  && 
          correctAnswersCount > 80) {
        resultText = 'کم هوش';
      }
      if(correctAnswersCount <= 110  && 
          correctAnswersCount > 90) {
        resultText = 'متوسط';
      }
      if(correctAnswersCount <= 120  && 
          correctAnswersCount > 110) {
        resultText = 'باهوش';
      }
      if(correctAnswersCount <= 130  && 
          correctAnswersCount > 120) {
        resultText = 'برتر';
      }
      if(correctAnswersCount <= 145  && 
          correctAnswersCount > 130) {
        resultText = 'تیزهوش';
      }
      if(correctAnswersCount > 145) {
        resultText = 'نابغه';
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    if (QuizeScreen.choosedAnswer == getQuestionsList()[QuizeScreen.showQuestionIndex].correctAnswer) {
      correctAnswersCount++;
    }
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'آیا مطمعن هستید می خواهید از آزمون خارج شوید؟',
              style: TextStyle(
                fontFamily: 'dana',
                fontSize: 17,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(false),
                    child: Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text(
                        'نه',
                        style: TextStyle(
                          fontFamily: 'dana',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop(true);
                      setState(() {
                        QuizeScreen.showQuestionIndex = 0;
                        correctAnswersCount = 0;
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text(
                        'بله',
                        style: TextStyle(
                          fontFamily: 'dana',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    child: Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '(IQ) تست هوش ',
                      style: TextStyle(
                        fontFamily: 'dana',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25
                      ),
                      textAlign: TextAlign.end,
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      width: 350,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: getQuestionsList()[QuizeScreen.showQuestionIndex].question,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: 320,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      QuizeScreen.choosedAnswer = 0;
                                      ChangeQusetions();
                                    });
                                  },
                                  child: Container(
                                    width: 85,
                                    decoration: BoxDecoration(
                                      color: Colors.amber
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'A',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Container(
                                          width: 85,
                                          height: 85,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: checkCorrectAnswer(0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      QuizeScreen.choosedAnswer = 1;
                                      ChangeQusetions();
                                    });
                                  },
                                  child: Container(
                                    width: 85,
                                    decoration: BoxDecoration(
                                      color: Colors.amber
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'B',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Container(
                                          width: 85,
                                          height: 85,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: checkCorrectAnswer(1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      QuizeScreen.choosedAnswer = 2;
                                      ChangeQusetions();
                                    });
                                  },
                                  child: Container(
                                    width: 85,
                                    decoration: BoxDecoration(
                                      color: Colors.amber
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'C',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Container(
                                          width: 85,
                                          height: 85,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: checkCorrectAnswer(2),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      QuizeScreen.choosedAnswer = 3;
                                      ChangeQusetions();
                                    });
                                  },
                                  child: Container(
                                    width: 85,
                                    decoration: BoxDecoration(
                                      color: Colors.amber
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'D',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Container(
                                          width: 85,
                                          height: 85,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: checkCorrectAnswer(3),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      QuizeScreen.choosedAnswer = 4;
                                      ChangeQusetions();
                                    });
                                  },
                                  child: Container(
                                    width: 85,
                                    decoration: BoxDecoration(
                                      color: Colors.amber
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'E',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Container(
                                          width: 85,
                                          height: 85,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: checkCorrectAnswer(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      QuizeScreen.choosedAnswer = 5;
                                      ChangeQusetions();
                                    });
                                  },
                                  child: Container(
                                    width: 85,
                                    decoration: BoxDecoration(
                                      color: Colors.amber
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'F',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Container(
                                          width: 85,
                                          height: 85,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: checkCorrectAnswer(5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          right: 300,
                          child: Visibility(
                            visible: isBeforeButtonVisible,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  questionsNumber--;
                                  QuizeScreen.showQuestionIndex--;
                                  ButtonVisibleView();
                                });
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.navigate_before,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                    Text(
                                      'قبلی',
                                      style: TextStyle(
                                        fontFamily: 'dana',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Visibility(
                            visible: showQuestionsNumber,
                            child: Container(
                              width: 70,
                              child: Column(
                                children: [
                                  Text(
                                    '$questionsNumber / 20',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ]
                              ),
                            ),
                          ),
                        ), 
                        Positioned(
                          left: 300,
                          child: Visibility(
                            visible: isNextButtonVisible,
                            child: InkWell(
                              onTap:() {
                                setState(() {
                                  if(questionsNumber < 20) {
                                    questionsNumber++;
                                    QuizeScreen.showQuestionIndex++;
                                    ButtonVisibleView();
                                  }else {
                                    ChangeQusetions();
                                  }
                                });
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Text(
                                      questionsNumber == 20 ? 'پایان آزمون' : 'بعدی',
                                      style: TextStyle(
                                        fontFamily: 'dana',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                    Icon(
                                      Icons.navigate_next,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),   
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}

