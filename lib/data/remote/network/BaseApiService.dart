import 'package:show_booker/models/cinema_detail_respons.dart';
import 'package:show_booker/models/cinema_shows_response.dart';
import 'package:show_booker/models/film_details_response.dart';
import 'package:show_booker/models/film_shows_response.dart';
import 'package:show_booker/models/nearby_cineam_response.dart';
import 'package:show_booker/models/purchase_confirmation_response.dart';

import '../../../models/runing_movies_response.dart';

abstract class BaseApiService {

  Future<RuningMoviesResponse?> getRuningMovie(Map<String, dynamic>? data);
  Future<RuningMoviesResponse?> getUpCominMovie(Map<String, dynamic>? data);
  Future<FilmDetailsResponse?> getFilmDetail(Map<String, dynamic>? data,String filmID);
  Future<NearByCineamResponse?> getNearByCinema(Map<String, dynamic>? data);
  Future<CinemaDetailRespons?> getCinemaDetail(Map<String, dynamic>? data,String cinemaID);
  Future<CinemaShowsResponse?> getCinemaShows(Map<String, dynamic>? data,String cinemaID,String date);
  Future<FilmShowsResponse?> getFilmShows(Map<String, dynamic>? data,String filmID,String date);
  Future<PurchaseConfirmationResponse?> getPurchaseConfirmation(Map<String, dynamic>? data,String cinemaID,String filmID,String date,String time);

// Future<CreateContactResponse?> createContact(Map<String, dynamic>? data);
  // Future<SearchContactResponse?> searchContact(Map<String, dynamic> data);
  // Future<CreateContactResponse?> updateContact(Map<String, dynamic> data,String? Id);
  // Future<CreateConversationResponse?> createConversation(Map<String, dynamic> data);

}