import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:show_booker/models/nearby_cineam_response.dart';

import '../../repository/nearby_cinema/nearby_cinema_repo_impl.dart';

part 'nearby_cinema_event.dart';
part 'nearby_cinema_state.dart';

class NearbyCinemaBloc extends Bloc<NearbyCinemaEvent, NearbyCinemaState> {
  final nearbyRepoImpl=NearByCinemaRepoImpl();

  NearbyCinemaBloc() : super(NearbyCinemaInitial()) {
    on<onGetNearbyCinemaEvent>(_getNearbyCinemas);
    on<onDrawerOpenCloseEvent>(_closeOpenDrawer);
    on<onOpenDrawerEvent>(_openDrawer);
    on<onCloseDrawerEvent>(_closeDrawer);
  }

  FutureOr<void> _getNearbyCinemas(onGetNearbyCinemaEvent event, Emitter<NearbyCinemaState> emit) async {
    String errorMessage = "Internal server error";
    emit(InitGetNearByCinemaState());
    try {

      Map<String,String> requestData = Map();
      requestData["geolocation"] = event.currentlocation;
      requestData["device-datetime"] = event.currentTime;

      final authUser = await nearbyRepoImpl.getNearByCinema(requestData);
      emit(authUser == null
          ? GetNearByCinemaFailState(errorMessage: "Something went wrong")
          : GetNearByCinemaSuceessState(data: authUser));
    } on SocketException {
      errorMessage = "No Internet";
      emit(NoInternetConnectionState());
    } on HttpException {
      errorMessage = "No Service";
    } on FormatException {
      errorMessage = "No Format Exception";
    } catch (e) {
      errorMessage = '${e.toString()}';
      emit(GetNearByCinemaFailState(errorMessage: errorMessage));
    }
  }

  FutureOr<void> _closeOpenDrawer(onDrawerOpenCloseEvent event,Emitter<NearbyCinemaState> emit) async {
    if(event.scafoldKey.currentState!.isDrawerOpen){
      emit(OnDrawerCloseState());
    }else{
      emit(OnDrawerOpenState());
    }
  }

  FutureOr<void> _closeDrawer(onCloseDrawerEvent event,Emitter<NearbyCinemaState> emit) async {
    emit(OnDrawerCloseState());
  }

  FutureOr<void> _openDrawer(onOpenDrawerEvent event,Emitter<NearbyCinemaState> emit) async {
    emit(OnDrawerOpenState());
  }
}