
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/runing_movies_response.dart';
import '../../repository/dashboard/dashboard_repo_impl.dart';

part 'runnning_event.dart';
part 'running_state.dart';

class RunningBloc extends Bloc<RunningEvent, RunningState> {

  final dashboardRepoImpl=DashboardRepoImpl();

  RunningBloc() : super(RunningStateInitial()) {
    on<onGetRuningMoviesEvent>(_getRuningMovie);
    on<onDrawerOpenCloseEvent>(_closeOpenDrawer);
    on<onOpenDrawerEvent>(_openDrawer);
    on<onCloseDrawerEvent>(_closeDrawer);
  }

  FutureOr<void> _getRuningMovie(onGetRuningMoviesEvent event, Emitter<RunningState> emit) async {
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

  FutureOr<void> _closeOpenDrawer(onDrawerOpenCloseEvent event,Emitter<RunningState> emit) async {
    if(event.scafoldKey.currentState!.isDrawerOpen){
      emit(OnDrawerCloseState());
    }else{
      emit(OnDrawerOpenState());
    }
  }

  FutureOr<void> _closeDrawer(onCloseDrawerEvent event,Emitter<RunningState> emit) async {
    emit(OnDrawerCloseState());
  }

  FutureOr<void> _openDrawer(onOpenDrawerEvent event,Emitter<RunningState> emit) async {
    emit(OnDrawerOpenState());
  }
}