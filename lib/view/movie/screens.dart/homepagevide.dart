import 'package:flutter/material.dart';
import 'package:streamt/controll/apiservice.dart';
import 'package:streamt/model/model.dart';
import 'package:streamt/view/movie/screens.dart/moviedetailspage.dart';
import 'package:video_player/video_player.dart';


class HomePageVideoPlayer extends StatefulWidget {
  const HomePageVideoPlayer({super.key});

  @override
  _HomePageVideoPlayerState createState() => _HomePageVideoPlayerState();
}

class _HomePageVideoPlayerState extends State<HomePageVideoPlayer> {
  final String videoURL = "https://cdn.pixabay.com/video/2021/07/30/83274-581386222_tiny.mp4";
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  final MovieService movieService = MovieService(); // Initialize MovieService

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(videoURL);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {});
    });
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
      body: SingleChildScrollView(
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
              const SizedBox(height: 10),
              _buildSectionTitle('Specials & Latest Movies'),
              const SizedBox(height: 10),
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
                    return _buildMovieList(snapshot.data!);
                  }
                },
              ),
              _buildSectionTitle('Movies Recommended For You'),
              const SizedBox(height: 10),
              FutureBuilder<List<Movie>>(
                future: movieService.fetchPopularMovies(), // Assume a similar API call for recommended movies
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Failed to load movies.'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No movies available.'));
                  } else {
                    return _buildMovieListreverse (snapshot.data!);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
            color: const Color.fromARGB(255, 255, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_forward_ios, color: const Color.fromARGB(255, 255, 1, 1), size: 15),
        ),
      ],
    );
  }

  Widget _buildMovieList(List<Movie> movies) {
    return Container(
      height: 175,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
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
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                width: 115,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(posterUrl),
                  ),
                  color: Colors.cyan,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

   Widget _buildMovieListreverse(List<Movie> movies) {
    return Container(
      height: 175,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
        int reverseINDEX =  movies.length  - 1 - index ;
          final movie = movies[reverseINDEX];
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
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                width: 115,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(posterUrl),
                  ),
                  color: Colors.cyan,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}
