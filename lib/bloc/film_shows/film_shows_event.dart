part of 'film_shows_bloc.dart';

@immutable
abstract class FilmShowsEvent {}

class onDrawerOpenCloseEvent extends FilmShowsEvent {
  GlobalKey<ScaffoldState> scafoldKey;

  onDrawerOpenCloseEvent(this.scafoldKey);
}

class onGetMovieShowsEvent extends FilmShowsEvent {
  final String currentTime;
  final String currentlocation;
  final String filmID;
  final String date;

  onGetMovieShowsEvent(this.currentTime, this.currentlocation,this.filmID,this.date);
}

class onCloseDrawerEvent extends FilmShowsEvent {}

class onOpenDrawerEvent extends FilmShowsEvent {}

class onPurchaceEvent extends FilmShowsEvent {
  final String currentTime;
  final String currentlocation;
  final String cinemID;
  final String filmID;
  final String date;
  final String time;

  onPurchaceEvent(this.currentTime, this.currentlocation,this.cinemID,this.filmID,this.date,this.time);
}
