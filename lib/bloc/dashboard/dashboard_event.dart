part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class onDrawerOpenCloseEvent extends DashboardEvent {
  GlobalKey<ScaffoldState> scafoldKey;

  onDrawerOpenCloseEvent(this.scafoldKey);
}

class onGetRuningMoviesEvent extends DashboardEvent {
  final String currentTime;
  final String currentlocation;

  onGetRuningMoviesEvent(this.currentTime, this.currentlocation);
}

class onGetUpComingMoviesEvent extends DashboardEvent {
  final String currentTime;
  final String currentlocation;

  onGetUpComingMoviesEvent(this.currentTime, this.currentlocation);
}

class getCurrentLocation extends DashboardEvent {
  final BuildContext context;
  getCurrentLocation(this.context);
}

class onCloseDrawerEvent extends DashboardEvent {}

class onOpenDrawerEvent extends DashboardEvent {}

class onGetCityEvent extends DashboardEvent {
  final String lat;
  final String long;
  onGetCityEvent(this.lat, this.long);
}