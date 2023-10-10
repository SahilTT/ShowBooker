import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:show_booker/models/film_details_response.dart';
import 'package:show_booker/repository/film_detail/film_detail_repo_impl.dart';

part 'film_detail_event.dart';
part 'film_detail_state.dart';

class FilmDetailBloc extends Bloc<FilmDetailEvent, FilmDetailState> {
  final filmDetailRepoImpl=FilmDetailRepoImpl();

  FilmDetailBloc() : super(FilmDetailInitial()) {
    on<onGetMovieDetailEvent>(_getMovieDetail);
    on<onPageChangeEvent>(_onPageChange);
    on<onDrawerOpenCloseEvent>(_closeOpenDrawer);
    on<onOpenDrawerEvent>(_openDrawer);
    on<onCloseDrawerEvent>(_closeDrawer);
  }
  
  FutureOr<void> _getMovieDetail(onGetMovieDetailEvent event, Emitter<FilmDetailState> emit) async {
    String errorMessage = "Internal server error";
    emit(InitGetMovieDetailState());
    try {

      Map<String,String> requestData = Map();
      requestData["geolocation"] = event.currentlocation;
      requestData["device-datetime"] = event.currentTime;

      final authUser = await filmDetailRepoImpl.getMoviesDetail(requestData,event.filmID);
      emit(authUser == null
          ? GetMovieDetailFailState(errorMessage: "Something went wrong")
          : GetMovieDetailSuceessState(data: authUser));
    } on SocketException {
      errorMessage = "No Internet";
      emit(NoInternetConnectionState());
    } on HttpException {
      errorMessage = "No Service";
    } on FormatException {
      errorMessage = "No Format Exception";
    } catch (e) {
      errorMessage = '${e.toString()}';
      emit(GetMovieDetailFailState(errorMessage: errorMessage));
    }
  }
  
  FutureOr<void> _onPageChange(onPageChangeEvent event, Emitter<FilmDetailState> emit) async {
    emit(OnPageChangeState(index: event.index));
  }

  FutureOr<void> _closeOpenDrawer(onDrawerOpenCloseEvent event,Emitter<FilmDetailState> emit) async {
    if(event.scafoldKey.currentState!.isDrawerOpen){
      emit(OnDrawerCloseState());
    }else{
      emit(OnDrawerOpenState());
    }
  }

  FutureOr<void> _closeDrawer(onCloseDrawerEvent event,Emitter<FilmDetailState> emit) async {
    emit(OnDrawerCloseState());
  }

  FutureOr<void> _openDrawer(onOpenDrawerEvent event,Emitter<FilmDetailState> emit) async {
    emit(OnDrawerOpenState());
  }
}
