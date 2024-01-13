import 'package:get/get.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TopRatedController extends GetxController {
  final RxList<Map<String, dynamic>> topRatedMovies = <Map<String, dynamic>>[].obs;
  final RxBool isLoading = true.obs;

  final String apiKey = '354f43538320261ad5d587b8c0e0e58b';
  final readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNTRmNDM1MzgzMjAyNjFhZDVkNTg3YjhjMGUwZTU4YiIsInN1YiI6IjY1OWU4NWU4OTFiNTMwMDBlZjFlZTc5NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Lf9jwWn6CxnNPrI5qACgeuI2mBUn7US_8WQldrYx9qQ';

  @override
  void onInit() {
    super.onInit();
    loadTopRatedMovies();
  }

  Future<void> loadTopRatedMovies() async {
    try {
      isLoading.value = true;

      TMDB tmdbWithCustomLogs = TMDB(
        ApiKeys(apiKey, readAccessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
      );

      final Map topRatedResults = await tmdbWithCustomLogs.v3.movies.getTopRated();

      topRatedMovies.assignAll(topRatedResults['results']);
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
