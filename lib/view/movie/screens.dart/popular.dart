import 'package:flutter/material.dart';
import 'package:streamt/controll/apiservice.dart';
import 'package:streamt/model/model.dart';
import 'package:streamt/view/movie/screens.dart/moviedetailspage.dart';

class Popularhomepage extends StatefulWidget {
  const Popularhomepage({super.key});

  @override
  State<Popularhomepage> createState() => _PopularhomepageState();
}

class _PopularhomepageState extends State<Popularhomepage> {
  final PopularMovieService movieService = PopularMovieService(); // Service instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Movies',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15),
                  ),
                ],
              ),
              const SizedBox(height: 4),

              // Fetch and display movies dynamically in a GridView
              FutureBuilder<List<Movie>>(
                future: movieService.fetchPopularsMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Failed to load movies.'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No movies available.'));
                  } else {
                    final movies = snapshot.data!;

                    return Container(
                      padding: const EdgeInsets.all(5),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(), // Disable scrolling for GridView
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Number of columns
                          crossAxisSpacing: 10, // Space between columns
                          mainAxisSpacing: 10, // Space between rows
                          childAspectRatio: 0.7, // Aspect ratio of each item
                        ),
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          final movie = movies[index];
                          final posterUrl = movie.posterPath != null
                              ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                              : 'https://via.placeholder.com/500x750?text=No+Image';

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetailPage(imageUrl: posterUrl),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(posterUrl),
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.cyan,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
