import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:show_booker/res/app_context_extension.dart';

import '../bloc/upcoming_movies/upcoming_bloc.dart';
import '../data/remote/network/ApiEndPoints.dart';
import '../enums/drawer_item_action.dart';
import '../list_item/releaseing_movies_list_item.dart';
import '../models/runing_movies_response.dart';
import '../utils/Utils.dart';
import '../utils/responsive.dart';
import '../widgets/drawer_menu.dart';
import '../widgets/lottie_progress_animation_widget.dart';
import 'dashboard_screen.dart';
import 'film_detail_screen.dart';
import 'nearby_cinema_screen.dart';
import 'running_movies_screen.dart';

class UpcomingMovieScreen extends StatefulWidget {
  static const String id = "UpcomingMovieScreen";

  String? lat;
  String? long;

  UpcomingMovieScreen({super.key, this.lat, this.long});

  @override
  State<StatefulWidget> createState() => UpcomingMovieScreenState(lat,long);
}

class UpcomingMovieScreenState extends State<UpcomingMovieScreen> {
  String? lat;
  String? long;
  bool isResponsed=false;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  RuningMoviesResponse _response = RuningMoviesResponse();

  UpcomingMovieScreenState(this.lat, this.long,);

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpcomingBloc, UpcomingState>(
      listener: (context, state) {
        if (state is OnDrawerOpenState) {
        } else if (state is OnDrawerOpenState) {
        } else if (state is InitGetUpComingMovie) {
          print("Get upcoming Movie begun");
          isResponsed=false;

        } else if (state is GetUpComingMovieFail) {
          print("Error at upcoming movie is ${state.errorMessage}");
        } else if (state is GetUpComingMovieSuceess) {
          _response = state.data!;
          isResponsed=true;
        } else if (state is NoInternetConnectionState) {
        }
      },
      child: BlocBuilder<UpcomingBloc, UpcomingState>(
          builder: (contextLogin, state) {
        if (state is OnDrawerOpenState) {
          scaffoldKey.currentState!.openDrawer();
        } else if (state is OnDrawerOpenState) {
          scaffoldKey.currentState!.closeDrawer();
        }  else if (state is GetUpComingMovieFail) {
        } else if (state is GetUpComingMovieSuceess) {
          _response = state.data!;
        }else if (state is NoInternetConnectionState) {}
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

        context.pushNamed(RunningMovieScreen.id,
            queryParameters: {'lat': lat, 'long': long});
        break;
      case DrawerItemAction.Upcoming:
      // Handle item 3 click
        print("clicked on upcoming movie");

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
          :DrawerMenu(onItemSelected: handleItemSelected,seletedIndex: DrawerItemAction.Upcoming.index,),
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              if (MediaQuery.of(context).size.width > 750)
                Expanded(
                  child:DrawerMenu(onItemSelected: handleItemSelected,seletedIndex: DrawerItemAction.Upcoming.index,),
                ),

              if(isResponsed)
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

                          UpcomingMoviesList(context),

                        ],
                      ),
                    ),
                  ),
                ),
              ),

              if(!isResponsed)
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
                  BlocProvider.of<UpcomingBloc>(context)
                      .add(onCloseDrawerEvent());
                } else {
                  // scaffoldKey.currentState!.openDrawer();
                  BlocProvider.of<UpcomingBloc>(context)
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
        
        Expanded(child: Container())
      ],
    );
  }

  final ScrollController controller = ScrollController();

  Widget UpcomingMoviesList(BuildContext context) {
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
                "Movies Coming Soon ",
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

          Wrap(
            alignment: WrapAlignment.start,
            children: _response.films!.map((e) {
              return Container(
                height: 320,
                padding: EdgeInsets.all(4.0),
                child: ReleaseingMoviesListItem(
                    onCliCk: (filmID) {
                      // context.goNamed(FilmDetailScreen.id,
                      //     pathParameters: {'filmId': filmID!},
                      //     queryParameters: {'lat': lat, 'long': long});
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

    BlocProvider.of<UpcomingBloc>(context)
        .add(onGetUpComingMoviesEvent(currentTime, currentLocation));
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

