import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:show_booker/bloc/film_detail/film_detail_bloc.dart';
import 'package:show_booker/data/remote/network/ApiEndPoints.dart';
import 'package:show_booker/enums/drawer_item_action.dart';
import 'package:show_booker/models/film_details_response.dart';
import 'package:show_booker/res/app_context_extension.dart';
import 'package:show_booker/ui/film_shows_screen.dart';
import 'package:show_booker/ui/upcoming_movie_screen.dart';
import 'package:show_booker/utils/responsive.dart';
import 'package:show_booker/widgets/drawer_menu.dart';

import '../utils/Utils.dart';
import '../widgets/Image_view_widget.dart';
import '../widgets/lottie_progress_animation_widget.dart';
import 'dashboard_screen.dart';
import 'nearby_cinema_screen.dart';
import 'running_movies_screen.dart';

class FilmDetailScreen extends StatefulWidget {
  static const String id = "FilmDetailScreen";

  String? lat;
  String? long;
  String? filmID;

  FilmDetailScreen({super.key, this.lat, this.long, this.filmID});

  @override
  State<StatefulWidget> createState() =>
      FilmDetailScreenState(lat, long, filmID);
}

class FilmDetailScreenState extends State<FilmDetailScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  FilmDetailsResponse response = FilmDetailsResponse();
  List<StillItem> stilImages = <StillItem>[];
  List<Cast> castList = <Cast>[];
  List<Directors> directorList = <Directors>[];
  List<Writers> writersList = <Writers>[];
  List<Producers> prodsList = <Producers>[];
  List<ShowDates> showDatesList = <ShowDates>[];
  String? lat;
  String? long;
  String? filmID;

  int _currentPageIndex = 0;
  final PageController _pageController = PageController(viewportFraction: 0.55);
  late Timer _timer;
  String? genres = "";

  bool isResponsed = false;

  FilmDetailScreenState(this.lat, this.long, this.filmID);

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currentPageIndex == stilImages.length - 1) {
        _pageController.jumpToPage(0);
      } else {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    });
  }

  void _restartTimer() {
    _timer.cancel();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FilmDetailBloc, FilmDetailState>(
      listener: (context, state) {
        if (state is InitGetMovieDetailState) {
          isResponsed=false;
        } else if (state is GetMovieDetailSuceessState) {
          response = state.data!;
          if (response.images?.still != null) {
            for (StillItem still in response.images!.still!.items!.values) {
              stilImages.add(still);
            }
            print(stilImages.toString());

            _startTimer();
          }

          if (response.genres != null) {
            for (int i = 0; i < response.genres!.length; i++) {
              if (genres!.isEmpty) {
                genres = response.genres?[i].genreName;
              } else {
                genres = "$genres,${response.genres?[i].genreName}";
              }
            }
          }

          if (response.cast != null) {
            for (int i = 0; i < response.cast!.length; i++) {
              castList.add(response.cast![i]);
            }
          }

          if (response.directors != null) {
            for (int i = 0; i < response.directors!.length; i++) {
              directorList.add(response.directors![i]);
            }
          }

          if (response.writers != null) {
            for (int i = 0; i < response.writers!.length; i++) {
              writersList.add(response.writers![i]);
            }
          }

          if (response.producers != null) {
            for (int i = 0; i < response.producers!.length; i++) {
              prodsList.add(response.producers![i]);
            }
          }

          if (response.showDates != null) {
            for (int i = 0; i < response.showDates!.length; i++) {
              showDatesList.add(response.showDates![i]);
            }
          }

          isResponsed=true;
        } else if (state is GetMovieDetailFailState) {
          print("Fail_of_film_Detail${state.errorMessage}");
        } else if (state is OnDrawerOpenState) {
        } else if (state is OnDrawerCloseState) {
        } else if (state is OnPageChangeState) {
          _currentPageIndex = state.index;
          _restartTimer();
        } else if (state is NoInternetConnectionState) {}
      },
      child: BlocBuilder<FilmDetailBloc, FilmDetailState>(
          builder: (contextLogin, state) {
        if (state is InitGetMovieDetailState) {
        } else if (state is GetMovieDetailSuceessState) {
        } else if (state is GetMovieDetailFailState) {
        } else if (state is OnDrawerOpenState) {
          scaffoldKey.currentState!.openDrawer();
        } else if (state is OnDrawerOpenState) {
          scaffoldKey.currentState!.closeDrawer();
        } else if (state is OnPageChangeState) {
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

        context.pushNamed(RunningMovieScreen.id,
            queryParameters: {'lat': lat, 'long': long});
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
          : DrawerMenu(onItemSelected: handleItemSelected,seletedIndex: 100),
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              if (MediaQuery.of(context).size.width > 750)
                Expanded(
                  child: DrawerMenu(onItemSelected: handleItemSelected,seletedIndex: 100,),
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
                            height: 6.0,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                child: MovieDiscricptionCard(context),
                              )),
                          const SizedBox(
                            height: 6.0,
                          ),
                          CastList(context),
                          const SizedBox(
                            height: 6.0,
                          ),
                          ShowsDatesList(context)
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              if (!isResponsed)
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
                  BlocProvider.of<FilmDetailBloc>(context)
                      .add(onCloseDrawerEvent());
                } else {
                  //close drawer, if drawer is open
                  BlocProvider.of<FilmDetailBloc>(context)
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
      ],
    );
  }

  Widget MovieDiscricptionCard(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          response.filmName ?? "",
          style: TextStyle(
              color: context.resources.color.colorAccentBg,
              fontFamily: context.resources.font.josefinSans,
              fontSize: context.resources.dimension.avatarText,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 16,
        ),
        ImagesPagerView(context),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            "Genres : $genres",
            style: TextStyle(
                color: context.resources.color.colorPrimaryText,
                fontWeight: FontWeight.w600,
                fontSize: context.resources.dimension.smallText,
                fontFamily: context.resources.font.josefinSans),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          response.synopsisLong ?? "",
          style: TextStyle(
              color: context.resources.color.colorPrimaryText,
              fontFamily: context.resources.font.josefinSans,
              fontSize: context.resources.dimension.mediumText,
              fontWeight: FontWeight.w400,
              height: 1.5),
        ),
      ],
    );
  }

  Widget ImagesPagerView(BuildContext context) {
    return Column(
      children: [
        if (stilImages.isNotEmpty)
          Center(
            child: SizedBox(
              height: 300,
              width: double.maxFinite,
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: stilImages.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      BlocProvider.of<FilmDetailBloc>(context)
                          .add(onPageChangeEvent(index));
                    },
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 12),
                        child: MyImage(
                            imageUrl:
                                stilImages[index].medium?.filmImage ?? ""),
                      );
                    },
                  ),
                  Positioned(
                      left: 0, right: 0, bottom: 0, child: _buildIndicatorRow())
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget CastList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "The Cast",
                    style: TextStyle(
                        color: context.resources.color.colorPrimaryText,
                        fontFamily: context.resources.font.josefinSans,
                        fontSize: context.resources.dimension.bigText,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(height: 12),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: castList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 3),
                        child: Text(
                          "${castList[index].castName}",
                          style: TextStyle(
                              fontFamily: context.resources.font.josefinSans,
                              fontWeight: FontWeight.w500,
                              fontSize:
                                  context.resources.dimension.smallMediumText,
                              color: context.resources.color.colorPrimaryText),
                        ),
                      );
                    })
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Directors",
                    style: TextStyle(
                        color: context.resources.color.colorPrimaryText,
                        fontFamily: context.resources.font.josefinSans,
                        fontSize: context.resources.dimension.bigText,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: directorList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 3),
                        child: Text(
                          "${directorList[index].directorName}",
                          style: TextStyle(
                              fontFamily: context.resources.font.josefinSans,
                              fontWeight: FontWeight.w500,
                              fontSize:
                                  context.resources.dimension.smallMediumText,
                              color: context.resources.color.colorPrimaryText),
                        ),
                      );
                    })
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Producers",
                    style: TextStyle(
                        color: context.resources.color.colorPrimaryText,
                        fontFamily: context.resources.font.josefinSans,
                        fontSize: context.resources.dimension.bigText,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: prodsList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 3),
                        child: Text(
                          "${prodsList[index].producerName}",
                          style: TextStyle(
                              fontFamily: context.resources.font.josefinSans,
                              fontWeight: FontWeight.w500,
                              fontSize:
                                  context.resources.dimension.smallMediumText,
                              color: context.resources.color.colorPrimaryText),
                        ),
                      );
                    })
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Writers",
                    style: TextStyle(
                        color: context.resources.color.colorPrimaryText,
                        fontFamily: context.resources.font.josefinSans,
                        fontSize: context.resources.dimension.bigText,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: writersList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 3),
                        child: Text(
                          "${writersList[index].writerName}",
                          style: TextStyle(
                              fontFamily: context.resources.font.josefinSans,
                              fontWeight: FontWeight.w500,
                              fontSize:
                                  context.resources.dimension.smallMediumText,
                              color: context.resources.color.colorPrimaryText),
                        ),
                      );
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ShowsDatesList(BuildContext context) {
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
                        ),
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
                        // Navigator.of(context, rootNavigator: true)
                        //     .pushNamed(FilmShowScreen.id, arguments: {
                        //   "lat": lat,
                        //   "long": long,
                        //   "filmID": filmID,
                        //   "date": e.date
                        // });

                        context.pushNamed(FilmShowScreen.id, pathParameters: {
                          "date": e.date.toString()
                        }, queryParameters: {
                          "lat": lat,
                          "long": long,
                          "filmId": filmID
                        });
                      },
                    ),
                  ),
                ],
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget _buildIndicatorRow() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(stilImages.length, (index) {
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPageIndex == index
                    ? Colors.blueAccent
                    : Colors.grey.withOpacity(0.5),
              ),
            );
          }),
        ),
        SizedBox(
          height: 16,
        )
      ],
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
    BlocProvider.of<FilmDetailBloc>(context)
        .add(onGetMovieDetailEvent(currentTime, currentLocation, filmID!));
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
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
