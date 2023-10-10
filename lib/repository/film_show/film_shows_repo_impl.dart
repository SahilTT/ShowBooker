
import 'package:show_booker/models/film_shows_response.dart';

import '../../data/remote/network/BaseApiService.dart';
import '../../data/remote/network/NetworkApiService.dart';
import '../../models/purchase_confirmation_response.dart';
import 'film_shows_repo.dart';

class FilmShowsRepoImpl implements FilmShowsRepo {
  BaseApiService _apiService = NetworkApiService();

  @override
  Future<FilmShowsResponse?> getFilmShows(Map<String, String> data, String filmId, String date) async {
    try {
      FilmShowsResponse? response = await _apiService.getFilmShows(data,filmId,date);
      return response;
    } catch (e) {
      // printOnDebug("API-E $e}");
      rethrow;
    }
  }

  @override
  Future<PurchaseConfirmationResponse?> getPurchaseConfirmation(Map<String, String> data,
      String cinemaID, String filmId, String date, String time) async {
    try {
      dynamic response = await _apiService.getPurchaseConfirmation(data, cinemaID, filmId, date, time);
      return response;
    } catch (e) {
      rethrow;
    }
  }

}