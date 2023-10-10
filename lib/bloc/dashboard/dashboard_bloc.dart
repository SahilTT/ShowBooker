import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:show_booker/models/runing_movies_response.dart';

import '../../repository/dashboard/dashboard_repo_impl.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {

  final dashboardRepoImpl=DashboardRepoImpl();

  DashboardBloc() : super(DashboardInitial()) {
    on<onGetRuningMoviesEvent>(_getRuningMovie);
    on<onGetUpComingMoviesEvent>(_getUpComingMovie);
    on<getCurrentLocation>(_determinePosition);
    on<onGetCityEvent>(_getCityName);
    on<onDrawerOpenCloseEvent>(_closeOpenDrawer);
    on<onOpenDrawerEvent>(_openDrawer);
    on<onCloseDrawerEvent>(_closeDrawer);
  }

  FutureOr<void> _getRuningMovie(onGetRuningMoviesEvent event, Emitter<DashboardState> emit) async {
    String errorMessage = "Internal server error";
    emit(InitGetRuningMovie());
    try {

      Map<String,String> requestData = Map();
      requestData["geolocation"] = event.currentlocation;
      requestData["device-datetime"] = event.currentTime;

      final authUser = await dashboardRepoImpl.getRuingMovies(requestData);
      emit(authUser == null
          ? GetRuningMovieFail(errorMessage: "Something went wrong")
          : GetRuningMovieSuceess(data: authUser));
    } on SocketException {
      errorMessage = "No Internet";
      emit(NoInternetConnectionState());
    } on HttpException {
      errorMessage = "No Service";
    } on FormatException {
      errorMessage = "No Format Exception";
    } catch (e) {
      errorMessage = '${e.toString()}';
      emit(GetRuningMovieFail(errorMessage: errorMessage));
    }
  }


  FutureOr<void> _getUpComingMovie(onGetUpComingMoviesEvent event, Emitter<DashboardState> emit) async {
    String errorMessage = "Internal server error";
    emit(InitGetUpComingMovie());
    try {
      Map<String,String> requestData = Map();
      requestData["geolocation"] = event.currentlocation;
      requestData["device-datetime"] = event.currentTime;

      final authUser = await dashboardRepoImpl.getUpComingMovies(requestData);
      emit(authUser == null
          ? GetUpComingMovieFail(errorMessage: "Something went wrong")
          : GetUpComingMovieSuceess(data: authUser));
    } on SocketException {
      errorMessage = "No Internet";
      emit(NoInternetConnectionState());
    } on HttpException {
      errorMessage = "No Service";
    } on FormatException {
      errorMessage = "No Format Exception";
    } catch (e) {
      errorMessage = '${e.toString()}';
      emit(GetUpComingMovieFail(errorMessage: errorMessage));
    }
  }


  FutureOr<void> _determinePosition(getCurrentLocation event,Emitter<DashboardState> emit) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      emit(LocationServiceOffState(error:'Location services are disabled.'));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(LocationDeniedState(error: 'Location permissions are denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(LocationdeniedForeverState(error: 'Location permissions are permanently denied, we cannot request permissions.'));
    }

    emit(LocationSuceessState(position: await Geolocator.getCurrentPosition()));
  }

  FutureOr<void> _getCityName(onGetCityEvent event,Emitter<DashboardState> emit) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(double.parse(event.lat), double.parse(event.long));
    if(placemarks.isNotEmpty){
      emit(GetCitySuceessState(city: placemarks.first.locality));
    }
  }

  FutureOr<void> _closeOpenDrawer(onDrawerOpenCloseEvent event,Emitter<DashboardState> emit) async {
    if(event.scafoldKey.currentState!.isDrawerOpen){
      emit(OnDrawerCloseState());
    }else{
      emit(OnDrawerOpenState());
    }
  }

  FutureOr<void> _closeDrawer(onCloseDrawerEvent event,Emitter<DashboardState> emit) async {
    emit(OnDrawerCloseState());
  }

  FutureOr<void> _openDrawer(onOpenDrawerEvent event,Emitter<DashboardState> emit) async {
    emit(OnDrawerOpenState());
  }
}