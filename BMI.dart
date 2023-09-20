import 'package:flutter/material.dart';
import 'package:bmi/BMI app/Splashscreenbmi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: "Lobster",
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtCotroller = TextEditingController();
  var ftCotroller = TextEditingController();
  var inCotroller = TextEditingController();
  var result = '';
  var bgcolor = Colors.indigo.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(

          title: const Text('BMI', style: TextStyle(
              fontFamily: 'Manrope'
          ),),

        ),
        body: AnimatedContainer(


          color: bgcolor,
          duration: const Duration(seconds: 1),
          child: Center(
            child: SizedBox(
              width: 300,

              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const SizedBox(height: 70,),

                  const Text('BMI', style: TextStyle(
                      fontSize: 35, fontWeight: FontWeight.bold),),

                  const SizedBox(height: 50,),

                  TextField(
                    controller: wtCotroller,
                    decoration: const InputDecoration(
                      label: Text('Enter your Weight',
                        style: TextStyle(
                            fontSize: 20
                        ),),
                      prefixIcon: Icon(Icons.line_weight),

                    ),
                    keyboardType: TextInputType.number,

                  ),

                  const SizedBox(height: 40,),

                  TextField(
                    controller: ftCotroller,
                    decoration: const InputDecoration(
                      label: Text('Enter your Height (in feet)',
                        style: TextStyle(
                          fontSize: 20,
                        ),),
                      prefixIcon: Icon(Icons.height),

                    ),
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(height: 40,),

                  TextField(
                    controller: inCotroller,
                    decoration: const InputDecoration(
                      label: Text('Enter your Height (in inch)',
                        style: TextStyle(
                            fontSize: 20
                        ),),
                      prefixIcon: Icon(Icons.height),

                    ),
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(height: 50,),

                  SizedBox(
                    height: 40,
                    width: 200,
                    child: ElevatedButton(onPressed: () {
                      var wt = wtCotroller.text.toString();
                      var ft = ftCotroller.text.toString();
                      var inch = inCotroller.text.toString();

                      if (wt != '' && ft != '' && inch != '') {
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var incht = int.parse(inch);

                        var conInch = (ift * 12) + incht;
                        var conCm = conInch * 2.54;
                        var conM = conCm / 100;

                        var bmi = iwt / (conM * conM);

                        var msg = '';

                        if (bmi > 25) {
                          msg = 'You are Obeese';
                          bgcolor = Colors.orange.shade200;
                        }
                        else if (bmi < 18) {
                          msg = 'You are UnderWeight';
                          bgcolor = Colors.red.shade200;
                        }
                        else {
                          msg = 'You are Healthy';
                          bgcolor = Colors.green.shade200;
                        }

                        setState(() {

                        });

                        result = '$msg \n\n Your BMI is ${bmi.toStringAsFixed(
                            2)}';
                      }
                      else {
                        setState(() {
                          result = 'Please fill all the required blanks';
                        });
                      }
                    }, child: const Text('Calculate'
                      ,
                      style: TextStyle(
                          fontSize: 25
                      ),)
                    ),
                  ),

                  const SizedBox(height: 11,),

                  Text(result, style: const TextStyle(fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),)

                ],
              ),
            ),
          ),
        )
    );
  }
}