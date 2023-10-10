import 'package:show_booker/models/film_details_response.dart';
import 'package:show_booker/models/runing_movies_response.dart';

import 'film_detail_repo.dart';
import '../../data/remote/network/BaseApiService.dart';
import '../../data/remote/network/NetworkApiService.dart';

class FilmDetailRepoImpl implements FilmDetailRepo {
  BaseApiService _apiService = NetworkApiService();

  @override
  Future<FilmDetailsResponse?> getMoviesDetail(Map<String, String> data, String filmId) async {
    try {
      dynamic? response = await _apiService.getFilmDetail(data,filmId);
      // printOnDebug("API_RESPONSE $response");
      return response;
    } catch (e) {
      // printOnDebug("API-E $e}");
      throw e;
    }
  }
}