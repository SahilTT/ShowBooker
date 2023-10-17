part of 'running_bloc.dart';

@immutable
abstract class RunningState {}

class RunningStateInitial extends RunningState {}

class OnDrawerCloseState extends RunningState {}

class OnDrawerOpenState extends RunningState {}

class NoInternetConnectionState extends RunningState {}

class InitGetRuningMovie extends RunningState {}

class GetRuningMovieFail extends RunningState {
  String errorMessage;
  GetRuningMovieFail({required this.errorMessage});
}

class GetRuningMovieSuceess extends RunningState {
  RuningMoviesResponse? data;
  GetRuningMovieSuceess({required this.data});
}
