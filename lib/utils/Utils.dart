import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;



class Utils {
  String getCurrentTimeFormatted() {

    final now = DateTime.now();
    final formatter = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'");
    var formattedTime = formatter.format(now);

    return formattedTime;
  }

  String convertToAmPmFormat(String time) {
    if(time.isEmpty){
      return "";
    }

    final parser = DateFormat("HH:mm");
    final formatter = DateFormat("hh:mma");
    var formattedTime = formatter.format(parser.parse(time));
    return formattedTime;
  }

  Future<String> fetchImage(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      // Return the image data as a base64-encoded string
      return base64Encode(response.bodyBytes);
    } else {
      throw Exception('Failed to load image');
    }
  }


  String milesToKilometers(double miles) {
    const double kilometersPerMile = 1.60934;
    double kilometers = miles * kilometersPerMile;
    String result = kilometers.toStringAsFixed(1);
    return result;
  }
}