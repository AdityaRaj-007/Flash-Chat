import 'package:chatting_app/screens/login_screen.dart';
import 'package:chatting_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:chatting_app/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {

  static String id = 'welcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
    );

    animation = ColorTween(begin: Colors.red, end: Colors.purple).animate(controller);

    controller.forward();

    controller.addListener(() {
      setState((){ });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                 TypewriterAnimatedTextKit(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                  text: ['Flash Chat'],
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            Padding(
             padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Material(
              elevation: 5.0,
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
                minWidth: 200.0,
              height: 42.0,
              child: const Text(
               'Log In',
                 style: TextStyle(
                   color: Colors.white,
                 ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Material(
          elevation: 5.0,
          color: Colors.green,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
            },
            minWidth: 200.0,
            height: 42.0,
            child: const Text(
              'Register',
              style: TextStyle(
                color: Colors.white,
              ),
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

