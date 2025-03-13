import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:streamt/model/model.dart';

class MovieService {
  final String apiKey = 'e609906eba4ed8ae2e484ecea7d7adce';

  Future<List<Movie>> fetchPopularMovies() async {
    final url = 'https://api.themoviedb.org/3/trending/all/week?api_key=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}

class TVShowService {
  final String apiKey = 'e609906eba4ed8ae2e484ecea7d7adce';  // Replace with your actual API key
  final String baseUrl = 'https://api.themoviedb.org/3';

 Future<List<Movie>> fetchTrendingTVShows() async {
  final url = '$baseUrl/trending/tv/day?api_key=$apiKey&language=en-US';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final List<dynamic> results = data['results'];
    return results.map((json) => Movie.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load trending TV shows');
  }
}

}

class TMDbService {
  final String _apiKey = 'e609906eba4ed8ae2e484ecea7d7adce'; // Replace with your TMDb API Key
  final String _baseUrl = 'https://api.themoviedb.org/3';

  /// Fetches movies based on a query string.
  Future<List<dynamic>> searchMovies(String query) async {
    if (query.isEmpty) return [];

    final url = '$_baseUrl/search/movie?api_key=$_apiKey&query=$query';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'] ?? [];
    } else {
      throw Exception('Failed to fetch movies: ${response.statusCode}');
    }
  }
}


class Tvseries {
  final String apiKey = 'e609906eba4ed8ae2e484ecea7d7adce';

  Future<List<Movie>> fetchTvSeries() async {
    final url = 'https://api.themoviedb.org/3/tv/popular?api_key=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load TV series');
    }
  }
}

class PopularMovieService {
  final String apiKey = 'e609906eba4ed8ae2e484ecea7d7adce';

  Future<List<Movie>> fetchPopularsMovies({int page = 1}) async {
    final String baseUrl = 'https://api.themoviedb.org/3/movie/popular';
    final Uri uri = Uri.parse(baseUrl).replace(queryParameters: {
      'api_key': apiKey,
      'language': 'en-US',
      'page': page.toString(),
    });

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<dynamic> results = data['results'];
      return results.map((movieData) => Movie.fromJson(movieData)).toList();
    } else {
      throw Exception('Failed to fetch popular movies: ${response.statusCode}');
    }
  }
}