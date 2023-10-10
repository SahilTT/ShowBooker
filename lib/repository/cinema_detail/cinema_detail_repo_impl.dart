import 'package:show_booker/models/cinema_shows_response.dart';

import '../../data/remote/network/BaseApiService.dart';
import '../../data/remote/network/NetworkApiService.dart';
import '../../models/cinema_detail_respons.dart';
import '../../models/purchase_confirmation_response.dart';
import 'cinema_detail_repo.dart';

class CinemaDetailRepoImpl implements CinemaDetailRepo {
  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<CinemaDetailRespons?> getCinemaDetail(Map<String, String> data, String cinemaId) async {
    try {
      dynamic? response = await _apiService.getCinemaDetail(data, cinemaId);
      // printOnDebug("API_RESPONSE $response");
      return response;
    } catch (e) {
      // printOnDebug("API-E $e}");
      throw e;
    }
  }

  @override
  Future<CinemaShowsResponse?> getCinemaShows(Map<String, String> data,
      String cinemaID, String date) async {
    try {
      dynamic? response = await _apiService.getCinemaShows(data, cinemaID, date);
      // printOnDebug("API_RESPONSE $response");
      return response;
    } catch (e) {
      // printOnDebug("API-E $e}");
      throw e;
    }
  }

  @override
  Future<PurchaseConfirmationResponse?> getPurchaseConfirmation(Map<String, String> data,
      String cinemaID, String filmId, String date, String time) async {
    try {
      dynamic? response = await _apiService.getPurchaseConfirmation(data, cinemaID, filmId, date, time);
      return response;
    } catch (e) {
      throw e;
    }
  }
}