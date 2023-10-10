part of 'nearby_cinema_bloc.dart';

@immutable
abstract class NearbyCinemaState {}

class NearbyCinemaInitial extends NearbyCinemaState {}

class OnDrawerCloseState extends NearbyCinemaState {}

class OnDrawerOpenState extends NearbyCinemaState {}

class NoInternetConnectionState extends NearbyCinemaState {}

class InitGetNearByCinemaState extends NearbyCinemaState {}

class GetNearByCinemaFailState extends NearbyCinemaState {
  String errorMessage;
  GetNearByCinemaFailState({required this.errorMessage});
}

class GetNearByCinemaSuceessState extends NearbyCinemaState {
  NearByCineamResponse? data;
  GetNearByCinemaSuceessState({required this.data});
}