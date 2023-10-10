part of 'film_detail_bloc.dart';

@immutable
abstract class FilmDetailEvent {}

class onDrawerOpenCloseEvent extends FilmDetailEvent {
  GlobalKey<ScaffoldState> scafoldKey;

  onDrawerOpenCloseEvent(this.scafoldKey);
}

class onGetMovieDetailEvent extends FilmDetailEvent {
  final String currentTime;
  final String currentlocation;
  final String filmID;

  onGetMovieDetailEvent(this.currentTime, this.currentlocation,this.filmID);
}

class onPageChangeEvent extends FilmDetailEvent {
  final int index;
  onPageChangeEvent(this.index);
}

class onCloseDrawerEvent extends FilmDetailEvent {}

class onOpenDrawerEvent extends FilmDetailEvent {}
