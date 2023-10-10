import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:show_booker/models/cinema_detail_respons.dart';
import 'package:show_booker/models/cinema_shows_response.dart';
import 'package:show_booker/models/purchase_confirmation_response.dart';
import 'package:show_booker/repository/cinema_detail/cinema_detail_repo_impl.dart';

part 'cinema_detail_event.dart';
part 'cinema_detail_state.dart';

class CinemaDetailBloc extends Bloc<CinemaDetailEvent, CinemaDetailState> {
  final cinemaDetailRepoImpl=CinemaDetailRepoImpl();

  CinemaDetailBloc() : super(CinemaDetailInitial()) {
    on<onGetCinemaDetailEvent>(_getCinemaDetail);
    on<onDrawerOpenCloseEvent>(_closeOpenDrawer);
    on<onOpenDrawerEvent>(_openDrawer);
    on<onCloseDrawerEvent>(_closeDrawer);
    on<onGetCinemaShowsEvent>(_getCinemaShows);
    on<onDateSelectEvent>(_onDateSelect);
    on<onPurchaceEvent>(_onPurchaseConfirm);

  }
  
  FutureOr<void> _getCinemaDetail(onGetCinemaDetailEvent event, Emitter<CinemaDetailState> emit) async {
    String errorMessage = "Internal server error";
    emit(InitGetCinemaDetailState());
    try {
      Map<String,String> requestData = Map();
      requestData["geolocation"] = event.currentlocation;
      requestData["device-datetime"] = event.currentTime;

      final authUser = await cinemaDetailRepoImpl.getCinemaDetail(requestData,event.cinemaID);
      emit(authUser == null
          ? GetCinemaDetailFailState(errorMessage: "Something went wrong")
          : GetCinemaDetailSuceessState(data: authUser));
    } on SocketException {
      errorMessage = "No Internet";
      emit(NoInternetConnectionState());
    } on HttpException {
      errorMessage = "No Service";
    } on FormatException {
      errorMessage = "No Format Exception";
    } catch (e) {
      errorMessage = '${e.toString()}';
      emit(GetCinemaDetailFailState(errorMessage: errorMessage));
    }
  }

  FutureOr<void> _getCinemaShows(onGetCinemaShowsEvent event, Emitter<CinemaDetailState> emit) async {
    String errorMessage = "Internal server error";
    emit(InitGetCinemaShowState());
    emit(onDateSlectState(date:event.date));
    try {
      Map<String,String> requestData = Map();
      requestData["geolocation"] = event.currentlocation;
      requestData["device-datetime"] = event.currentTime;

      final authUser = await cinemaDetailRepoImpl.getCinemaShows(requestData,event.cinemaID,event.date);

      emit(authUser == null
          ? GetCinemaShowFailState(errorMessage: "Something went wrong")
          : GetCinemaShowSuceessState(data: authUser));
    } on SocketException {
      errorMessage = "No Internet";
      emit(NoInternetConnectionState());
    } on HttpException {
      errorMessage = "No Service";
    } on FormatException {
      errorMessage = "No Format Exception";
    } catch (e) {
      errorMessage = '${e.toString()}';
      emit(GetCinemaShowFailState(errorMessage: errorMessage));
    }
  }

  FutureOr<void> _onPurchaseConfirm(onPurchaceEvent event, Emitter<CinemaDetailState> emit) async {
    String errorMessage = "Internal server error";
    emit(InitPurchaseTicketState());
    try {
      Map<String,String> requestData = Map();
      requestData["geolocation"] = event.currentlocation;
      requestData["device-datetime"] = event.currentTime;

      final authUser = await cinemaDetailRepoImpl.getPurchaseConfirmation(requestData,event.cinemID,event.filmID,event.date,event.time);

      emit(authUser == null
          ? GetPurchaseTicketFailState(errorMessage: "Something went wrong")
          : GetPurchaseTicketSuceessState(data: authUser));
    } on SocketException {
      errorMessage = "No Internet";
      emit(NoInternetConnectionState());
    } on HttpException {
      errorMessage = "No Service";
    } on FormatException {
      errorMessage = "No Format Exception";
    } catch (e) {
      errorMessage = '${e.toString()}';
      emit(GetPurchaseTicketFailState(errorMessage: errorMessage));
    }
  }

  FutureOr<void> _closeOpenDrawer(onDrawerOpenCloseEvent event,Emitter<CinemaDetailState> emit) async {
    if(event.scafoldKey.currentState!.isDrawerOpen){
      emit(OnDrawerCloseState());
    }else{
      emit(OnDrawerOpenState());
    }
  }

  FutureOr<void> _closeDrawer(onCloseDrawerEvent event,Emitter<CinemaDetailState> emit) async {
    emit(OnDrawerCloseState());
  }

  FutureOr<void> _openDrawer(onOpenDrawerEvent event,Emitter<CinemaDetailState> emit) async {
    emit(OnDrawerOpenState());
  }

  FutureOr<void> _onDateSelect(onDateSelectEvent event,Emitter<CinemaDetailState> emit){
    emit(onDateSlectState(date: event.date));
  }

}
