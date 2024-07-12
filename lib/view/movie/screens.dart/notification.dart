import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
       centerTitle: true,
       title:   Text('Notification',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),

      body: Padding(
         padding: const EdgeInsets.only(right: 15,left: 15,top: 10,bottom: 10),
        child: Column(
          children: [
             Text('Notifications',style:TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold) ,)
          ],
        ),
      ),
    );
  }
}