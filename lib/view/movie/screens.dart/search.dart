import 'package:flutter/material.dart';
import 'package:streamt/view/colors/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _controller = TextEditingController();
  List<String> _allMovies = [
    'Inception',
    'Interstellar',
    'The Dark Knight',
    'The Matrix',
    'The Godfather',
    'Pulp Fiction',
    // Add more movie titles
  ];
  List<String> _filteredMovies = [];

  @override
  void initState() {
    super.initState();
    _filteredMovies = _allMovies; // Initially, show all movies
  }

  void _filterMovies(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredMovies = _allMovies;
      });
    } else {
      setState(() {
        _filteredMovies = _allMovies
            .where((movie) => movie.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.black,
       centerTitle: true,
       title:   Text('Search Movies',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter movie name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (query) => _filterMovies(query),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredMovies.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredMovies[index],style: TextStyle(color: Colors.white),),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}