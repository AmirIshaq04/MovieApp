//import 'package:get/get.dart';
//import 'package:tmdb_api/tmdb_api.dart';
//
//class MovieController extends GetxController {
//  final List<Map<String, dynamic>> movies = <Map<String, dynamic>>[].obs;
//  final String apiKey = 'your_api_key_here'; // Replace with your actual API key
//  final readAccessToken = 'your_read_access_token_here'; // Replace with your actual read access token
//
//  Future<void> loadMovies() async {
//    TMDB tmdbWithCustomLogs = TMDB(
//      ApiKeys(apiKey, readAccessToken),
//      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
//    );
//    final Map moviesResults = await tmdbWithCustomLogs.v3.trending.getTrending();
//
//    movies.assignAll(moviesResults['results']);
//  }
//}
