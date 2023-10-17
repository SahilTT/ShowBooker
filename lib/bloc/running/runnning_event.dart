part of 'running_bloc.dart';

@immutable
abstract class RunningEvent {}

class onDrawerOpenCloseEvent extends RunningEvent {
  GlobalKey<ScaffoldState> scafoldKey;

  onDrawerOpenCloseEvent(this.scafoldKey);
}

class onGetRuningMoviesEvent extends RunningEvent {
  final String currentTime;
  final String currentlocation;

  onGetRuningMoviesEvent(this.currentTime, this.currentlocation);
}

class onCloseDrawerEvent extends RunningEvent {}

class onOpenDrawerEvent extends RunningEvent {}
