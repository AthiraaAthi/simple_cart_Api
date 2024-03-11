import 'package:flutter/material.dart';
import 'package:new_api_try/view/home_screen.dart';
import 'package:new_api_try/view/register_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/my_controller.dart';
import '../model/my_model.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SampleApi sampleApiobj = SampleApi();

  final emailcontroller = TextEditingController();

  final passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final MyControllerobj = Provider.of<MyController>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Let's Login",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(
                hintText: "Enter Your Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passcontroller,
              decoration: InputDecoration(
                hintText: "Enter Your Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                await Provider.of<MyController>(context, listen: false)
                    .loginApi(
                        username: emailcontroller.text,
                        password: passcontroller.text);
                // Obtain shared preferences.
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                // await prefs.setString('email', emailcontroller.text.trim());
                // await prefs.setString('pass', passcontroller.text.trim());
                await prefs.getString("token");
                print(
                    "Successfully Stored Tokens are:  ${await prefs.getString("token")}");
                // await prefs.getString('pass');
                // final String RegName = prefs.getString('email').toString();
                // final String passName = prefs.getString('pass').toString();
                // if (emailcontroller.text.trim() == RegName &&
                //     passcontroller.text.trim() == passName) {
                //   await prefs.setBool("isLogged", true);

                //   Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => HomeScreen(),
                //       ));
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //       backgroundColor: Colors.red,
                //       content: Text("Enter a valid username & password")));
                // }
              },
              child: Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New member? ",
                  style: TextStyle(color: Colors.black),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ));
                  },
                  child: Text(
                    "Register now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
