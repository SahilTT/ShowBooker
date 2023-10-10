import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:show_booker/models/film_shows_response.dart';
import 'package:show_booker/repository/film_show/film_shows_repo_impl.dart';

import '../../models/purchase_confirmation_response.dart';

part 'film_shows_event.dart';
part 'film_shows_state.dart';

class FilmShowsBloc extends Bloc<FilmShowsEvent, FilmShowsState> {
  final repo=FilmShowsRepoImpl();

  FilmShowsBloc() : super(FilmShowsInitial()) {
    on<onGetMovieShowsEvent>(_getMovieShows);
    on<onDrawerOpenCloseEvent>(_closeOpenDrawer);
    on<onOpenDrawerEvent>(_openDrawer);
    on<onCloseDrawerEvent>(_closeDrawer);
    on<onPurchaceEvent>(_onPurchaseConfirm);
  }

  FutureOr<void> _onPurchaseConfirm(onPurchaceEvent event, Emitter<FilmShowsState> emit) async {
    String errorMessage = "Internal server error";
    emit(InitPurchaseTicketState());
    try {
      Map<String,String> requestData = Map();
      requestData["geolocation"] = event.currentlocation;
      requestData["device-datetime"] = event.currentTime;

      final authUser = await repo.getPurchaseConfirmation(requestData,event.cinemID,event.filmID,event.date,event.time);

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

  FutureOr<void> _getMovieShows(onGetMovieShowsEvent event, Emitter<FilmShowsState> emit) async {
    String errorMessage = "Internal server error";
    emit(InitGetMovieShowsState());
    try {

      Map<String,String> requestData = Map();
      requestData["geolocation"] = event.currentlocation;
      requestData["device-datetime"] = event.currentTime;

      final authUser = await repo.getFilmShows(requestData,event.filmID,event.date);
      emit(authUser == null
          ? GetMovieShowsFailState(errorMessage: "Something went wrong")
          : GetMovieShowsSuceessState(data: authUser));
    } on SocketException {
      errorMessage = "No Internet";
      emit(NoInternetConnectionState());
    } on HttpException {
      errorMessage = "No Service";
    } on FormatException {
      errorMessage = "No Format Exception";
    } catch (e) {
      errorMessage = '${e.toString()}';
      emit(GetMovieShowsFailState(errorMessage: errorMessage));
    }
  }

  FutureOr<void> _closeOpenDrawer(onDrawerOpenCloseEvent event,Emitter<FilmShowsState> emit) async {
    if(event.scafoldKey.currentState!.isDrawerOpen){
      emit(OnDrawerCloseState());
    }else{
      emit(OnDrawerOpenState());
    }
  }

  FutureOr<void> _closeDrawer(onCloseDrawerEvent event,Emitter<FilmShowsState> emit) async {
    emit(OnDrawerCloseState());
  }

  FutureOr<void> _openDrawer(onOpenDrawerEvent event,Emitter<FilmShowsState> emit) async {
    emit(OnDrawerOpenState());
  }
}
