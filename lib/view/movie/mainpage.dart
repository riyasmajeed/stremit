import 'package:flutter/material.dart';
import 'package:streamt/view/movie/BottomNavigationWidget.dart';

class mainpage extends StatelessWidget {
  const mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Text('main page'),
      )),

bottomNavigationBar:  BottomNavigationWidget(),
    );
  }
}