import 'package:show_booker/models/film_shows_response.dart';

import '../../models/purchase_confirmation_response.dart';

class FilmShowsRepo{

  Future<FilmShowsResponse?> getFilmShows(Map<String,String> data,String filmId,String date) async{
  }

  Future<PurchaseConfirmationResponse?> getPurchaseConfirmation(Map<String,String> data,String cinemaID,String filmId,String date,String time) async{
  }

}