import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:show_booker/res/app_context_extension.dart';

import '../bloc/running/running_bloc.dart';
import '../data/remote/network/ApiEndPoints.dart';
import '../enums/drawer_item_action.dart';
import '../list_item/movies_list_item.dart';
import '../models/runing_movies_response.dart';
import '../utils/Utils.dart';
import '../utils/responsive.dart';
import '../widgets/drawer_menu.dart';
import '../widgets/lottie_progress_animation_widget.dart';
import 'dashboard_screen.dart';
import 'film_detail_screen.dart';
import 'nearby_cinema_screen.dart';
import 'upcoming_movie_screen.dart';

class RunningMovieScreen extends StatefulWidget {
  static const String id = "RunningMovieScreen";

  String? lat;
  String? long;


  RunningMovieScreen({super.key, this.lat, this.long});

  @override
  State<StatefulWidget> createState() => RunningMovieScreenState(lat,long);
}

class RunningMovieScreenState extends State<RunningMovieScreen> {
  String? lat;
  String? long;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  RuningMoviesResponse response = RuningMoviesResponse();

  bool isReponsed = false;

  RunningMovieScreenState(this.lat, this.long,);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RunningBloc, RunningState>(
      listener: (context, state) {
        if (state is OnDrawerOpenState) {
        } else if (state is OnDrawerOpenState) {
        } else if (state is InitGetRuningMovie) {
          print("Get Runing Movie begun");
        } else if (state is GetRuningMovieFail) {
          print("Error at runing movie is ${state.errorMessage}");
        } else if (state is GetRuningMovieSuceess) {
          response = state.data!;
          isReponsed=true;
        }else if (state is NoInternetConnectionState) {}
      },
      child: BlocBuilder<RunningBloc, RunningState>(
          builder: (contextLogin, state) {
        if (state is OnDrawerOpenState) {
          scaffoldKey.currentState!.openDrawer();
        } else if (state is OnDrawerOpenState) {
          scaffoldKey.currentState!.closeDrawer();
        } else if (state is InitGetRuningMovie) {
        } else if (state is GetRuningMovieFail) {
        } else if (state is GetRuningMovieSuceess) {
        } else if (state is NoInternetConnectionState) {}
        return mainUi(context);
      }),
    );
  }


  void handleItemSelected(DrawerItemAction action) {
    // Perform the corresponding action based on the selected item
    switch (action) {
      case DrawerItemAction.Dashboard:
        context.pushReplacementNamed(DashboardScreen.id);
        break;
      case DrawerItemAction.NowShowing:
        print("clicked on running movie");

        break;
      case DrawerItemAction.Upcoming:
      // Handle item 3 click
        print("clicked on upcoming movie");
        context.pushNamed(UpcomingMovieScreen.id,
            queryParameters: {'lat': lat, 'long': long});

        break;
      case DrawerItemAction.NearByCinema:
        print("clicked on Nearby cinema");
        context.pushNamed(NearbyCinemaScreen.id,
            queryParameters: {'lat': lat, 'long': long});

        break;
    }
  }


  Widget mainUi(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: (MediaQuery.of(context).size.width > 750)
          ? null
          : DrawerMenu(onItemSelected: handleItemSelected,seletedIndex: DrawerItemAction.NowShowing.index,),
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              if (MediaQuery.of(context).size.width > 750)
                Expanded(
                  child: DrawerMenu(onItemSelected: handleItemSelected,seletedIndex: DrawerItemAction.NowShowing.index,),
                ),

              if(isReponsed)
              Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                      color: context.resources.color.colorPrimaryBg),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          const SizedBox(
                            height: 6.0,
                          ),

                          AppBarMenu(context),

                          const SizedBox(
                            height: 20.0,
                          ),

                          // PageWidget(context),
                          if(isReponsed)
                          RunigMoviesList(context),

                        ],
                      ),
                    ),
                  ),
                ),
              ),

              if (!isReponsed)
                Expanded(
                  flex: 4,
                  child: LottieProgressAnimationWidget(),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget AppBarMenu(BuildContext context) {
    return Row(
      children: [
        if (MediaQuery.of(context).size.width <= 750)
          IconButton(
              onPressed: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  //close drawer, if drawer is open
                  BlocProvider.of<RunningBloc>(context)
                      .add(onCloseDrawerEvent());
                } else {
                  // scaffoldKey.currentState!.openDrawer();
                  BlocProvider.of<RunningBloc>(context)
                      .add(onOpenDrawerEvent());
                  //open drawer, if drawer is closed
                }
              },
              icon: Icon(
                Icons.menu,
                color: context.resources.color.colorAccentBg,
              )),
        if (!Responsive.isMobile(context))
          const SizedBox(
            width: 8.0,
          ),

      ],
    );
  }

  final ScrollController controller = ScrollController();

  Widget RunigMoviesList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [

          const SizedBox(
            height: 20,
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 8),
              child: Text(
                "Movies Runing Now ",
                style: TextStyle(
                    fontFamily: context.resources.font.josefinSans,
                    fontSize: context.resources.dimension.extraBigText,
                    color: context.resources.color.colorPrimaryText,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),

          const SizedBox(
            height: 12,
          ),

          if(response.films!.isNotEmpty)
          Wrap(
            alignment: WrapAlignment.start,
            children: response.films!.map((e) {
              return Container(
                height: 320,
                padding: EdgeInsets.all(4.0),
                child: MoviesListItem(
                    onCliCk: (filmID) {
                      context.goNamed(FilmDetailScreen.id,
                          pathParameters: {'filmId': filmID!},
                          queryParameters: {'lat': lat, 'long': long});
                    },
                    data: e),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    String currentTime = Utils().getCurrentTimeFormatted();

    print("lat $lat : long $long time $currentTime");
    String currentLocation = ApiEndPoints.geolocation.isEmpty
        ? "$lat;$long"
        : ApiEndPoints.geolocation;

    BlocProvider.of<RunningBloc>(context)
        .add(onGetRuningMoviesEvent(currentTime, currentLocation));
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}