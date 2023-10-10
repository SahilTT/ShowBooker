part of 'film_shows_bloc.dart';


@immutable
abstract class FilmShowsState {}

class FilmShowsInitial extends FilmShowsState {}

class OnDrawerCloseState extends FilmShowsState {}

class OnDrawerOpenState extends FilmShowsState {}

class NoInternetConnectionState extends FilmShowsState {}

class InitGetMovieShowsState extends FilmShowsState {}

class GetMovieShowsFailState extends FilmShowsState {
  final String errorMessage;
  GetMovieShowsFailState({required this.errorMessage});
}

class GetMovieShowsSuceessState extends FilmShowsState {
  final FilmShowsResponse? data;
  GetMovieShowsSuceessState({required this.data});
}

class InitPurchaseTicketState extends FilmShowsState {}

class GetPurchaseTicketFailState extends FilmShowsState {
  String errorMessage;
  GetPurchaseTicketFailState({required this.errorMessage});
}

class GetPurchaseTicketSuceessState extends FilmShowsState {
  PurchaseConfirmationResponse? data;
  GetPurchaseTicketSuceessState({required this.data});
}

