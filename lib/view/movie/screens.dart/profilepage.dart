import 'package:flutter/material.dart';
import 'package:streamt/view/colors/colors.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
        backgroundColor: Colors.black,
       centerTitle: true,
       title:   Text('Profile',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
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
        padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
            
                  
              children: [
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(image: NetworkImage(''))
                ),
              
              ),
            ),
            
            SizedBox(height: 15,),
            Text('Edit',style: TextStyle(
              fontSize: 20,color: Colors.white
            ),)
            
              ],
            ),
          ),
        
        Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
         color: Color.fromARGB(86, 55, 69, 71)
        ),
         child: Row(
          children: [
                Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Name',style: TextStyle(
          color: Colors.white,fontSize: 20
        ),),
                ),
          ],
        ),
        ),
        
        SizedBox(height: 10,),
        Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(86, 55, 69, 71)
        ),
        child: Row(
          children: [
                Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Email Id',style: TextStyle(
          color: Colors.white,fontSize: 20
        ),),
                ),
          ],
        ),
        ),
        SizedBox(height: 10,),
        Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
        color: Color.fromARGB(86, 55, 69, 71)
        ),
        child: Row(
          children: [
                Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Location',style: TextStyle(
          color: Colors.white,fontSize: 20
        ),),
                ),
          ],
        ),
        ),
  SizedBox(height: 10,),
  ElevatedButton.icon(icon: Icon(Icons.my_location),
    onPressed: (){}, label:Text('MyLocation') ),


        Spacer(),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        
        InkWell(
          onTap: () {
              Navigator.pop(context);
          },
          child: Container(
            height: 50,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(25)
            ),
            child: Center(
              child: Text('cancell',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
            ),
          ),
        ),
         Container(
          height: 50,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(25)
          ),
          child: Center(
            child: Text('Save',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),),
          ),
        )
        
        ],)
            
          ],
        ),
      ),

    );
  }
}