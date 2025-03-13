import 'package:flutter/material.dart';
import 'package:streamt/view/home.dart';
import 'package:streamt/view/movie/screens.dart/bookmark.dart';
import 'package:streamt/view/movie/screens.dart/genre.dart';
import 'package:streamt/view/movie/screens.dart/info.dart';
import 'package:iconsax/iconsax.dart'; 
ValueNotifier<int> indexchangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexchangeNotifier,
      builder: (context, int newIndex, _) {
        return Scaffold(
           
          body: IndexedStack(
            index: newIndex,
            children: [
              HomeScreen(),
              Bookmarkpage(),
              MovieScreen(),
              InfoScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: newIndex,
            onTap: (index) {
              indexchangeNotifier.value = index;
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey,
          
          
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Bookmark',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.category),
                label: 'Genre',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Info',
              ),
            ],
          ),
        );
      },
    );
  }
}



