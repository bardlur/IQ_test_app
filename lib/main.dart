import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';
import 'screens/welcome_screen.dart';
import 'constants/themes.dart';

void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
   Application({super.key});


  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  bool isDarkMode = false;
  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: _checkInstalltionStatus(), 
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); 
          } else if(snapshot.hasData && snapshot.data == true) {
            return HomeScreen(

              toggleTheme: toggleTheme,
              checkDarkMode: isDarkMode,
            );
          } else{
            return WelcomeScreen();
          }
        }
      ),
    );
  }

  Future<bool> _checkInstalltionStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isInstalled') ?? false;
  }
}



