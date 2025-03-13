import 'package:flutter/material.dart';
import 'package:streamt/controll/apiservice.dart';
import 'package:streamt/model/model.dart';
import 'package:streamt/view/movie/screens.dart/moviedetailspage.dart';
import 'package:video_player/video_player.dart';


class Tvshowshomepage extends StatefulWidget {
  const Tvshowshomepage({super.key});

  @override
  _TvshowshomepageState createState() => _TvshowshomepageState();
}

class _TvshowshomepageState extends State<Tvshowshomepage> {
  final String videoURL =
      "https://cdn.pixabay.com/video/2021/07/30/83274-581386222_tiny.mp4";
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  final MovieService movieService = MovieService(); // Movies API
  final Tvseries tvSeriesService = Tvseries(); // TV Series API

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
              // Video Player
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    return Container(
                      height: 200,
                      color: Colors.grey[800],
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),

              // Specials & Latest TV Shows Section
              _buildSectionTitle('Specials & Latest TV Shows'),
              const SizedBox(height: 10),
              _buildTvShowList(),

              const SizedBox(height: 20),

              // TV Shows Recommended Section
              _buildSectionTitle('TV Shows Recommended For You'),
              const SizedBox(height: 10),
              _buildTvShowListreverse(),
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
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15),
        ),
      ],
    );
  }

  Widget _buildTvShowList() {
    return FutureBuilder<List<Movie>>(
      future: tvSeriesService.fetchTvSeries(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Failed to load TV shows.', style: TextStyle(color: Colors.white)));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No TV shows available.', style: TextStyle(color: Colors.white)));
        } else {
          return SizedBox(
            height: 175,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
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
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 115,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(posterUrl),
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }

  Widget _buildTvShowListreverse() {
    return FutureBuilder<List<Movie>>(
      future: tvSeriesService.fetchTvSeries(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Failed to load TV shows.', style: TextStyle(color: Colors.white)));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No TV shows available.', style: TextStyle(color: Colors.white)));
        } else {
          return SizedBox(
            height: 175,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                 int reverseINDEX = snapshot.data!.length  - 1 - index ;
                final movie = snapshot.data![reverseINDEX];
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
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
