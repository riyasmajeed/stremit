import 'package:flutter/material.dart';
import 'package:streamt/view/colors/colors.dart';
import 'package:streamt/view/movie/screens.dart/Playlist.dart';
import 'package:streamt/view/movie/screens.dart/notification.dart';
import 'package:streamt/view/movie/screens.dart/plansplage.dart';
import 'package:streamt/view/movie/screens.dart/profilepage.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:   Color.fromARGB(255, 0, 0, 0),
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

        
      ),
     
      body: SingleChildScrollView(
        
        child: Column(
          children: [

              Divider(
              color: Colors.white,
              thickness: 1, // Thickness of the divider
            ),
            Padding(
            
               padding: const EdgeInsets.only(left: 10, right: 10, top: 20,bottom: 10),
              child: Column(
              
                children: [
                  
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                 color: Color.fromARGB(255, 255, 19, 2),
                 borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 20,top: 10,bottom: 10),
                  child: Row(
                    children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                  
                    ),
                  ),
                  SizedBox(width:15,),
                  
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('name',style: TextStyle(
                        color: Colors.white,fontSize: 15,
                      ),),
            
                       Text('mail ID',style: TextStyle(
                        color: Colors.white,fontSize: 15,
                      ),),
                       Text('Location',style: TextStyle(
                        color: Colors.white,fontSize: 15,
                      ),),
                      
            
                    ],
                  ),
            Spacer(),
            
                IconButton(onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (Builder)=>Profilepage()));
                }, icon:   Icon(Icons.edit,color: Colors.white,size: 30,))
            
                  
                    ],
                  ),
                ),
              ),
            SizedBox(height: 15,),
                 Container(
                height: 100,
                width: double.infinity,
                  decoration: BoxDecoration(
                 color: Color.fromARGB(255, 255, 19, 2),
                  borderRadius: BorderRadius.circular(10)
                ),
            
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 20,top: 10,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                    children: [
                  Text('FREE!',style: TextStyle(
                    color: Colors.white,fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
              InkWell(
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (Builder)=>Plansplage()));
                },
                child: Text('Upgrade plan',style: TextStyle(
                  height: 1.1,
                      color: Color.fromARGB(255, 253, 1, 1),fontSize: 16,fontWeight: FontWeight.bold
                    ),),
              ),
            
                  
            
                  
                    ],
                  ),
                ),
                
                ),
            
            SizedBox(height: 15,),
                 Container(
                height: 100,
                width: double.infinity,
                  decoration: BoxDecoration(
                 color: Color.fromARGB(255, 255, 19, 2),
                  borderRadius: BorderRadius.circular(10)
                ),
            
                child: InkWell(
                  onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (Builder)=>Playlist()));
                  },
                  child: Padding(
                           padding: const EdgeInsets.only(left: 10,right: 20,top: 10,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         
                        
                        Text('Show Playlist',style: TextStyle(
                          color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold
                        ),
                        
                        
                        ),
                  
                          SizedBox(width: 10,),
                           Icon(Icons.featured_play_list,color: Colors.white,size: 35,),
                  
                      ],
                    ),
                  ),
                ),
                 ),
            
                 SizedBox(height: 15,),
                 Container(
                height: 90,
                width: double.infinity,
                  decoration: BoxDecoration(
                 color: Color.fromARGB(255, 255, 19, 2),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: InkWell(
                  onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (Builder)=>Notifications()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20,left: 10,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                   
                  
                          Text('Notification',style: TextStyle(
                            color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold
                  
                          ),
                          ),
                            SizedBox(width: 10,),
                             Icon(Icons.notifications_active,color: Colors.white,size: 35,),
                        ],
                    ),
                  ),
                ),
                
                ),
                
                 SizedBox(height: 15,),
                 Container(
                height: 80,
                width: double.infinity,
                  decoration: BoxDecoration(
                 color: Color.fromARGB(255, 255, 19, 2),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 14,left: 10,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Text('Sign out',style: TextStyle(
                          color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold,)
                  ),
            IconButton(onPressed: () {
              showDialog(context: context, builder: (context) => AlertDialog(
                backgroundColor: Color.fromARGB(221, 97, 93, 93),
            title: Text('Logout',style: TextStyle(color: red,fontSize: 17,fontWeight: FontWeight.bold),),
            contentPadding: EdgeInsets.all(20),
            content: Text('Are you sure ?',style: TextStyle(
              color: red,fontSize: 17,fontWeight: FontWeight.bold,
            
            ),),
            
            actions: [
              ElevatedButton(onPressed: () {
                 Navigator.pop(context);
              }, child: Text('Cancell')),
              ElevatedButton(onPressed: () {
                
              }, child: Text('logout'))
            ],
              ),);
              
            }, icon: Icon(Icons.power_settings_new,color: const Color.fromARGB(255, 0, 0, 0),size: 35,) )
              
                      
            
                    ],
                  ),
                ),
                
                )
                  
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}




