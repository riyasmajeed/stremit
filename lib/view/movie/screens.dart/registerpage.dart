import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:streamt/view/colors/colors.dart';
import 'package:streamt/view/loginpage.dart';
import 'package:streamt/view/movie/mainpage.dart';
import 'package:streamt/view/movie/screens.dart/otpverification.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({super.key});

  @override
 Widget build(BuildContext context) => Container(
decoration: BoxDecoration(
  image: DecorationImage(image: AssetImage('assets/netfliximage.jpg'),
  fit: BoxFit.cover)
),

     child: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end:  Alignment.centerLeft,
          colors: [
            Colors.black12,
            Color.fromARGB(255, 0, 0, 0)
          ])
      ),
       child: Scaffold(
        
        backgroundColor: Colors.transparent,
       body: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.only(top: 30),
           child: Column(
            
              mainAxisAlignment: MainAxisAlignment.end,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               
           
           
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text("S",style: TextStyle(fontSize: 50,color: red,
                  fontWeight: FontWeight.w900,
                  ),),
                  Text("TREAMIT",style: TextStyle(fontSize: 35,color: red,
                  fontWeight: FontWeight.w900,
                  ),),
                ],
              ),
           
             
           Text('Welcome!',style:TextStyle(color: Colors.white,fontSize: 22,) ,),
           
               Padding(
                 padding:  EdgeInsets.only(left: 25,right: 25,top: 25),
                 child: Column(
                               mainAxisAlignment: MainAxisAlignment.end,
                               crossAxisAlignment: CrossAxisAlignment.end,
                 
                   children: [
                    
                     TextFormField(
                       decoration: InputDecoration(hintText: 'First name',prefixIcon:Icon(Icons.email) ,hintStyle: TextStyle(color: Colors.white,),
                       border: OutlineInputBorder(borderSide: BorderSide(width: 5)),
                       focusColor:red ),
                       keyboardType: TextInputType.emailAddress,
                       textInputAction: TextInputAction.next,cursorColor: Colors.white,
                       style: TextStyle(color: Colors.white),
                       
                            
                     ),
                     const SizedBox(height: 10,),
                          TextFormField(
                       decoration: InputDecoration(hintText: 'Email Id',prefixIcon:Icon(Icons.email) ,hintStyle: TextStyle(color: Colors.white,),
                       border: OutlineInputBorder(borderSide: BorderSide(width: 5)),
                       focusColor:red ),
                       keyboardType: TextInputType.emailAddress,
                       textInputAction: TextInputAction.next,cursorColor: Colors.white,
                       style: TextStyle(color: Colors.white),
                       
                            
                     ),

                     const SizedBox(height: 10,),
                      TextFormField(
                       decoration: InputDecoration(hintText: 'Phone number',prefixIcon:Icon(Icons.email) ,hintStyle: TextStyle(color: Colors.white,),
                       border: OutlineInputBorder(borderSide: BorderSide(width: 5)),
                       focusColor:red ),
                       keyboardType: TextInputType.emailAddress,
                       textInputAction: TextInputAction.next,cursorColor: Colors.white,
                       style: TextStyle(color: Colors.white),
                       
                            
                     ),
                     const SizedBox(height: 10,),
                      TextFormField(
                       decoration: InputDecoration(hintText: 'conform password',prefixIcon:Icon(Icons.email) ,hintStyle: TextStyle(color: Colors.white,),
                       border: OutlineInputBorder(borderSide: BorderSide(width: 5)),
                       focusColor:red ),
                       keyboardType: TextInputType.emailAddress,
                       textInputAction: TextInputAction.next,cursorColor: Colors.white,
                       style: TextStyle(color: Colors.white),
                       
                            
                     ),
                    
                    
                      const SizedBox(height: 10,),
                     TextFormField(
                       decoration: InputDecoration(hintText: 'passworld',prefixIcon:Icon(Icons.lock) ,hintStyle: TextStyle(color: Colors.white,),
                       border: OutlineInputBorder(borderSide: BorderSide(width: 5)),
                       focusColor:red ),
                       keyboardType: TextInputType.visiblePassword,
                       textInputAction: TextInputAction.next,cursorColor: Colors.white,
                       style: TextStyle(color: Colors.white),
                       
                            
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 10,bottom: 10),
                       
                 
                     ),
                        
                     Container(
                        
                        width: double.infinity,
                        
                        decoration: BoxDecoration(
                          color:red,
                        borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextButton(onPressed: (){

                           Navigator.push(context, MaterialPageRoute(builder: (Builder)=>Otpverification()));
                        }, child: Padding(padding: EdgeInsets.all(12.0),
                        child: Text("CREATE",style: TextStyle(color: Colors.white),),)),
                     ),
                        SizedBox(height: 15,),
                     InkWell(
                      onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (Builder)=>home()));

                      },
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Center(child: Text("Do you have account? ",style: TextStyle(color: Colors.white),),),
                            Center(child: Text("login Now ",style: TextStyle(color:red),),),
                           
                         ],
                          
                          
                       ),
                     ),
                        
                     SizedBox(height: 50,),
                   ],
                 ),
               ),
             ],
           ),
         ),
       ),
       
       ),
     ),
    );
}