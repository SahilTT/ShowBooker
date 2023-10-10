import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_booker/bloc/dashboard/dashboard_bloc.dart';
import 'package:show_booker/bloc/film_shows/film_shows_bloc.dart';
import 'package:show_booker/ui/dashboard_screen.dart';
import 'package:show_booker/ui/film_detail_screen.dart';
import 'package:show_booker/ui/film_shows_screen.dart';
import 'package:show_booker/ui/nearby_cinema_screen.dart';
import 'package:show_booker/ui/webveiw_screen.dart';

import '../bloc/cinema_detail/cinema_detail_bloc.dart';
import '../bloc/film_detail/film_detail_bloc.dart';
import '../bloc/nearby_cinemas/nearby_cinema_bloc.dart';
import '../ui/cinema_detail_screen.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case FilmDetailScreen.id:
        final arg = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) =>
          BlocProvider<FilmDetailBloc>.value(
            value: FilmDetailBloc(),
            child: FilmDetailScreen(
              lat: arg['lat'].toString(),
              long: arg['long'],
              filmID: arg['filmID'],
            ),
          ),
        );
      case DashboardScreen.id:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<DashboardBloc>.value(
            value: DashboardBloc(),
            child: DashboardScreen(),
          ),
        );
      case NearbyCinemaScreen.id:
        final arg = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<NearbyCinemaBloc>.value(
            value: NearbyCinemaBloc(),
            child: NearbyCinemaScreen(
                lat: arg['lat'].toString(), long: arg['long']),
          ),
        );
      case CinemaDetailScreen.id:
        final arg = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CinemaDetailBloc>.value(
            value: CinemaDetailBloc(),
            child: CinemaDetailScreen(
              lat: arg['lat'].toString(),
              long: arg['long'],
              cinemaID: arg['cinemaID'],
            ),
          ),
        );
      case FilmShowScreen.id:
        final arg = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<FilmShowsBloc>.value(
            value: FilmShowsBloc(),
            child: FilmShowScreen(
              lat: arg['lat'].toString(),
              long: arg['long'],
              filmID: arg['filmID'],
              date: arg['date'],
            ),
          ),
        );
      case WebviewScreen.id:
        final arg = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) {
            return WebviewScreen(url: arg['url'].toString());
          },
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Error',
          ),
        ),
        body: const Center(
          child: Text(
            'Error while loading new page',
          ),
        ),
      );
    });
  }
}
