import 'package:show_booker/models/nearby_cineam_response.dart';
import 'package:show_booker/repository/nearby_cinema/nearby_cinema_repo.dart';

import '../../data/remote/network/BaseApiService.dart';
import '../../data/remote/network/NetworkApiService.dart';

class NearByCinemaRepoImpl implements NearByCinemaRepo {
  BaseApiService _apiService = NetworkApiService();

  @override
  Future<NearByCineamResponse?> getNearByCinema(Map<String, String> data) async {
    try {
      dynamic? response = await _apiService.getNearByCinema(data);
      // printOnDebug("API_RESPONSE $response");
      return response;
    } catch (e) {
      // printOnDebug("API-E $e}");
      throw e;
    }
  }
}