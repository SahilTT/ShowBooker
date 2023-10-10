import 'package:show_booker/models/cinema_detail_respons.dart';
import 'package:show_booker/models/purchase_confirmation_response.dart';

import '../../models/cinema_shows_response.dart';

class CinemaDetailRepo{

  Future<CinemaDetailRespons?> getCinemaDetail(Map<String,String> data,String cinemaID) async{
  }

  Future<CinemaShowsResponse?> getCinemaShows(Map<String,String> data,String cinemaID,String date) async{
  }

  Future<PurchaseConfirmationResponse?> getPurchaseConfirmation(Map<String,String> data,String cinemaID,String filmId,String date,String time) async{
  }

}