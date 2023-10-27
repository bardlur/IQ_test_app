import 'package:flutter/material.dart';
import 'quize_screen.dart';
import 'result_screen.dart';
import '../main.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.toggleTheme , this.checkDarkMode = true});


  final VoidCallback toggleTheme;
   final bool checkDarkMode;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

        ],
        elevation: 0,
        centerTitle: true,
        title: Text(
          'تیزهوش',
          style: Theme.of(context).textTheme.titleLarge
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Theme.of(context).scaffoldBackgroundColor,
                      Theme.of(context).scaffoldBackgroundColor,
                    ]
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => QuizeScreen())
                            );
                          },
                          child: Ink(
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft,
                                  colors: [
                                    Colors.blue.shade800,
                                    Colors.blue.shade400
                                  ]
                                ),
                                borderRadius: BorderRadius.circular(30)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    'assets/images/brain.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '(IQ) تست هوش ',
                                        style: TextStyle(
                                          fontFamily: 'danablack',
                                          color: Colors.white,
                                          fontSize: 28
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                      Text(
                                        'مناسب برای کودکان و نوجوانان',
                                        style: TextStyle(
                                          fontFamily: 'danablack',
                                          color: Colors.white,
                                          fontSize: 15
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 25,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: InkWell(
                          onTap: () {},
                          child: Ink(
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft,
                                  colors: [
                                    Color(0xFFF75B13),
                                    Color(0xFFFFC107),
                                  ]
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    'assets/images/brain.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'تست هوش ریون',
                                        style: TextStyle(
                                          fontFamily: 'danablack',
                                          color: Colors.white,
                                          fontSize: 28
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                      Text(
                                        'مناسب برای نوجوانان و بزرگسالان',
                                        style: TextStyle(
                                          fontFamily: 'danablack',
                                          color: Colors.white,
                                          fontSize: 15
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                      Text(
                                        '...به زودی',
                                        style: TextStyle(
                                          fontFamily: 'danablack',
                                          color: Colors.white,
                                          fontSize: 20
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Ink(
                                child: Container(
                                  width: 165,
                                  height: 80,
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
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'حمایت از ما',
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
                            InkWell(
                              onTap: () {
                                widget.toggleTheme();
                              },
                              child: Ink(
                                child: Container(
                                  width: 165,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      end: Alignment.topLeft,
                                      colors: [
                                        Theme.of(context).unselectedWidgetColor,
                                        Theme.of(context).primaryColorLight,
                                      ]
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        widget.checkDarkMode ?  Icons.dark_mode : Icons.sunny,
                                        color: Theme.of(context).secondaryHeaderColor,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        widget.checkDarkMode ? 'دارک':'لایت',
                                        style: Theme.of(context).textTheme.labelLarge,
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                              colors: [
                                Color(0xFF155C56),
                                Color(0xFF2A8881),
                              ]
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                             Image.asset('assets/images/IQ.png'),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'با تیزهوش',
                                    style: TextStyle(
                                      fontFamily: 'danablack',
                                      color: Colors.white,
                                      fontSize: 35
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                  Text(
                                    '!ببین چقدر باهوشی',
                                    style: TextStyle(
                                      fontFamily: 'danablack',
                                      color: Colors.white,
                                      fontSize: 21
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            ]
                          ),
                        ),
                        
                      ),
                    ]
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}