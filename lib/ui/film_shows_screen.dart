import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_booker/bloc/film_shows/film_shows_bloc.dart';
import 'package:show_booker/list_item/film_shows_list_item.dart';
import 'package:show_booker/models/film_shows_response.dart';
import 'package:show_booker/res/app_context_extension.dart';
import 'package:show_booker/widgets/booking_confirmation_bottom_sheet.dart';

import '../data/remote/network/ApiEndPoints.dart';
import '../enums/drawer_item_action.dart';
import '../utils/Utils.dart';
import '../utils/responsive.dart';
import '../widgets/drawer_menu.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class FilmShowScreen extends StatefulWidget {
  static const String id = "FilmShowsScreen";

  String? lat;
  String? long;
  String? filmID;
  String? date;

  FilmShowScreen({super.key, this.lat, this.long, this.filmID, this.date});

  @override
  State<StatefulWidget> createState() => FilmShowScreenState(lat, long, filmID, date);
}

class FilmShowScreenState extends State<FilmShowScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  FilmShowsResponse response = FilmShowsResponse();
  List<Cinemas> cinemaList = <Cinemas>[];

  String? lat;
  String? long;
  String? filmID;
  String? date;

  FilmShowScreenState(this.lat, this.long, this.filmID, this.date);

  @override
  void initState() {
    super.initState();
    String currentTime = Utils().getCurrentTimeFormatted();
    print("lat $lat : long $long time $currentTime");
    String currentLocation = ApiEndPoints.geolocation.isEmpty
        ? "$lat;$long"
        : ApiEndPoints.geolocation;
    BlocProvider.of<FilmShowsBloc>(context).add(
        onGetMovieShowsEvent(currentTime, currentLocation, filmID!, date!));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FilmShowsBloc, FilmShowsState>(
      listener: (context, state) {
        if (state is InitGetMovieShowsState) {
        } else if (state is GetMovieShowsSuceessState) {
          response = state.data!;

          if (response.cinemas != null) {
            for (int i = 0; i < response.cinemas!.length; i++) {
              cinemaList.add(response.cinemas![i]);
            }
          }
        } else if (state is GetMovieShowsFailState) {
          print("Fail_of_film_Detail -${state.errorMessage}");
        } else if (state is OnDrawerOpenState) {
        } else if (state is OnDrawerCloseState) {
        } else if (state is InitPurchaseTicketState) {
        } else if (state is GetPurchaseTicketFailState) {
          print("Fail_of_purchase_confirmation -${state.errorMessage}");
        } else if (state is GetPurchaseTicketSuceessState) {
          if (state.data?.url != null) {
            html.window.open(state.data!.url!, "_self");
          }
        } else if (state is NoInternetConnectionState) {}
      },
      child: BlocBuilder<FilmShowsBloc, FilmShowsState>(
          builder: (contextLogin, state) {
        if (state is InitGetMovieShowsState) {
        } else if (state is GetMovieShowsSuceessState) {
        } else if (state is GetMovieShowsFailState) {
        } else if (state is OnDrawerOpenState) {
          scaffoldKey.currentState!.openDrawer();
        } else if (state is OnDrawerOpenState) {
          scaffoldKey.currentState!.closeDrawer();
        } else if (state is NoInternetConnectionState) {}
        return mainUi(context);
      }),
    );
  }

  Widget mainUi(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: (MediaQuery.of(context).size.width > 750)
          ? null
          : DrawerMenu(
              onItemSelected: handleItemSelected,
            ),
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              if (MediaQuery.of(context).size.width > 750)
                Expanded(
                  child: DrawerMenu(
                    onItemSelected: handleItemSelected,
                  ),
                ),
              Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                      color: context.resources.color.colorPriperyBg),
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
                            height: 12.0,
                          ),
                          MoviesCinemaListing(context)
                        ],
                      ),
                    ),
                  ),
                ),
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
                  BlocProvider.of<FilmShowsBloc>(context)
                      .add(onCloseDrawerEvent());
                } else {
                  //close drawer, if drawer is open
                  BlocProvider.of<FilmShowsBloc>(context)
                      .add(onOpenDrawerEvent());
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
                      "Select City..",
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

  Widget MoviesCinemaListing(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            response.film?.filmName.toString() ?? "",
            style: TextStyle(
                fontFamily: context.resources.font.josefinSans,
                fontSize: context.resources.dimension.avatarText,
                color: context.resources.color.colorAccentBg,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(
            response.film?.versionType.toString() ?? "",
            style: TextStyle(
                fontFamily: context.resources.font.josefinSans,
                fontSize: context.resources.dimension.bigText,
                color: context.resources.color.colorAccentBg,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 4.0,
          ),
          Row(
            children: [
              Text(
                response.film?.ageRating?.first.rating ?? "",
                style: TextStyle(
                    fontFamily: context.resources.font.josefinSans,
                    fontSize: context.resources.dimension.smallMediumText,
                    color: context.resources.color.colorAccentBg,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                width: 4.0,
              ),
              Text(
                ".",
                style: TextStyle(
                    fontFamily: context.resources.font.josefinSans,
                    fontSize: context.resources.dimension.mediumText,
                    color: context.resources.color.colorAccentBg,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                width: 4.0,
              ),
              Text(
                response.film?.ageRating?.first.ageAdvisory ?? "",
                style: TextStyle(
                    fontFamily: context.resources.font.josefinSans,
                    fontSize: context.resources.dimension.smallMediumText,
                    color: context.resources.color.colorAccentBg,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 8.0, bottom: 2.0),
            child: Text(
              "$date>" ?? "",
              style: TextStyle(
                  fontFamily: context.resources.font.josefinSans,
                  fontSize: context.resources.dimension.smallText,
                  fontWeight: FontWeight.w500,
                  color: context.resources.color.colorAccentBg),
            ),
          ),
          if (cinemaList.isNotEmpty)
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cinemaList.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return FilmShowListItem(
                        cinema: cinemaList[index],
                        onCliCk: (value) {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return BookingConfirmationBottomSheet(
                                  filmName: response.film!.filmName.toString(),
                                  cinemaName: value["cinemaName"],
                                  dateOfShow: date!,
                                  showTiming:
                                      "${Utils().convertToAmPmFormat(value["showTime"])} To ${Utils().convertToAmPmFormat(value["showEndTime"])}",
                                  onCliCk: () {
                                    String currentTime =
                                        Utils().getCurrentTimeFormatted();
                                    print(
                                        "lat $lat : long $long time $currentTime");
                                    String currentLocation =
                                        ApiEndPoints.geolocation.isEmpty
                                            ? "$lat;$long"
                                            : ApiEndPoints.geolocation;

                                    BlocProvider.of<FilmShowsBloc>(this.context)
                                        .add(onPurchaceEvent(
                                            currentTime,
                                            currentLocation,
                                            value["cinemaID"].toString(),
                                            filmID!,
                                            date!,
                                            value["showTime"]));
                                  },
                                );
                              });
                        });
                  }),
            ),
        ],
      ),
    );
  }

  void handleItemSelected(DrawerItemAction action) {
    // Perform the corresponding action based on the selected item
    switch (action) {
      case DrawerItemAction.Dashboard:
        // Handle item 1 click
        break;
      case DrawerItemAction.NowShowing:
        // Handle item 2 click
        break;
      case DrawerItemAction.Upcoming:
        // Handle item 3 click
        break;
      case DrawerItemAction.NearByCinema:
        break;
    }
  }
}
