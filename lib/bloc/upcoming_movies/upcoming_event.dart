part of 'upcoming_bloc.dart';

@immutable
abstract class UpcomingEvent {}

class onDrawerOpenCloseEvent extends UpcomingEvent {
  GlobalKey<ScaffoldState> scafoldKey;

  onDrawerOpenCloseEvent(this.scafoldKey);
}


class onGetUpComingMoviesEvent extends UpcomingEvent {
  final String currentTime;
  final String currentlocation;

  onGetUpComingMoviesEvent(this.currentTime, this.currentlocation);
}

class onCloseDrawerEvent extends UpcomingEvent {}

class onOpenDrawerEvent extends UpcomingEvent {}
