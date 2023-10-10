import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:show_booker/res/app_context_extension.dart';
import 'package:show_booker/routes/go_router_generator.dart';
import 'package:show_booker/ui/dashboard_screen.dart';

import 'bloc/cinema_detail/cinema_detail_bloc.dart';
import 'bloc/dashboard/dashboard_bloc.dart';
import 'bloc/film_detail/film_detail_bloc.dart';
import 'bloc/film_shows/film_shows_bloc.dart';
import 'bloc/nearby_cinemas/nearby_cinema_bloc.dart';
import 'routes/route_generator.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'ui/cinema_detail_screen.dart';
import 'ui/film_detail_screen.dart';
import 'ui/film_shows_screen.dart';
import 'ui/nearby_cinema_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: context.resources.strings.appName,
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: context.resources.color.colorPrimary)
            .copyWith(secondary: context.resources.color.colorAccent),
      ),
      routerConfig: gorouter,
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}



