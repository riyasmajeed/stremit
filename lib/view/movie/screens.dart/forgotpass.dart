import 'package:flutter/material.dart';
import 'package:streamt/view/colors/colors.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
       centerTitle: true,
       title:   Text('Forgotpassword',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
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

     body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text('Enter Your Email and we wii send you a password reset link',textAlign: TextAlign.center,style: TextStyle(
            color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold
          ),),
        ),
        SizedBox(height: 10,),
 Padding(
     padding: const EdgeInsets.symmetric(horizontal: 25.0),
   child: TextFormField(
                         decoration: InputDecoration(hintText: 'Email',prefixIcon:Icon(Icons.email) ,hintStyle: TextStyle(color: Colors.white,),
                         border: OutlineInputBorder(borderSide: BorderSide(width: 5)),
                         focusColor:red ),
                         keyboardType: TextInputType.emailAddress,
                         textInputAction: TextInputAction.next,cursorColor: Colors.white,
                         style: TextStyle(color: Colors.white),
                         
                              
                       ),
 ),
SizedBox(height: 10,),
 MaterialButton(onPressed: (){},
 child: Text('Reset Password'),
 color: red,)

      ],
     ), 
    );
  }
}