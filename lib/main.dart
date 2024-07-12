import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streamt/view/movie/mainpage.dart';
import 'package:streamt/view/spashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
   
    return  MaterialApp(
      theme:ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white
          )
        ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: Colors.black)
      ) ,
   
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        body: spashscreen(),
      ),

      
    );
  }
}