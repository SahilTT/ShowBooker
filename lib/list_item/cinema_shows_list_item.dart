import 'package:flutter/material.dart';
import 'package:show_booker/res/app_context_extension.dart';
import 'package:show_booker/utils/Utils.dart';

import '../models/cinema_shows_response.dart';

class CinemaShowListItem extends StatelessWidget {

  Films? films = Films();
  Function(Map<String,dynamic>) onCliCk;

  CinemaShowListItem({Key? key, required this.films, required this.onCliCk}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(films?.filmName ?? "",
              style: TextStyle(color: context.resources.color.colorPrimaryText,
                  fontFamily: context.resources.font.josefinSans,
                  fontSize: context.resources.dimension.bigText,
                  fontWeight: FontWeight.w700
              ),),

            const SizedBox(height: 8.0,),
            Text(films?.versionType ?? "",
              style: TextStyle(color: context.resources.color.colorPrimaryText,
                  fontFamily: context.resources.font.josefinSans,
                  fontSize: context.resources.dimension.smallMediumText,
                  fontWeight: FontWeight.w500
              ),),
            const SizedBox(height: 8.0,),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 4.0,
              runSpacing: 4.0,
              children: films!.showings!.standard!.times!.map((e) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 4.0),
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                            border: Border.all(color: context.resources.color.colorAccentBg,width: 2.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Utils().convertToAmPmFormat(e.startTime??""),
                              style: TextStyle(
                                  fontFamily: context.resources.font.josefinSans,
                                  fontWeight: FontWeight.w700,
                                  fontSize: context.resources.dimension.smallText,
                                  color: context.resources.color.colorAccentBg),
                            ),
                          ),
                        ),
                        onTap: (){
                          Map<String,dynamic> bookingData = Map();
                          bookingData["showTime"] = e.startTime;
                          bookingData["showEndTime"] = e.endTime;
                          bookingData["movieName"] = films?.filmName;
                          bookingData["movieId"] = films?.filmId;
                          onCliCk(bookingData);
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }}