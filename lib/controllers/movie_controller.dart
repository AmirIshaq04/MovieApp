import 'package:get/get.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:video_player/models/movie_model.dart';

class MovieController extends GetxController {
  final RxList<Movie> movies = <Movie>[].obs;
  final RxBool isLoading = true.obs;

  final String apiKey = '354f43538320261ad5d587b8c0e0e58b';
  final readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNTRmNDM1MzgzMjAyNjFhZDVkNTg3YjhjMGUwZTU4YiIsInN1YiI6IjY1OWU4NWU4OTFiNTMwMDBlZjFlZTc5NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Lf9jwWn6CxnNPrI5qACgeuI2mBUn7US_8WQldrYx9qQ';

  @override
  void onInit() {
    super.onInit();
    loadMovies();
  }

  Future<void> loadMovies() async {
    try {
      isLoading.value = true;

      TMDB tmdbWithCustomLogs = TMDB(
        ApiKeys(apiKey, readAccessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
      );

      final Map moviesResults = await tmdbWithCustomLogs.v3.movies.getPopular();

      movies.assignAll(
        moviesResults['results'].map<Movie>((json) => Movie.fromJson(json)).toList(),
      );
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
