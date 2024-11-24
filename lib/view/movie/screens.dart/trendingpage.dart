import 'package:flutter/material.dart';
import 'package:streamt/model/model.dart';
import 'package:streamt/view/movie/screens.dart/moviedetailspage.dart';

import 'package:streamt/controll/apiservice.dart';

class Trendinghomepage extends StatefulWidget {
  const Trendinghomepage({super.key});

  @override
  State<Trendinghomepage> createState() => _TrendinghomepageState();
}

class _TrendinghomepageState extends State<Trendinghomepage> {
  final MovieService movieService = MovieService(); // MovieService instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Column(
            children: [
              // Trending Movies Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending Movies',
                    style: TextStyle(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 255, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15),
                  ),
                ],
              ),
              SizedBox(height: 4),
              
              // Fetching and displaying movies dynamically using GridView
              FutureBuilder<List<Movie>>(
                future: movieService.fetchPopularMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Failed to load movies.'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No movies available.'));
                  } else {
                    return Container(
                      padding: EdgeInsets.all(5),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),  // Disable scrolling for GridView
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Define the number of columns
                          crossAxisSpacing: 10, // Space between columns
                          mainAxisSpacing: 10, // Space between rows
                          childAspectRatio: 0.7, // Aspect ratio of each item
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final movie = snapshot.data![index];
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
