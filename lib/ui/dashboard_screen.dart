
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:show_booker/bloc/dashboard/dashboard_bloc.dart';
import 'package:show_booker/data/remote/network/ApiEndPoints.dart';
import 'package:show_booker/list_item/movies_list_item.dart';
import 'package:show_booker/list_item/releaseing_movies_list_item.dart';
import 'package:show_booker/res/app_context_extension.dart';
import 'package:show_booker/ui/running_movies_screen.dart';
import 'package:show_booker/ui/upcoming_movie_screen.dart';
import 'package:show_booker/utils/Utils.dart';
import 'package:show_booker/utils/responsive.dart';
import 'package:show_booker/widgets/drawer_menu.dart';

import '../enums/drawer_item_action.dart';
import '../models/runing_movies_response.dart';
import '../utils/custom_progress_dialog.dart';
import '../widgets/lottie_progress_animation_widget.dart';
import 'film_detail_screen.dart';
import 'nearby_cinema_screen.dart';

class DashboardScreen extends StatefulWidget {
  static const String id = "DashboardScreen";

  @override
  State<StatefulWidget> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  String? gLat;
  String? gLong;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  RuningMoviesResponse response = RuningMoviesResponse();
  RuningMoviesResponse responseUpComing = RuningMoviesResponse();
  String? city;
  String? resposeJ;
  bool isRunnigDone = false;
  bool isUpcomingDone = false;

  late CustomProgressDialog pr;

  @override
  Widget build(BuildContext context) {
    pr = CustomProgressDialog(context);

    return BlocListener<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is OnDrawerOpenState) {
        } else if (state is OnDrawerOpenState) {
        } else if (state is InitGetRuningMovie) {
          isRunnigDone = false;
          // if(!pr.isShowing()){
          //   pr.show();
          // }
        } else if (state is GetRuningMovieFail) {
          isRunnigDone = true;
          // checkDoneAndHideProgress();
        } else if (state is GetRuningMovieSuceess) {
          response = state.data!;
          isRunnigDone = true;
          // checkDoneAndHideProgress();
        } else if (state is InitGetUpComingMovie) {
          isUpcomingDone = false;
          // if(!pr.isShowing()){
          //   pr.show();
          // }
        } else if (state is GetUpComingMovieFail) {
          print("Error at upcoming movie is ${state.errorMessage}");
          isUpcomingDone = true;
          // checkDoneAndHideProgress();
        } else if (state is GetUpComingMovieSuceess) {
          responseUpComing = state.data!;
          isUpcomingDone = true;
          // checkDoneAndHideProgress();
        } else if (state is LocationServiceOffState) {
          print("error: ${state.error}");
        } else if (state is LocationDeniedState) {
          print("error: ${state.error}");
        } else if (state is LocationdeniedForeverState) {
          print("error: ${state.error}");
        } else if (state is LocationSuceessState) {
          // if(!pr.isShowing()){
          //   pr.show();
          // }

          String? lat = state.position?.latitude.toString();
          String? long = state.position?.longitude.toString();
          String currentTime = Utils().getCurrentTimeFormatted();

          print("lat $lat : long $long time $currentTime");
          String currentLocation = ApiEndPoints.geolocation.isEmpty
              ? "$lat;$long"
              : ApiEndPoints.geolocation;

          gLat = lat;
          gLong = long;

          BlocProvider.of<DashboardBloc>(context)
              .add(onGetRuningMoviesEvent(currentTime, currentLocation));

          BlocProvider.of<DashboardBloc>(context)
              .add(onGetUpComingMoviesEvent(currentTime, currentLocation));

          BlocProvider.of<DashboardBloc>(context)
              .add(onGetCityEvent(lat!, long!));
        } else if (state is GetCitySuceessState) {
          print("city ${state.city}");
          city = state.city;
        } else if (state is NoInternetConnectionState) {}
      },
      child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (contextLogin, state) {
        if (state is OnDrawerOpenState) {
          scaffoldKey.currentState!.openDrawer();
        } else if (state is OnDrawerOpenState) {
          scaffoldKey.currentState!.closeDrawer();
        } else if (state is InitGetRuningMovie) {
          isRunnigDone = false;
        } else if (state is GetRuningMovieFail) {
          isRunnigDone = true;
        } else if (state is GetRuningMovieSuceess) {
          isRunnigDone = true;
        } else if (state is InitGetUpComingMovie) {
          isUpcomingDone = false;
        } else if (state is GetUpComingMovieFail) {
          isUpcomingDone = true;
        } else if (state is GetUpComingMovieSuceess) {
          isUpcomingDone = true;
        } else if (state is LocationServiceOffState) {
        } else if (state is LocationDeniedState) {
        } else if (state is LocationdeniedForeverState) {
        } else if (state is LocationSuceessState) {
        } else if (state is NoInternetConnectionState) {}
        return mainUi(context);
      }),
    );
  }

  void handleItemSelected(DrawerItemAction action) {
    // Perform the corresponding action based on the selected item
    switch (action) {
      case DrawerItemAction.Dashboard:
        // context.pushReplacementNamed(DashboardScreen.id);
        break;
      case DrawerItemAction.NowShowing:
        print("clicked on running movie");

        context.pushNamed(RunningMovieScreen.id,
            queryParameters: {'lat': gLat, 'long': gLong});
        break;
      case DrawerItemAction.Upcoming:
        // Handle item 3 click
        print("clicked on upcoming movie");
        context.pushNamed(UpcomingMovieScreen.id,
            queryParameters: {'lat': gLat, 'long': gLong});

        break;
      case DrawerItemAction.NearByCinema:
        print("clicked on Nearby cinema");
        context.pushNamed(NearbyCinemaScreen.id,
            queryParameters: {'lat': gLat, 'long': gLong});

        break;
    }
  }

  void checkDoneAndHideProgress() {
    if (isRunnigDone && isUpcomingDone) {
      if (pr.isShowing()) {
        pr.hide();
      }
    }
  }

  Widget mainUi(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: (MediaQuery.of(context).size.width > 750)
          ? null
          : DrawerMenu(
              onItemSelected: handleItemSelected,
              seletedIndex: DrawerItemAction.Dashboard.index,
            ),
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              if (MediaQuery.of(context).size.width > 750)
                Expanded(
                  child: DrawerMenu(
                    onItemSelected: handleItemSelected,
                    seletedIndex: DrawerItemAction.Dashboard.index,
                  ),
                ),
              if (isRunnigDone && isUpcomingDone)
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

                            RunigMoviesList(context),

                            const SizedBox(
                              height: 20.0,
                            ),

                            UpcomingMoviesList(context),

                            // if(!isRunnigDone || !isUpcomingDone)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              if (!isRunnigDone || !isUpcomingDone)
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
                  BlocProvider.of<DashboardBloc>(context)
                      .add(onCloseDrawerEvent());
                } else {
                  // scaffoldKey.currentState!.openDrawer();
                  BlocProvider.of<DashboardBloc>(context)
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
        Expanded(
          flex: 2,
          child: Material(
            borderRadius: BorderRadius.circular(6),
            elevation: 2.0,
            child: Container(
              decoration: BoxDecoration(
                  color: context.resources.color.colorSecondaryText,
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Seacrch Movie or location..",
                    hintStyle: TextStyle(
                        color: context.resources.color.colorInactiveText,
                        fontSize: 16,
                        fontFamily: context.resources.font.josefinSans,
                        fontWeight: FontWeight.w400),
                    border: InputBorder.none,
                    prefixIconColor: context.resources.color.colorInactiveText),
                style: TextStyle(
                    color: context.resources.color.colorInactiveText,
                    fontSize: 18,
                    fontFamily: context.resources.font.josefinSans,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        if (Responsive.isDesktop(context)) Expanded(child: Container()),
        const SizedBox(
          width: 4.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: context.resources.color.colorAccentBg, width: 2.0),
                  borderRadius: const BorderRadius.all(Radius.circular(6.0))),
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      // Show location selection popup
                    },
                    icon: Icon(
                      Icons.location_pin,
                      color: context.resources.color.colorAccentBg,
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    Text(
                      city ?? "Select City..",
                      style: TextStyle(
                          color: context.resources.color.colorPrimaryText,
                          fontSize: 16,
                          fontFamily: context.resources.font.josefinSans,
                          fontWeight: FontWeight.w400),
                    ),
                  if (!Responsive.isMobile(context))
                    IconButton(
                      onPressed: () {
                        // Show location selection popup
                      },
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: context.resources.color.colorAccentBg,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              width: 2.0,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: context.resources.color.colorAccentBg,
                  borderRadius: const BorderRadius.all(Radius.circular(6.0))),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent),
                child: Text(
                  "SignUp",
                  style: TextStyle(
                      color: context.resources.color.colorSecondaryText,
                      fontSize: 16,
                      fontFamily: context.resources.font.josefinSans,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              width: 2.0,
            ),
            if (!Responsive.isMobile(context))
              const SizedBox(
                width: 8.0,
              ),
          ],
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
          Container(
            height: 320,
            child: ListView.builder(
              shrinkWrap: true,
              controller: controller,
              itemCount: response.films?.length,
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                if (response.films != null) {
                  return MoviesListItem(
                      onCliCk: (filmID) {
                        context.goNamed(FilmDetailScreen.id,
                            pathParameters: {'filmId': filmID!},
                            queryParameters: {'lat': gLat, 'long': gLong});
                      },
                      data: response.films![index]);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

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
          Container(
            height: 320,
            alignment: Alignment.centerLeft,
            child: ScrollConfiguration(
              behavior: MyCustomScrollBehavior(),
              child: ListView.builder(
                shrinkWrap: true,
                controller: controller,
                itemCount: responseUpComing.films?.length,
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  if (responseUpComing.films != null &&
                      responseUpComing.films?[index].images?.poster != null) {
                    return ReleaseingMoviesListItem(
                        onCliCk: () {}, data: responseUpComing.films![index]);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardBloc>(context).add(getCurrentLocation(context));
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

// class MyImage extends StatelessWidget {
//   String imageUrl;
//
//   MyImage(this.imageUrl);
//
//   @override
//   Widget build(BuildContext context) {
//     // ignore: undefined_prefixed_name
//     ui.platformViewRegistry.registerViewFactory(
//       imageUrl,
//       (int _) => ImageElement()..src = imageUrl,
//     );
//     return HtmlElementView(
//       viewType: imageUrl,
//     );
//   }
// }
