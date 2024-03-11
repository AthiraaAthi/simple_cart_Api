import 'package:flutter/material.dart';
import 'package:new_api_try/view/home_screen.dart';
import 'package:new_api_try/view/login_screen.dart';
import 'package:new_api_try/view/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3)).then(
      (value) async {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
        // final SharedPreferences prefs = await SharedPreferences.getInstance();
        // final isLogged = await prefs.getBool("isLogged");
        // print(isLogged);
        // if (isLogged == true) {
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => LoginScreen(),
        //       ));
        // }
        // else {
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => RegisterScreen(),
        //       ));
        // }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Splash screen")),
    );
  }
}
