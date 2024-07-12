import 'package:flutter/material.dart';
import 'package:streamt/view/colors/colors.dart';

class Playlist extends StatefulWidget {
  const Playlist({super.key});

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.black,
       centerTitle: true,
       title:   Text('INFO',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text('Create playlist',style:TextStyle(fontSize: 17,color:red,fontWeight: FontWeight.bold) ,),
          )
        ],
      ),
body: Padding(
  padding: const EdgeInsets.only(right: 15,left: 15,top: 10,bottom: 10),
  child: Column(
  children: [
    Text('Playlist',style:TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold) ,)
  ],
  ),
),
    );
  }
}