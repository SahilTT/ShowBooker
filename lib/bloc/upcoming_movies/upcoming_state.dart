part of 'upcoming_bloc.dart';

@immutable
abstract class UpcomingState {}

class UpcomingInitial extends UpcomingState {}

class OnDrawerCloseState extends UpcomingState {}

class OnDrawerOpenState extends UpcomingState {}

class NoInternetConnectionState extends UpcomingState {}

class InitGetUpComingMovie extends UpcomingState {}

class GetUpComingMovieFail extends UpcomingState {
  String errorMessage;
  GetUpComingMovieFail({required this.errorMessage});
}

class GetUpComingMovieSuceess extends UpcomingState {
  RuningMoviesResponse? data;
  GetUpComingMovieSuceess({required this.data});
}
