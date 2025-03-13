import 'package:flutter/material.dart';
import 'package:streamt/view/colors/colors.dart';
import 'package:streamt/view/movie/screens.dart/homepagevide.dart';
import 'package:streamt/view/movie/screens.dart/popular.dart';
import 'package:streamt/view/movie/screens.dart/profilepage.dart';
import 'package:streamt/view/movie/screens.dart/search.dart';
import 'package:streamt/view/movie/screens.dart/trendingpage.dart';
import 'package:streamt/view/movie/screens.dart/tvshows.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight+50),
          child: Padding(
            padding: const EdgeInsets.only(top: 0,right: 0),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              title: Text(
                'STREAMIT',
                style: TextStyle(
                  fontSize: 25,
                  color: red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(icon: Icon(Icons.search,size: 30,), color: Colors.white, onPressed: () { 
                    Navigator.push(context, MaterialPageRoute(builder: (Builder)=>SearchPage()));

                 },),
                SizedBox(width: 10),
                IconButton(
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (Builder)=>ProfilePage()));
                  },
                   icon: Icon(Icons.person, size: 30, color: Colors.white), )
               
              ],
              bottom: TabBar(
                dividerColor: Color.fromARGB(155, 158, 158, 158),
                labelColor: red,
                unselectedLabelColor: const Color.fromARGB(255, 242, 239, 239),
                labelStyle: TextStyle(
                  fontSize: 15,fontWeight: FontWeight.bold
                ),
                indicatorColor: red,
                tabs: [
                  Tab(text: 'Home',),
                  Tab(text: 'Trending',),
                  Tab(text: 'TV Shows'),
                    Tab(text: 'Popular'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
          HomePageVideoPlayer(),
          
            Trendinghomepage(),
          
            Tvshowshomepage(),
          

            Popularhomepage(),
          ],
        ),
      ),
    );
  }
}
