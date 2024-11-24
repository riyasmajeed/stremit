import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:streamt/view/loginpage.dart';

class spashscreen extends StatefulWidget {
  const spashscreen({super.key});

  @override
  State<spashscreen> createState() => _spashscreenState();
}

class _spashscreenState extends State<spashscreen> {
 
 @override
  void initState() {
    spashscreen();
    // TODO: implement initState
    super.initState();
  }

  Future<void>spashscreen()async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.push(context, MaterialPageRoute(builder: (Builder)=>Home()));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: AnimatedTextKit(
  animatedTexts: [
  FadeAnimatedText(
      'STREAMT',
      textStyle: const TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 247, 21, 4)
      ),
      duration: const Duration(milliseconds: 2000),
    ),
  ],
  
  totalRepeatCount: 4,
  pause: const Duration(milliseconds: 1000),
  displayFullTextOnTap: true,
  stopPauseOnTap: true,
),
        ),
      ),
    );
  }
}