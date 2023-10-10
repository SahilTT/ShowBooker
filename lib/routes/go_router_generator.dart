import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:show_booker/bloc/cinema_detail/cinema_detail_bloc.dart';
import 'package:show_booker/bloc/dashboard/dashboard_bloc.dart';
import 'package:show_booker/bloc/film_shows/film_shows_bloc.dart';
import 'package:show_booker/bloc/nearby_cinemas/nearby_cinema_bloc.dart';
import 'package:show_booker/ui/cinema_detail_screen.dart';
import 'package:show_booker/ui/dashboard_screen.dart';
import 'package:show_booker/ui/error_screen.dart';
import 'package:show_booker/ui/film_detail_screen.dart';
import 'package:show_booker/ui/film_shows_screen.dart';
import 'package:show_booker/ui/nearby_cinema_screen.dart';
import '../bloc/film_detail/film_detail_bloc.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final gorouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => ErrorScreen(),
  routes: [
    GoRoute(
        path: '/',
        name: DashboardScreen.id,
        builder: (context, state) => BlocProvider<DashboardBloc>(
              create: (context) => DashboardBloc(),
              child: DashboardScreen(),
            ),
        routes: [
          GoRoute(
            path: 'filmDetail/:filmId',
            name: FilmDetailScreen.id,
            builder: (context, state) => BlocProvider<FilmDetailBloc>(
              create: (context) => FilmDetailBloc(),
              child: FilmDetailScreen(
                lat: state.uri.queryParameters['lat'],
                long: state.uri.queryParameters['long'],
                filmID: state.pathParameters['filmId'],
              ),
            ),
          ),
          GoRoute(
              path: 'filmShows/:date',
              name: FilmShowScreen.id,
              builder: (context, state) => BlocProvider<FilmShowsBloc>(
                    create: (context) => FilmShowsBloc(),
                    child: FilmShowScreen(
                      lat: state.uri.queryParameters['lat'],
                      long: state.uri.queryParameters['long'],
                      filmID: state.uri.queryParameters['filmId'],
                      date: state.pathParameters['date'],
                    ),
                  ))
        ]),

    // GoRoute(
    //     path: '/',
    //     name: DashboardScreen.id,
    //     builder: (context, state) => BlocProvider<DashboardBloc>(
    //           create: (context) => DashboardBloc(),
    //           child: DashboardScreen(),
    //         ),
    //     routes: [
    //       GoRoute(
    //           path: 'filmDetail/:filmId',
    //           name: FilmDetailScreen.id,
    //           builder: (context, state) => BlocProvider<FilmDetailBloc>(
    //                 create:(context) => FilmDetailBloc(),
    //                 child: FilmDetailScreen(
    //                   lat: state.uri.queryParameters['lat'],
    //                   long: state.uri.queryParameters['long'],
    //                   filmID: state.pathParameters['filmId'],
    //                 ),
    //               ),
    //           ),
    //       GoRoute(
    //           path: 'filmShows/:date',
    //           name: FilmShowScreen.id,
    //           builder: (context, state) =>
    //               BlocProvider<FilmShowsBloc>(
    //                 create:(context)=> FilmShowsBloc(),
    //                 child: FilmShowScreen(
    //                   lat: state.uri.queryParameters['lat'],
    //                   long: state.uri.queryParameters['long'],
    //                   filmID: state.uri.queryParameters['filmId'],
    //                   date: state.pathParameters['date'],
    //                 ),
    //               )
    //       )
    //     ]),

    GoRoute(
        path: "/NearbyCinemas",
        name: NearbyCinemaScreen.id,
        builder: (context, state) => BlocProvider<NearbyCinemaBloc>(
            create: (context) => NearbyCinemaBloc(),
            child: NearbyCinemaScreen(
              lat: state.uri.queryParameters['lat'],
              long: state.uri.queryParameters['long'],
            )),
        routes: [
          GoRoute(
            path: "cinema/:cinemaId",
            name: CinemaDetailScreen.id,
            builder: (context, state) => BlocProvider<CinemaDetailBloc>(
              create: (context) => CinemaDetailBloc(),
              child: CinemaDetailScreen(
                lat: state.uri.queryParameters['lat'],
                long: state.uri.queryParameters['long'],
                cinemaID: state.pathParameters['cinemaId'],
              ),
            ),
          )
        ])
  ],
);
