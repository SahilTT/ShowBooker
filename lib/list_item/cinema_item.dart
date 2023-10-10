import 'package:show_booker/models/nearby_cineam_response.dart';
import 'package:show_booker/utils/Utils.dart';
import 'package:show_booker/utils/responsive.dart';

import '../res/app_context_extension.dart';
import 'package:flutter/material.dart';

class CinemaItem extends StatelessWidget {
  Cinemas? cinemas;
  Function(String?) onCliCk;

  CinemaItem({Key? key, required this.onCliCk, required this.cinemas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: InkWell(
        child: Card(
          elevation: 6,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            width: Responsive.isMobile(context) ? double.infinity : 320,
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  cinemas?.cinemaName ?? "",
                  style: TextStyle(
                      fontFamily: context.resources.font.josefinSans,
                      fontSize: context.resources.dimension.bigText,
                      fontWeight: FontWeight.w700,
                      color: context.resources.color.colorAccentBg),
                ),
                const SizedBox(
                  height: 10,
                ),
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
                    text: "${cinemas?.address ?? ""},${cinemas?.address2 ?? ""} ${cinemas?.city ?? ""}",
                    style: TextStyle(
                        fontFamily: context.resources.font.josefinSans,
                        fontSize: context.resources.dimension.smallMediumText,
                        fontWeight: FontWeight.w500,
                        color: context.resources.color.colorAccentBg),
                  ),
                ])),
                const SizedBox(
                  height: 10,
                ),
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
                              "${Utils().milesToKilometers(double.parse(cinemas?.distance.toString() ?? "0.0"))} Km away",
                          style: TextStyle(
                              fontFamily: context.resources.font.josefinSans,
                              fontSize:
                                  context.resources.dimension.smallMediumText,
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
          ),
        ),
        onTap: () {
          onCliCk(cinemas!.cinemaId.toString());
        },
      ),
    );
  }
}
