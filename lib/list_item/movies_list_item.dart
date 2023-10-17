import 'dart:convert';

import 'package:show_booker/models/runing_movies_response.dart';

import '../res/app_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;

import '../widgets/Image_view_widget.dart';

class MoviesListItem extends StatelessWidget {
  Films? data;
  Function(String?) onCliCk;

  MoviesListItem({Key? key, required this.onCliCk, required this.data})
      : super(key: key);

  Future<String> fetchImage(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      // Return the image data as a base64-encoded string
      return base64Encode(response.bodyBytes);
    } else {
      throw Exception('Failed to load image');
    }
  }

  @override
  Widget build(BuildContext context) {
    String? filmeImage = data?.images?.poster?.items?["1"]?.medium?.filmImage;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        child: Card(
          elevation: 6,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            width: 220,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                    right: 0,
                    child: MyImage(
                        imageUrl: filmeImage ??
                            "https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg")),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: context.resources.color.colorCardTitleBg),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          data?.filmName ?? "",
                          style: TextStyle(
                              fontSize:
                                  context.resources.dimension.smallMediumText,
                              fontFamily: context.resources.font.josefinSans,
                              fontWeight: FontWeight.w600,
                              color:
                                  context.resources.color.colorSecondaryText),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          "Rating ${data?.ageRating?.first.rating ?? ""}",
                          style: TextStyle(
                              fontSize:
                                  context.resources.dimension.midSmallText,
                              fontFamily: context.resources.font.josefinSans,
                              fontWeight: FontWeight.w500,
                              color:
                                  context.resources.color.colorSecondaryText),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          onCliCk("${data?.filmId}");
        },
      ),
    );
  }
}
