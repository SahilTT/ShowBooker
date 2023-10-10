import 'dart:io';

import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_booker/bloc/cinema_detail/cinema_detail_bloc.dart';
import 'package:show_booker/data/remote/network/ApiEndPoints.dart';
import 'package:show_booker/enums/drawer_item_action.dart';
import 'package:show_booker/list_item/cinema_shows_list_item.dart';
import 'package:show_booker/models/cinema_shows_response.dart';
import 'package:show_booker/res/app_context_extension.dart';
import 'package:show_booker/utils/responsive.dart';
import 'package:show_booker/widgets/drawer_menu.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/foundation.dart' show kIsWeb;

import '../models/cinema_detail_respons.dart';
import '../utils/Utils.dart';
import '../widgets/booking_confirmation_bottom_sheet.dart';

class CinemaDetailScreen extends StatefulWidget {
  static const String id = "CinemaDetail";

  String? lat;
  String? long;
  String? cinemaID;

  CinemaDetailScreen({super.key, this.lat, this.long, this.cinemaID});

  @override
  State<StatefulWidget> createState() =>
      CinemaDetailScreenState(lat, long, cinemaID);
}

class CinemaDetailScreenState extends State<CinemaDetailScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String? lat;
  String? long;
  String? cinemaID;

  List<ShowDates> showDatesList = <ShowDates>[];
  List<Films> filmsList = <Films>[];

  String? selectedShowDate = null;

  CinemaDetailRespons respons = CinemaDetailRespons();
  CinemaShowsResponse? cinemaShowsResponse = null;

  CinemaDetailScreenState(this.lat, this.long, this.cinemaID);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CinemaDetailBloc, CinemaDetailState>(
      listener: (context, state) {
        if (state is InitGetCinemaDetailState) {
        }
        else if (state is GetCinemaDetailSuceessState) {
          respons = state.data!;

          if (respons.showDates != null) {
            for (int i = 0; i < respons.showDates!.length; i++) {
              showDatesList.add(respons.showDates![i]);
            }
          }
        }

        else if (state is GetCinemaDetailFailState) {
          print("Fail_of_cinema_Detail${state.errorMessage}");
        }
        else if (state is InitGetCinemaShowState) {
          cinemaShowsResponse = null;
          filmsList.clear();
        }
        else if (state is GetCinemaShowSuceessState) {
          cinemaShowsResponse = state.data!;

          if (cinemaShowsResponse?.films != null) {
            for (int i = 0; i < cinemaShowsResponse!.films!.length; i++) {
              filmsList.add(cinemaShowsResponse!.films![i]);
            }
          }
        }
        else if (state is GetCinemaDetailFailState) {
          print("Fail_of_cinema_Detail${state.errorMessage}");
        }
        else if (state is InitPurchaseTicketState) {
        }
        else if (state is GetPurchaseTicketSuceessState) {
          if (kIsWeb) {
            html.window.open(state.data!.url!, "_self");
          } else if (Platform.isAndroid || Platform.isIOS) {

          }else if (Platform.isLinux||Platform.isWindows||Platform.isMacOS) {
            openWebview(state.data!.url!);
          }
        }
        else if (state is GetPurchaseTicketFailState) {
          print("Fail_of_cinema_Detail${state.errorMessage}");
        }
        else if (state is OnDrawerOpenState) {
        }
        else if (state is OnDrawerCloseState) {
        }
        else if (state is NoInternetConnectionState) {}
      },
      child: BlocBuilder<CinemaDetailBloc, CinemaDetailState>(
          builder: (contextLogin, state) {
        if (state is InitGetCinemaDetailState) {
        } else if (state is GetCinemaDetailSuceessState) {
        } else if (state is GetCinemaDetailFailState) {
        } else if (state is OnDrawerOpenState) {
          scaffoldKey.currentState!.openDrawer();
        } else if (state is OnDrawerOpenState) {
          scaffoldKey.currentState!.closeDrawer();
        } else if (state is onDateSlectState) {
          selectedShowDate = state.date;
        } else if (state is NoInternetConnectionState) {}
        return mainUi(context);
      }),
    );
  }

  void openWebview(String url) async {
    final webview = await WebviewWindow.create();
    webview.launch(url);
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
                          appBarMenu(context),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: cinemaDetailContent(context),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          if (respons.showDates != null) showsDatesList(context)
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

  Widget appBarMenu(BuildContext context) {
    return Row(
      children: [
        if (MediaQuery.of(context).size.width <= 750)
          IconButton(
              onPressed: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  //close drawer, if drawer is open
                  BlocProvider.of<CinemaDetailBloc>(context)
                      .add(onCloseDrawerEvent());
                } else {
                  //close drawer, if drawer is open
                  BlocProvider.of<CinemaDetailBloc>(context)
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

  Widget showsDatesList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Show Dates",
              style: TextStyle(
                  color: context.resources.color.colorPrimaryText,
                  fontFamily: context.resources.font.josefinSans,
                  fontSize: context.resources.dimension.bigText,
                  fontWeight: FontWeight.w800),
            ),
          ),

          SizedBox(height: 12),

          Wrap(
            alignment: WrapAlignment.start,
            children: showDatesList.map((e) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    child: InkWell(
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                            side: BorderSide(
                                color: e.date!.toString() == selectedShowDate
                                    ? Colors.black
                                    : Colors.transparent)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${e.date}",
                            style: TextStyle(
                                fontFamily: context.resources.font.josefinSans,
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    context.resources.dimension.smallMediumText,
                                color: context.resources.color.colorAccentBg),
                          ),
                        ),
                      ),
                      onTap: () {
                        String currentTime = Utils().getCurrentTimeFormatted();
                        String currentLocation =
                            ApiEndPoints.geolocation.isEmpty
                                ? "$lat;$long"
                                : ApiEndPoints.geolocation;
                        BlocProvider.of<CinemaDetailBloc>(context).add(
                            onGetCinemaShowsEvent(currentTime, currentLocation,
                                cinemaID!, e.date!));
                      },
                    ),
                  ),
                ],
              );
            }).toList(),
          ),

          if (cinemaShowsResponse != null && filmsList.isNotEmpty)
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filmsList.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return CinemaShowListItem(
                        films: filmsList[index],
                        onCliCk: (value) {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return BookingConfirmationBottomSheet(
                                  filmName: value["movieName"] ?? "",
                                  cinemaName: respons.cinemaName ?? "",
                                  dateOfShow: selectedShowDate ?? "",
                                  showTiming: "${Utils().convertToAmPmFormat(value["showTime"] ?? "")} To ${Utils().convertToAmPmFormat(value["showEndTime"] ?? "")}",
                                  onCliCk: () {
                                    String currentTime = Utils().getCurrentTimeFormatted();

                                    String currentLocation = ApiEndPoints.geolocation.isEmpty
                                            ? "$lat;$long"
                                            : ApiEndPoints.geolocation;

                                    BlocProvider.of<CinemaDetailBloc>(this.context)
                                        .add(onPurchaceEvent(
                                            currentTime,
                                            currentLocation,
                                            cinemaID!,
                                            value["movieId"].toString(),
                                            selectedShowDate!,
                                            value["showTime"]));

                                  },
                                );
                              });
                        });
                  }),
            ),

          // if()
        ],
      ),
    );
  }

  Widget cinemaDetailContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            respons.cinemaName ?? "",
            style: TextStyle(
                fontFamily: context.resources.font.josefinSans,
                fontSize: context.resources.dimension.avatarText,
                color: context.resources.color.colorAccentBg,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 12),
          RichText(
              text: TextSpan(children: [
            WidgetSpan(
              child: Icon(
                Icons.location_city,
                size: context.resources.dimension.smallMediumText,
                color: context.resources.color.colorAccentBg,
              ),
            ),
            const WidgetSpan(
              child: SizedBox(width: 4),
            ),
            TextSpan(
              text:
                  "${respons.address ?? ""},${respons.address2 ?? ""} ${respons.city ?? ""}",
              style: TextStyle(
                  fontFamily: context.resources.font.josefinSans,
                  fontSize: context.resources.dimension.defaultText,
                  fontWeight: FontWeight.w500,
                  color: context.resources.color.colorAccentBg),
            ),
          ])),
          const SizedBox(
            height: 10,
          ),
          if (respons.distance != null)
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(
                      Icons.location_pin,
                      size: context.resources.dimension.smallMediumText,
                      color: context.resources.color.colorAccentBg,
                    ),
                  ),
                  TextSpan(
                      text:
                          "${Utils().milesToKilometers(double.parse(respons.distance.toString() ?? "0"))} Km away",
                      style: TextStyle(
                          fontFamily: context.resources.font.josefinSans,
                          fontSize: context.resources.dimension.defaultText,
                          fontWeight: FontWeight.w400,
                          color: context.resources.color.colorAccentBg)),
                ],
              ),
            ),
          const SizedBox(
            height: 8,
          ),
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.phone,
                    size: context.resources.dimension.smallMediumText,
                    color: context.resources.color.colorAccentBg,
                  ),
                ),
                TextSpan(
                    text: respons.phone.toString() ?? "",
                    style: TextStyle(
                        fontFamily: context.resources.font.josefinSans,
                        fontSize: context.resources.dimension.defaultText,
                        fontWeight: FontWeight.w400,
                        color: context.resources.color.colorAccentBg)),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
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
    BlocProvider.of<CinemaDetailBloc>(context)
        .add(onGetCinemaDetailEvent(currentTime, currentLocation, cinemaID!));
  }

  @override
  void dispose() {
    super.dispose();
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
