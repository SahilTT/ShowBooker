import 'dart:io';

import 'package:show_booker/models/cinema_detail_respons.dart';
import 'package:show_booker/models/cinema_shows_response.dart';
import 'package:show_booker/models/film_details_response.dart';
import 'package:show_booker/models/nearby_cineam_response.dart';
import 'package:show_booker/models/purchase_confirmation_response.dart';

import '../../../models/film_shows_response.dart';
import '../../../models/runing_movies_response.dart';
import '../interceptors/api_call_loging.dart';
import 'ApiEndPoints.dart';
import 'package:dio/dio.dart';
import '../AppException.dart';
import 'BaseApiService.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future<RuningMoviesResponse?> getRuningMovie(
      Map<String, dynamic>? data) async {
    try {
      var dioClient = Dio();

      dioClient.options = BaseOptions(
          connectTimeout: 80000, receiveTimeout: 50000, headers: data);

      dioClient.interceptors.add(ApiLogging());

      var response = await dioClient
          .get(ApiEndPoints.baseUrl + ApiEndPoints.runingMovieUrl + "/?n=10");

      if (response.statusCode == 200)
        return RuningMoviesResponse.fromJson(response.data);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 404) {
          var errorMessage = e.response?.data['message'];
          throw DioHttpException(errorMessage);
        } else if (e.response?.statusCode == 401) {
          var errorMessage = e.response?.data['message'];
          throw UnauthorisedException(errorMessage);
        } else if (e.type == DioErrorType.other) {
          if (e.message.contains("SocketException")) {
            throw SocketException("No Internet");
          } else {
            var errorMessage = e.response?.data['message'];
            throw DioHttpException(errorMessage);
          }
        } else {
          var errorMessage = e.response?.data['message'];
          throw DioHttpException(errorMessage);
        }
      } else {
        throw FetchDataException(e.toString());
      }
    }
    return null;
  }

  @override
  Future<RuningMoviesResponse?> getUpCominMovie(
      Map<String, dynamic>? data) async {
    try {
      var dioClient = Dio();

      dioClient.options = BaseOptions(
          connectTimeout: 80000, receiveTimeout: 50000, headers: data);

      dioClient.interceptors.add(ApiLogging());

      var response = await dioClient
          .get("${ApiEndPoints.baseUrl}${ApiEndPoints.upComingMovieUrl}/?n=5");

      if (response.statusCode == 200)
        return RuningMoviesResponse.fromJson(response.data);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 404) {
          var errorMessage = e.response?.data['message'];
          throw DioHttpException(errorMessage);
        } else if (e.response?.statusCode == 401) {
          var errorMessage = e.response?.data['message'];
          throw UnauthorisedException(errorMessage);
        } else if (e.type == DioErrorType.other) {
          if (e.message.contains("SocketException")) {
            throw SocketException("No Internet");
          } else {
            var errorMessage = e.response?.data['message'];
            throw DioHttpException(errorMessage);
          }
        } else {
          var errorMessage = e.response?.data['message'];
          throw DioHttpException(errorMessage);
        }
      } else {
        throw FetchDataException(e.toString());
      }
    }
    return null;
  }

  @override
  Future<FilmDetailsResponse?> getFilmDetail(
      Map<String, dynamic>? data, String filmID) async {
    try {
      var dioClient = Dio();

      dioClient.options = BaseOptions(
          connectTimeout: 80000, receiveTimeout: 50000, headers: data);

      dioClient.interceptors.add(ApiLogging());

      var response = await dioClient.get(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.getFilmDetailUrl}$filmID");

      if (response.statusCode == 200) {
        return FilmDetailsResponse.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 404) {
          var errorMessage = e.response?.data['message'];
          throw DioHttpException(errorMessage);
        } else if (e.response?.statusCode == 401) {
          var errorMessage = e.response?.data['message'];
          throw UnauthorisedException(errorMessage);
        } else if (e.type == DioErrorType.other) {
          if (e.message.contains("SocketException")) {
            throw SocketException("No Internet");
          } else {
            var errorMessage = e.response?.data['message'];
            throw DioHttpException(errorMessage);
          }
        } else {
          var errorMessage = e.response?.data['message'];
          throw DioHttpException(errorMessage);
        }
      } else {
        throw FetchDataException(e.toString());
      }
    }
    return null;
  }

  @override
  Future<NearByCineamResponse?> getNearByCinema(
      Map<String, dynamic>? data) async {
    try {
      var dioClient = Dio();

      dioClient.options = BaseOptions(
          connectTimeout: 80000, receiveTimeout: 50000, headers: data);

      dioClient.interceptors.add(ApiLogging());

      var response = await dioClient
          .get("${ApiEndPoints.baseUrl}${ApiEndPoints.nearbyCinemaUrl}");

      if (response.statusCode == 200) {
        return NearByCineamResponse.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 404) {
          var errorMessage = e.response?.data['message'];
          throw DioHttpException(errorMessage);
        } else if (e.response?.statusCode == 401) {
          var errorMessage = e.response?.data['message'];
          throw UnauthorisedException(errorMessage);
        } else if (e.type == DioErrorType.other) {
          if (e.message.contains("SocketException")) {
            throw SocketException("No Internet");
          } else {
            var errorMessage = e.response?.data['message'];
            throw DioHttpException(errorMessage);
          }
        } else {
          var errorMessage = e.response?.data['message'];
          throw DioHttpException(errorMessage);
        }
      } else {
        throw FetchDataException(e.toString());
      }
    }
    return null;
  }

  @override
  Future<CinemaDetailRespons?> getCinemaDetail(
      Map<String, dynamic>? data, String cinemaID) async {
    try {
      var dioClient = Dio();

      dioClient.options = BaseOptions(
          connectTimeout: 80000, receiveTimeout: 50000, headers: data);

      dioClient.interceptors.add(ApiLogging());

      var response = await dioClient.get(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.cinemaDetailUrl}$cinemaID");

      if (response.statusCode == 200) {
        return CinemaDetailRespons.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 404) {
          var errorMessage = e.response?.data['message'];
          throw DioHttpException(errorMessage);
        } else if (e.response?.statusCode == 401) {
          var errorMessage = e.response?.data['message'];
          throw UnauthorisedException(errorMessage);
        } else if (e.type == DioErrorType.other) {
          if (e.message.contains("SocketException")) {
            throw SocketException("No Internet");
          } else {
            var errorMessage = e.response?.data['message'];
            throw DioHttpException(errorMessage);
          }
        } else {
          var errorMessage = e.response?.data['message'];
          throw DioHttpException(errorMessage);
        }
      } else {
        throw FetchDataException(e.toString());
      }
    }
    return null;
  }

  @override
  Future<CinemaShowsResponse?> getCinemaShows(
      Map<String, dynamic>? data, String cinemaID, String date) async {
    try {
      var dioClient = Dio();

      dioClient.options = BaseOptions(
          connectTimeout: 80000, receiveTimeout: 50000, headers: data);

      dioClient.interceptors.add(ApiLogging());

      var response = await dioClient.get(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.cinemaShowTimesUrl}${ApiEndPoints.cinemaIDParam}$cinemaID&${ApiEndPoints.dateParam}$date&${ApiEndPoints.sortPopularityParam}");

      if (response.statusCode == 200) {
        return CinemaShowsResponse.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 404) {
          var errorMessage = e.response?.data['message'];
          throw DioHttpException(errorMessage);
        } else if (e.response?.statusCode == 401) {
          var errorMessage = e.response?.data['message'];
          throw UnauthorisedException(errorMessage);
        } else if (e.type == DioErrorType.other) {
          if (e.message.contains("SocketException")) {
            throw SocketException("No Internet");
          } else {
            var errorMessage = e.response?.data['message'];
            throw DioHttpException(errorMessage);
          }
        } else {
          var errorMessage = e.response?.data['message'];
          throw DioHttpException(errorMessage);
        }
      } else {
        throw FetchDataException(e.toString());
      }
    }
    return null;
  }

  @override
  Future<FilmShowsResponse?> getFilmShows(
      Map<String, dynamic>? data, String filmID, String date) async {
    try {
      var dioClient = Dio();

      dioClient.options = BaseOptions(
          connectTimeout: 80000, receiveTimeout: 50000, headers: data);

      dioClient.interceptors.add(ApiLogging());

      var response = await dioClient.get(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.filmShowTimesUrl}${ApiEndPoints.filmIDParam}$filmID&${ApiEndPoints.dateParam}$date&n=10");

      if (response.statusCode == 200) {
        return FilmShowsResponse.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 404) {
          var errorMessage = e.response?.data['message'];
          throw DioHttpException(errorMessage);
        } else if (e.response?.statusCode == 401) {
          var errorMessage = e.response?.data['message'];
          throw UnauthorisedException(errorMessage);
        } else if (e.type == DioErrorType.other) {
          if (e.message.contains("SocketException")) {
            throw SocketException("No Internet");
          } else {
            var errorMessage = e.response?.data['message'];
            throw DioHttpException(errorMessage);
          }
        } else {
          var errorMessage = e.response?.data['message'];
          throw DioHttpException(errorMessage);
        }
      } else {
        throw FetchDataException(e.toString());
      }
    }
    return null;
  }

  @override
  Future<dynamic?> Test() async {
    try {
      var dioClient = Dio();

      dioClient.options = BaseOptions(
        connectTimeout: 80000,
        receiveTimeout: 50000,
      );

      var response = await dioClient.get("http://192.168.0.64:3000/users/list");

      if (response.statusCode == 200) {
        return response.data.toString();
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 404) {
          var errorMessage = e.response?.data['message'];
          throw DioHttpException(errorMessage);
        } else if (e.response?.statusCode == 401) {
          var errorMessage = e.response?.data['message'];
          throw UnauthorisedException(errorMessage);
        } else if (e.type == DioErrorType.other) {
          if (e.message.contains("SocketException")) {
            throw SocketException("No Internet");
          } else {
            var errorMessage = e.response?.data['message'];
            throw DioHttpException(errorMessage);
          }
        } else {
          var errorMessage = e.response?.data['message'];
          throw DioHttpException(errorMessage);
        }
      } else {
        throw FetchDataException(e.toString());
      }
    }
    return null;
  }

  @override
  Future<PurchaseConfirmationResponse?> getPurchaseConfirmation(
      Map<String, dynamic>? data,
      String cinemaID,
      String filmID,
      String date,
      String time) async {
    try {
      var dioClient = Dio();

      dioClient.options = BaseOptions(
          connectTimeout: 80000, receiveTimeout: 50000, headers: data);

      dioClient.interceptors.add(ApiLogging());

      var response = await dioClient.get(
          "${ApiEndPoints.baseUrl}${ApiEndPoints.purcheseConfirmationUrl}${ApiEndPoints.cinemaIDParam}$cinemaID&${ApiEndPoints.filmIDParam}$filmID&${ApiEndPoints.dateParam}$date&${ApiEndPoints.timeParam}$time");

      if (response.statusCode == 200) {
        return PurchaseConfirmationResponse.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 404) {
          var errorMessage = e.response?.data['message'];
          throw DioHttpException(errorMessage);
        } else if (e.response?.statusCode == 401) {
          var errorMessage = e.response?.data['message'];
          throw UnauthorisedException(errorMessage);
        } else if (e.type == DioErrorType.other) {
          if (e.message.contains("SocketException")) {
            throw SocketException("No Internet");
          } else {
            var errorMessage = e.response?.data['message'];
            throw DioHttpException(errorMessage);
          }
        } else {
          var errorMessage = e.response?.data['message'];
          throw DioHttpException(errorMessage);
        }
      } else {
        throw FetchDataException(e.toString());
      }
    }
    return null;
  }
}
