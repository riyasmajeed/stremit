import 'package:flutter/material.dart';
import 'package:streamt/view/colors/colors.dart';
import 'package:streamt/view/movie/screens.dart/homepagevide.dart';
import 'package:streamt/view/movie/screens.dart/profilepage.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight+50),
          child: Padding(
            padding: const EdgeInsets.only(top: 20,right: 10),
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
                IconButton(icon: Icon(Icons.search), color: Colors.white, onPressed: () {  },),
                SizedBox(width: 10),
                IconButton(
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (Builder)=>Profilepage()));
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
                  Tab(text: 'Movies'),
                  Tab(text: 'TV Shows'),
                    Tab(text: 'Videos'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
          HomePageVideoPlayer(),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Center(child: Text('Trending Content')),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Center(child: Text('Subscriptions Content')),
            ),
              Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Center(child: Text('Subscriptions Content')),
            ),
          ],
        ),
      ),
    );
  }
}
