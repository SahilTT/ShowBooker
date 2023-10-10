import 'package:flutter/material.dart';
import 'package:show_booker/models/film_shows_response.dart';
import 'package:show_booker/res/app_context_extension.dart';
import 'package:show_booker/utils/Utils.dart';


class FilmShowListItem extends StatelessWidget {

  Cinemas? cinema = Cinemas();
  Function(Map<String,dynamic>) onCliCk;

  FilmShowListItem({Key? key, required this.cinema, required this.onCliCk}) :super(key: key);

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
            Text(cinema?.cinemaName?? "",
              style: TextStyle(color: context.resources.color.colorPrimaryText,
                  fontFamily: context.resources.font.josefinSans,
                  fontSize: context.resources.dimension.bigText,
                  fontWeight: FontWeight.w700
              ),),
            const SizedBox(height: 8.0,),
            Text("${Utils().milesToKilometers(double.parse(cinema?.distance.toString()??"0.0"))}km away",
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
              children: cinema!.showings!.standard!.times!.map((e) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
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
                          Map<String,dynamic> map = {};
                          map["cinemaName"] = cinema?.cinemaName;
                          map["cinemaID"] = cinema?.cinemaId;
                          map["showTime"] = e.startTime;
                          map["showEndTime"] = e.endTime;
                          onCliCk(map);

                          print("On films show click");
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