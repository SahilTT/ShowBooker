part of 'nearby_cinema_bloc.dart';

@immutable
abstract class NearbyCinemaEvent {}

class onDrawerOpenCloseEvent extends NearbyCinemaEvent {
  GlobalKey<ScaffoldState> scafoldKey;
  onDrawerOpenCloseEvent(this.scafoldKey);
}

class onGetNearbyCinemaEvent extends NearbyCinemaEvent {
  final String currentTime;
  final String currentlocation;

  onGetNearbyCinemaEvent(this.currentTime, this.currentlocation);
}

class onCloseDrawerEvent extends NearbyCinemaEvent {}

class onOpenDrawerEvent extends NearbyCinemaEvent {}