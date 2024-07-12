import 'package:flutter/material.dart';

class Bookmarkpage extends StatefulWidget {
  const Bookmarkpage({super.key});

  @override
  State<Bookmarkpage> createState() => _BookmarkpageState();
}

class _BookmarkpageState extends State<Bookmarkpage> {
  final List<String> bookmark = [
    'https://images.squarespace-cdn.com/content/v1/5acd17597c93273e08da4786/1547847934765-ZOU5KGSHYT6UVL6O5E5J/Shrek+Poster.png',
    'https://images.squarespace-cdn.com/content/v1/5acd17597c93273e08da4786/1547847934765-ZOU5KGSHYT6UVL6O5E5J/Shrek+Poster.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Bookmark',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
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
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: bookmark.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.grey,
              child: Image.network(
                bookmark[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}


