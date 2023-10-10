part of 'cinema_detail_bloc.dart';

@immutable
abstract class CinemaDetailState {}

class CinemaDetailInitial extends CinemaDetailState {}

class OnDrawerCloseState extends CinemaDetailState {}

class OnDrawerOpenState extends CinemaDetailState {}

class NoInternetConnectionState extends CinemaDetailState {}

class InitGetCinemaDetailState extends CinemaDetailState {}

class GetCinemaDetailFailState extends CinemaDetailState {
  String errorMessage;
  GetCinemaDetailFailState({required this.errorMessage});
}

class GetCinemaDetailSuceessState extends CinemaDetailState {
  CinemaDetailRespons? data;
  GetCinemaDetailSuceessState({required this.data});
}

class InitGetCinemaShowState extends CinemaDetailState {}

class GetCinemaShowFailState extends CinemaDetailState {
  String errorMessage;
  GetCinemaShowFailState({required this.errorMessage});
}

class GetCinemaShowSuceessState extends CinemaDetailState {
  CinemaShowsResponse? data;
  GetCinemaShowSuceessState({required this.data});
}

class onDateSlectState extends CinemaDetailState {
  String? date;
  onDateSlectState({required this.date});
}

class InitPurchaseTicketState extends CinemaDetailState {}

class GetPurchaseTicketFailState extends CinemaDetailState {
  String errorMessage;
  GetPurchaseTicketFailState({required this.errorMessage});
}

class GetPurchaseTicketSuceessState extends CinemaDetailState {
  PurchaseConfirmationResponse? data;
  GetPurchaseTicketSuceessState({required this.data});
}
