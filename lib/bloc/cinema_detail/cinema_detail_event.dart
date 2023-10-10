part of 'cinema_detail_bloc.dart';

@immutable
abstract class CinemaDetailEvent {}

class onDrawerOpenCloseEvent extends CinemaDetailEvent {
  GlobalKey<ScaffoldState> scafoldKey;

  onDrawerOpenCloseEvent(this.scafoldKey);
}

class onGetCinemaDetailEvent extends CinemaDetailEvent {
  final String currentTime;
  final String currentlocation;
  final String cinemaID;

  onGetCinemaDetailEvent(this.currentTime, this.currentlocation,this.cinemaID);
}

class onGetCinemaShowsEvent extends CinemaDetailEvent {
  final String currentTime;
  final String currentlocation;
  final String cinemaID;
  final String date;

  onGetCinemaShowsEvent(this.currentTime, this.currentlocation,this.cinemaID,this.date);
}

class onDateSelectEvent extends CinemaDetailEvent {
  final String date;
  onDateSelectEvent(this.date);
}

class onCloseDrawerEvent extends CinemaDetailEvent {}

class onOpenDrawerEvent extends CinemaDetailEvent {}

class onPurchaceEvent extends CinemaDetailEvent {
  final String currentTime;
  final String currentlocation;
  final String cinemID;
  final String filmID;
  final String date;
  final String time;

  onPurchaceEvent(this.currentTime, this.currentlocation,this.cinemID,this.filmID,this.date,this.time);
}
