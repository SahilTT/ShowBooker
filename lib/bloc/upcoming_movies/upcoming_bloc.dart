
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/runing_movies_response.dart';
import '../../repository/dashboard/dashboard_repo_impl.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {

  final dashboardRepoImpl=DashboardRepoImpl();

  UpcomingBloc() : super(UpcomingInitial()) {
    on<onGetUpComingMoviesEvent>(_getUpComingMovie);
    on<onDrawerOpenCloseEvent>(_closeOpenDrawer);
    on<onOpenDrawerEvent>(_openDrawer);
    on<onCloseDrawerEvent>(_closeDrawer);
  }

  FutureOr<void> _getUpComingMovie(onGetUpComingMoviesEvent event, Emitter<UpcomingState> emit) async {
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

  FutureOr<void> _closeOpenDrawer(onDrawerOpenCloseEvent event,Emitter<UpcomingState> emit) async {
    if(event.scafoldKey.currentState!.isDrawerOpen){
      emit(OnDrawerCloseState());
    }else{
      emit(OnDrawerOpenState());
    }
  }

  FutureOr<void> _closeDrawer(onCloseDrawerEvent event,Emitter<UpcomingState> emit) async {
    emit(OnDrawerCloseState());
  }

  FutureOr<void> _openDrawer(onOpenDrawerEvent event,Emitter<UpcomingState> emit) async {
    emit(OnDrawerOpenState());
  }
}