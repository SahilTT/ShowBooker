part of 'film_detail_bloc.dart';

@immutable
abstract class FilmDetailState {}

class FilmDetailInitial extends FilmDetailState {}

class OnDrawerCloseState extends FilmDetailState {}

class OnDrawerOpenState extends FilmDetailState {}

class NoInternetConnectionState extends FilmDetailState {}

class InitGetMovieDetailState extends FilmDetailState {}

class GetMovieDetailFailState extends FilmDetailState {
  String errorMessage;
  GetMovieDetailFailState({required this.errorMessage});
}

class GetMovieDetailSuceessState extends FilmDetailState {
  FilmDetailsResponse? data;
  GetMovieDetailSuceessState({required this.data});
}

class OnPageChangeState extends FilmDetailState {
  int index;
  OnPageChangeState({required this.index});
}
