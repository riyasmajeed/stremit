import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streamt/view/colors/colors.dart';
import 'package:streamt/view/movie/mainpage.dart';
import 'package:streamt/view/movie/screens.dart/forgotpass.dart';
import 'package:streamt/view/movie/screens.dart/registerpage.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
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
           padding: const EdgeInsets.only(top: 110),
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
           
              SizedBox(height:50,),
           Text('Welcome Back !',style:TextStyle(color: Colors.white,fontSize: 22,) ,),
           Text('you have been missed for long time',style:TextStyle(color: const Color.fromARGB(154, 255, 255, 255),fontSize: 15) ,),
               Padding(
                 padding:  EdgeInsets.only(left: 25,right: 25,top: 25),
                 child: Column(
                               mainAxisAlignment: MainAxisAlignment.end,
                               crossAxisAlignment: CrossAxisAlignment.end,
                 
                   children: [
                    
                     TextFormField(
                       decoration: InputDecoration(hintText: 'Email',prefixIcon:Icon(Icons.email) ,hintStyle: TextStyle(color: Colors.white,),
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
                       child: InkWell(
                        onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (Builder)=>Forgotpassword()));
                        },
                         child: Text('Forgot password ?',style:   
                                               TextStyle(
                          fontFamily: 'Bona Nova SC',
                          fontSize: 15
                          
                          ,color:red
                          
                                               )
                         ),
                       ),
                 
                     ),
                        
                     Container(
                        
                        width: double.infinity,
                        
                        decoration: BoxDecoration(
                          color:red,
                        borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextButton(onPressed: (){

                           Navigator.push(context, MaterialPageRoute(builder: (Builder)=>mainpage()));
                        }, child: Padding(padding: EdgeInsets.all(12.0),
                        child: Text("Login",style: TextStyle(color: Colors.white),),)),
                     ),
                      SizedBox(height: 15,),
                    Stack(
              alignment: Alignment.center,
              children: [
                Divider(
                  color: const Color.fromARGB(255, 193, 21, 21),
                  thickness: 1,
                ),
                Container(
                  color: Color.fromARGB(255, 0, 0, 0),
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Or continue with',style: TextStyle(color: Colors.white,fontSize: 15),),
                ),
              ],
            ),

            SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(fit: BoxFit.fill,
                                    image: NetworkImage('http://pngimg.com/uploads/google/google_PNG19635.png',
                              
                              ))
                                ),
                              ),
                            )
                          ],


                        ),
  SizedBox(height: 20,),

                     InkWell(
                      onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (Builder)=>Registerpage()));

                      },
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Center(child: Text("Don't have an account? ",style: TextStyle(color: Colors.white),),),
                            Center(child: Text("Register Now ",style: TextStyle(color:red),),),
                           
                         ],
                          
                          
                       ),
                     ),
                        
                  
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