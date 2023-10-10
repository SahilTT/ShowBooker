import 'package:show_booker/models/runing_movies_response.dart';

import 'dashboard_repo.dart';
import '../../data/remote/network/BaseApiService.dart';
import '../../data/remote/network/NetworkApiService.dart';

class DashboardRepoImpl implements DashboardRepo {
  BaseApiService _apiService = NetworkApiService();

  @override
  Future<RuningMoviesResponse?> getRuingMovies(Map<String, String> data) async {
    try {
      RuningMoviesResponse? response = await _apiService.getRuningMovie(data);
      // printOnDebug("API_RESPONSE $response");
      return response;
    } catch (e) {
      // printOnDebug("API-E $e}");
      throw e;
    }
  }

  @override
  Future<RuningMoviesResponse?> getUpComingMovies(Map<String, String> data) async {
    try {
      RuningMoviesResponse? response = await _apiService.getUpCominMovie(data);
      // printOnDebug("API_RESPONSE $response");
      return response;
    } catch (e) {
      // printOnDebug("API-E $e}");
      throw e;
    }
  }

}