import 'package:flutter/material.dart';
import 'package:streamt/controll/apiservice.dart';
// Import the service class

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  final TMDbService _tmdbService = TMDbService();
  List<dynamic> _movies = [];
  bool _isLoading = false;

  Future<void> _searchMovies(String query) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final results = await _tmdbService.searchMovies(query);
      setState(() {
        _movies = results;
      });
    } catch (e) {
      print('Error fetching movies: $e');
      setState(() {
        _movies = [];
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Search Movies',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(style: TextStyle(color: Colors.black),
              cursorColor: Colors.black,
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter movie name',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          setState(() {
                            _movies = [];
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (query) => _searchMovies(query),
            ),
            const SizedBox(height: 10),
            _isLoading
                ? const CircularProgressIndicator()
                : Expanded(
                    child: _movies.isEmpty
                        ? const Center(
                            child: Text(
                              'No movies found',
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        : ListView.builder(
                            itemCount: _movies.length,
                            itemBuilder: (context, index) {
                              final movie = _movies[index];
                              final title = movie['title'] ?? 'No Title';
                              final posterPath = movie['poster_path'];
                              final imageUrl = posterPath != null
                                  ? 'https://image.tmdb.org/t/p/w500$posterPath'
                                  : null;

                              return Card(
                                color: Colors.grey[900],
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: ListTile(
                                  leading: imageUrl != null
                                      ? Image.network(imageUrl, width: 50, fit: BoxFit.cover)
                                      : const Icon(Icons.movie, color: Colors.white),
                                  title: Text(
                                    title,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
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
