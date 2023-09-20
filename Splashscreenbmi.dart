
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'dart:async';
import "package:bmi/BMI app/BMI.dart";
import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0.0; // Initial opacity value

  @override
  void initState() {
    super.initState();
    // Add a delay to simulate the splash screen
    Timer(const Duration(seconds: 3), () {
      // Navigate to the BMI app when the timer is done
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        ),
      );
    });

    // Animate the opacity of the text
    _animateText();
  }

  void _animateText() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        opacity = 1.0; // Set opacity to 1 to make it fully visible
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: <Color>[Colors.black87, Colors.indigo])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add your splash screen content here
              AnimatedOpacity(
                  opacity: opacity,
                  duration: const Duration(seconds: 1),
                  child: Text(
                    ' B M I ',
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontWeight: FontWeight.bold,
                        fontSize: 80,
                        foreground: Paint()
                          ..shader = ui.Gradient.linear(
                            const Offset(0, 20),
                            const Offset(150, 20),
                            <Color>[
                              Colors.red,
                              Colors.yellow,
                            ],
                          )),
                  )),
              // You can replace this with your logo or custom content
              const SizedBox(height: 110),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white), // Set the color to white
              ),
            ],
          ),
        ),
      ),
    );
  }
}
