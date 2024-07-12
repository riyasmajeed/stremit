import 'package:flutter/material.dart';
import 'package:streamt/view/colors/colors.dart';

class Plansplage extends StatefulWidget {
  const Plansplage({super.key});

  @override
  State<Plansplage> createState() => _PlansplageState();
}

class _PlansplageState extends State<Plansplage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
        backgroundColor: Colors.black,
       centerTitle: true,
       title:   Text('Planspage',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
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
        padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
        child: Column(
          children: [
        
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 81, 251, 86),
                ),
                borderRadius: BorderRadius.circular(7)
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 20,left: 20,top: 10,bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text('Free',style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),),

                      Text('Free',style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),),

                    Container(
                      height: 32,
                      width: 75,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 32, 165, 37),
borderRadius: BorderRadius.circular(4)
                      ),
                      child: Center(
                        child: Text('Your Plan',style: TextStyle(
                          color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal
                        ),),
                      ),
                    ),

                    

                 



                  ],
                ),
              ),
              
            ),
            SizedBox(height: 10,),

               Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red,

                        ),
                        borderRadius: BorderRadius.circular(5)

                      ),

                      child: Padding(
                        padding: const EdgeInsets.only(right: 20,left: 20,top: 10,bottom: 10),
                        child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                  Text('Basic',style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                                            ),),
                        
                             Radio(value: 1, groupValue: 1, onChanged: (value) {}), 
                                            
                              ],
                            ),
  Text('\$19 Per month',style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                                            ),),

                          ],
                        ),
                      ),
                    ),


 SizedBox(height: 10,),

               Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red,

                        ),
                        borderRadius: BorderRadius.circular(5)

                      ),

                      child: Padding(
                        padding: const EdgeInsets.only(right: 20,left: 20,top: 10,bottom: 10),
                        child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                  Text('Premium',style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                                            ),),
                        
                             Radio(value: 1, groupValue: 1, onChanged: (value) {}), 
                                            
                              ],
                            ),

                            Text('Enjoy all the benefits',style: TextStyle(
color: Colors.grey,fontSize: 15
                            ),),
  Text('\$19 Per month',style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                                            ),),

                          ],
                        ),
                      ),
                    ),
Spacer(),

                    Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: red,
                      ),
                      child: Center(
                        child: Text('Select and Proced',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                      ),
                    )


          ],
        ),
      ),

    );
  }
}