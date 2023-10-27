import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFF0361eb),
                      Color(0xFF3193f4),
                    ]
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50,),
                    Row(
                      children: [
                        SizedBox(width: 60,),
                        Image.asset(
                          'assets/images/welcome.png',
                          width: 300,
                          height: 400,
                        ),
                      ],
                    ),
                    SizedBox(height: 50,),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            'سلام رفقا به اپلیکیشن تیزهوش',
                            style: TextStyle(
                              fontFamily: 'danablack',
                              color: Colors.white,
                              fontSize: 25
                            ),
                          ),
                          Text(
                            '!خوش اومدین',
                            style: TextStyle(
                              fontFamily: 'danablack',
                              color: Colors.white,
                              fontSize: 40
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 30, 8, 47),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20)
                            ),
                          ),
                          primary: Color(0xFFFFFFFF),
                          minimumSize: Size(150, 40),
                          backgroundColor: Colors.amber,
                        ),
                        onPressed: () {
                          _saveInstallationSttus();
                          Navigator.pushReplacement(context, 
                          MaterialPageRoute(builder: (context) => HomeScreen(
                            toggleTheme: (){},
                          )),
                          );
                        },
                        child: Text(               
                          'بزن بریم',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontFamily: 'dana',
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
  _saveInstallationSttus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isInstalled', true);
  }
}