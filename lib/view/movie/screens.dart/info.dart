// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:streamt/controll/datacontroll.dart';

// import 'package:streamt/model/databasemodel.dart';
// import 'package:streamt/view/colors/colors.dart';
// import 'package:streamt/view/movie/screens.dart/Playlist.dart';
// import 'package:streamt/view/movie/screens.dart/notification.dart';
// import 'package:streamt/view/movie/screens.dart/plansplage.dart';
// import 'package:streamt/view/movie/screens.dart/profilepage.dart';

// class InfoScreen extends StatefulWidget {
//    final userController = Get.put(UserSQLController());
//    InfoScreen({super.key}) {     userController.loadUser(); // Load user when page opens
//   }

//   @override
//   State<InfoScreen> createState() => _InfoScreenState();
// }

// class _InfoScreenState extends State<InfoScreen> {
 
  
   

 
 
//   @override
//   Widget build(BuildContext context) {
   
//     return Scaffold(
//       backgroundColor:   Color.fromARGB(255, 0, 0, 0),
//        appBar: AppBar(
//         backgroundColor: Colors.black,
//        centerTitle: true,
//        title:   Text('INFO',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//         ),

        
//       ),
     
//       body: Obx((){

//  final user = userController.currentUser.value;

//          if (user == null) return Center(child: Text("No user data found"));

//         return
//       SingleChildScrollView(
        
//         child: Column(
//           children: [

//               Divider(
//               color: Colors.white,
//               thickness: 1, // Thickness of the divider
//             ),
//             Padding(
            
//                padding: const EdgeInsets.only(left: 10, right: 10, top: 20,bottom: 10),
//               child: Column(
              
//                 children: [
                  
//               Container(
//                 height: 120,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                  color: Color.fromARGB(255, 255, 19, 2),
//                  borderRadius: BorderRadius.circular(10)
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 10,right: 20,top: 10,bottom: 10),
//                   child: Row(
//                     children: [
//                 Container(
//                       height: 80,
//                       width: 80,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.grey,
//                         image: (user.imagePath != null && File(user.imagePath ).existsSync())
//                             ? DecorationImage(
//                                 image: FileImage(File(user.imagePath )),
//                                 fit: BoxFit.cover)
//                             : null,
//                       ),
//                       child: (user.imagePath  == null || !File(user.imagePath ).existsSync())
//                           ? Icon(Icons.person, color: Colors.white, size: 40)
//                           : null,
//                     ),
//                   SizedBox(width:15,),
                  
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                      Text(user.name, style: TextStyle(color: Colors.white, fontSize: 15)),
            
//                        Text(user.email,style: TextStyle(
//                         color: Colors.white,fontSize: 15,
//                       ),),
//                        Text(user.location,style: TextStyle(
//                         color: Colors.white,fontSize: 15,
//                       ),),
                      
            
//                     ],
//                   ),
//             Spacer(),
            
//                 IconButton(onPressed: () {
//                    Navigator.push(context, MaterialPageRoute(builder: (Builder)=>ProfilePage()));
//                 }, icon:   Icon(Icons.edit,color: Colors.white,size: 30,))
            
                  
//                     ],
//                   ),
//                 ),
//               ),
//             SizedBox(height: 15,),
//                  Container(
//                 height: 100,
//                 width: double.infinity,
//                   decoration: BoxDecoration(
//                  color: Color.fromARGB(255, 255, 19, 2),
//                   borderRadius: BorderRadius.circular(10)
//                 ),
            
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 10,right: 20,top: 10,bottom: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
//                     children: [
//                   Text('FREE!',style: TextStyle(
//                     color: Colors.white,fontSize: 20,
//                     fontWeight: FontWeight.bold
//                   ),),
//               InkWell(
//                 onTap: () {
//                    Navigator.push(context, MaterialPageRoute(builder: (Builder)=>Plansplage()));
//                 },
//                 child: Text('Upgrade plan',style: TextStyle(
//                   height: 1.1,
//                       color: Color.fromARGB(255, 1, 253, 60),fontSize: 18,fontWeight: FontWeight.bold
//                     ),),
//               ),
            
                  
            
                  
//                     ],
//                   ),
//                 ),
                
//                 ),
            
//             SizedBox(height: 15,),
//                  Container(
//                 height: 100,
//                 width: double.infinity,
//                   decoration: BoxDecoration(
//                  color: Color.fromARGB(255, 255, 19, 2),
//                   borderRadius: BorderRadius.circular(10)
//                 ),
            
//                 child: InkWell(
//                   onTap: () {
//                        Navigator.push(context, MaterialPageRoute(builder: (Builder)=>Playlist()));
//                   },
//                   child: Padding(
//                            padding: const EdgeInsets.only(left: 10,right: 20,top: 10,bottom: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
                         
                        
//                         Text('Show Playlist',style: TextStyle(
//                           color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold
//                         ),
                        
                        
//                         ),
                  
//                           SizedBox(width: 10,),
//                            Icon(Icons.featured_play_list,color: Colors.white,size: 35,),
                  
//                       ],
//                     ),
//                   ),
//                 ),
//                  ),
            
//                  SizedBox(height: 15,),
//                  Container(
//                 height: 90,
//                 width: double.infinity,
//                   decoration: BoxDecoration(
//                  color: Color.fromARGB(255, 255, 19, 2),
//                   borderRadius: BorderRadius.circular(10)
//                 ),
//                 child: InkWell(
//                   onTap: () {
//                        Navigator.push(context, MaterialPageRoute(builder: (Builder)=>Notifications()));
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.only(right: 20,left: 10,),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
                   
                  
//                           Text('Notification',style: TextStyle(
//                             color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold
                  
//                           ),
//                           ),
//                             SizedBox(width: 10,),
//                              Icon(Icons.notifications_active,color: Colors.white,size: 35,),
//                         ],
//                     ),
//                   ),
//                 ),
                
//                 ),
                
//                  SizedBox(height: 15,),
//                  Container(
//                 height: 80,
//                 width: double.infinity,
//                   decoration: BoxDecoration(
//                  color: Color.fromARGB(255, 255, 19, 2),
//                   borderRadius: BorderRadius.circular(10)
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 14,left: 10,),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                   Text('Sign out',style: TextStyle(
//                           color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold,)
//                   ),
//             IconButton(onPressed: () {
//               showDialog(context: context, builder: (context) => AlertDialog(
//                 backgroundColor: Color.fromARGB(221, 97, 93, 93),
//             title: Text('Logout',style: TextStyle(color: red,fontSize: 17,fontWeight: FontWeight.bold),),
//             contentPadding: EdgeInsets.all(20),
//             content: Text('Are you sure ?',style: TextStyle(
//               color: red,fontSize: 17,fontWeight: FontWeight.bold,
            
//             ),),
            
//             actions: [
//               ElevatedButton(onPressed: () {
//                  Navigator.pop(context);
//               }, child: Text('Cancell')),
//               ElevatedButton(onPressed: () {
                
//               }, child: Text('logout'))
//             ],
//               ),);
              
//             }, icon: Icon(Icons.power_settings_new,color: const Color.fromARGB(255, 0, 0, 0),size: 35,) )
              
                      
            
//                     ],
//                   ),
//                 ),
                
//                 )
                  
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );

//       })

//     );
//   }
// }



import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:streamt/controll/datacontroll.dart';
import 'package:streamt/view/colors/colors.dart';
import 'package:streamt/view/movie/screens.dart/Playlist.dart';
import 'package:streamt/view/movie/screens.dart/notification.dart';
import 'package:streamt/view/movie/screens.dart/plansplage.dart';
import 'package:streamt/view/movie/screens.dart/profilepage.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final userController = Get.find<UserSQLController>();

  @override
  void initState() {
    super.initState();
    userController.loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('INFO',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Obx(() {
        final user = userController.currentUser.value;
        if (user == null) return const Center(child: Text("No user data found", style: TextStyle(color: Colors.white)));

        return SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Divider(color: Colors.white, thickness: 1),
              const SizedBox(height: 20),

              /// USER CARD
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 19, 2),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        image: (user.imagePath != null && File(user.imagePath!).existsSync())
                            ? DecorationImage(
                                image: FileImage(File(user.imagePath!)),
                                fit: BoxFit.cover)
                            : null,
                      ),
                      child: (user.imagePath == null || !File(user.imagePath!).existsSync())
                          ? const Icon(Icons.person, color: Colors.white, size: 40)
                          : null,
                    ),
                    const SizedBox(width: 15),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(user.name,
                    //         style: const TextStyle(color: Colors.white, fontSize: 15)),
                    //     Text(user.email,
                    //         style: const TextStyle(color: Colors.white, fontSize: 15)),
                    //     Text(user.location,overflow: TextOverflow.ellipsis,
                    //     maxLines: 2,
                    //         style: const TextStyle(color: Colors.white, fontSize: 10)),
                    //   ],
                    // ),
                    SizedBox(
  width: 200, // or use MediaQuery to make it responsive
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        user.name,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      Text(
        user.email,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      Text(
        user.location,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
    ],
  ),
),

                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) =>  ProfilePage()));
                      },
                      icon: const Icon(Icons.edit, color: Colors.white, size: 30),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),

              /// PLAN CARD
              buildCard(
                title: 'FREE!',
                trailing: 'Upgrade plan',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Plansplage()));
                },
                trailingColor: Colors.greenAccent,
              ),

              const SizedBox(height: 15),

              /// PLAYLIST CARD
              buildIconCard(
                title: 'Show Playlist',
                icon: Icons.featured_play_list,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Playlist()));
                },
              ),

              const SizedBox(height: 15),

              /// NOTIFICATION CARD
              buildIconCard(
                title: 'Notification',
                icon: Icons.notifications_active,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Notifications()));
                },
              ),

              const SizedBox(height: 15),

              /// SIGN OUT CARD
              buildIconCard(
                title: 'Sign out',
                icon: Icons.power_settings_new,
                iconColor: Colors.black,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            backgroundColor: const Color.fromARGB(221, 97, 93, 93),
                            title: Text('Logout',
                                style: TextStyle(
                                    color: red,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            contentPadding: const EdgeInsets.all(20),
                            content: Text('Are you sure?',
                                style: TextStyle(
                                    color: red,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                            actions: [
                              ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cancel')),
                              ElevatedButton(
                                  onPressed: () {
                                    Get.back(); // Close dialog
                                    Get.offAllNamed('/profile'); // Navigate back to profile/login
                                  },
                                  child: const Text('Logout')),
                            ],
                          ));
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildCard({
    required String title,
    required String trailing,
    required VoidCallback onTap,
    Color trailingColor = Colors.white,
  }) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 19, 2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          InkWell(
            onTap: onTap,
            child: Text(trailing,
                style: TextStyle(
                    color: trailingColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Widget buildIconCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    Color iconColor = Colors.white,
  }) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 19, 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
            Icon(icon, color: iconColor, size: 35),
          ]),
        ),
      ),
    );
  }
}
