import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:show_booker/bloc/nearby_cinemas/nearby_cinema_bloc.dart';
import 'package:show_booker/list_item/cinema_item.dart';
import 'package:show_booker/models/nearby_cineam_response.dart';

import 'package:show_booker/res/app_context_extension.dart';
import 'package:show_booker/utils/responsive.dart';
import 'package:show_booker/widgets/drawer_menu.dart';

import '../data/remote/network/ApiEndPoints.dart';
import '../enums/drawer_item_action.dart';
import '../utils/Utils.dart';
import 'cinema_detail_screen.dart';

class NearbyCinemaScreen extends StatefulWidget {
  static const String id = "NearByCinema";

  String? lat;
  String? long;

  NearbyCinemaScreen({super.key, this.lat, this.long});

  @override
  State<StatefulWidget> createState() => NearbyCinemaScreenState(lat, long);
}

class NearbyCinemaScreenState extends State<NearbyCinemaScreen> {
  String? gLat;
  String? gLong;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? city;

  String? lat;
  String? long;
  NearByCineamResponse response = NearByCineamResponse();

  NearbyCinemaScreenState(this.lat, this.long);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NearbyCinemaBloc, NearbyCinemaState>(
      listener: (context, state) {
        if (state is InitGetNearByCinemaState) {
        } else if (state is GetNearByCinemaSuceessState) {
          response = state.data!;
        } else if (state is GetNearByCinemaFailState) {
          print("Fail_of_nearby_cinema - ${state.errorMessage}");
        } else if (state is OnDrawerOpenState) {
        } else if (state is OnDrawerCloseState) {
        } else if (state is NoInternetConnectionState) {}
      },
      child: BlocBuilder<NearbyCinemaBloc, NearbyCinemaState>(
          builder: (contextLogin, state) {
        if (state is InitGetNearByCinemaState) {
        } else if (state is GetNearByCinemaSuceessState) {
        } else if (state is GetNearByCinemaFailState) {
        } else if (state is OnDrawerOpenState) {
          scaffoldKey.currentState!.openDrawer();
        } else if (state is OnDrawerOpenState) {
          scaffoldKey.currentState!.closeDrawer();
        } else if (state is NoInternetConnectionState) {}
        return mainUi(context);
      }),
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
        // Handle item 3 click
        break;
    }
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
                          if (response.cinemas != null) CinamaListUi(context),
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
                  BlocProvider.of<NearbyCinemaBloc>(context)
                      .add(onCloseDrawerEvent());
                } else {
                  // scaffoldKey.currentState!.openDrawer();
                  BlocProvider.of<NearbyCinemaBloc>(context)
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

  Widget CinamaListUi(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Wrap(
          children: response.cinemas!.map((e) {
            return CinemaItem(
                onCliCk: (value) {
                  //
                  // Navigator.of(context, rootNavigator: true).pushNamed(CinemaDetailScreen.id,
                  //     arguments: {"lat": lat,"long":long,"cinemaID":value});

                  context.pushNamed(CinemaDetailScreen.id,
                      pathParameters: {"cinemaId": value.toString()},
                      queryParameters: {"lat": lat, "long": long});
                },
                cinemas: e);
          }).toList(),
        ),
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
    BlocProvider.of<NearbyCinemaBloc>(context)
        .add(onGetNearbyCinemaEvent(currentTime, currentLocation));
  }
}
