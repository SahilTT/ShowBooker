part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class OnDrawerCloseState extends DashboardState {}

class OnDrawerOpenState extends DashboardState {}

class NoInternetConnectionState extends DashboardState {}

class InitGetRuningMovie extends DashboardState {}

class GetRuningMovieFail extends DashboardState {
  String errorMessage;
  GetRuningMovieFail({required this.errorMessage});
}

class GetRuningMovieSuceess extends DashboardState {
  RuningMoviesResponse? data;
  GetRuningMovieSuceess({required this.data});
}

class InitGetUpComingMovie extends DashboardState {}

class GetUpComingMovieFail extends DashboardState {
  String errorMessage;
  GetUpComingMovieFail({required this.errorMessage});
}

class GetUpComingMovieSuceess extends DashboardState {
  RuningMoviesResponse? data;
  GetUpComingMovieSuceess({required this.data});
}

class LocationServiceOffState extends DashboardState {
  String? error;
  LocationServiceOffState({required this.error});
}

class LocationDeniedState extends DashboardState {
  String? error;
  LocationDeniedState({required this.error});
}

class LocationdeniedForeverState extends DashboardState {
  String? error;
  LocationdeniedForeverState({required this.error});
}

class LocationSuceessState extends DashboardState {
  Position? position;
  LocationSuceessState({required this.position});
}

class GetCitySuceessState extends DashboardState {
  String? city;
  GetCitySuceessState({required this.city});
}
