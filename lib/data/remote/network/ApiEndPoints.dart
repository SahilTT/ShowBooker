class ApiEndPoints {

  static String baseUrl = "https://api-gate2.movieglu.com/";

  //SandBox credantials
  static String client = "NA_31";
  static String apiKey = "uostEZzmwBr5YExXX0lh3yVOm4ihV1r6hRJTrkUa";
  static String authorization = "Basic TkFfMzFfWFg6aWVTNkh2UDV3WnZj";
  static String territory = "XX";
  static String apiVersion = "v200";
  static String geolocation = "-22.0;14.0";
  static String deviceDatetime = "2018-09-14T08:30:17.360Z";

  //Params
  static String filmIDParam = "film_id=";
  static String cinemaIDParam = "cinema_id=";
  static String dateParam = "date=";
  static String sortPopularityParam = "sort=popularity";
  static String timeParam = "time=";

  //Api EndPoints
  static String runingMovieUrl = "filmsNowShowing";
  static String upComingMovieUrl = "filmsComingSoon";
  static String getFilmDetailUrl = "filmDetails/?$filmIDParam";
  static String nearbyCinemaUrl = "cinemasNearby";
  static String cinemaDetailUrl = "cinemaDetails/?$cinemaIDParam";
  static String cinemaShowTimesUrl = "cinemaShowTimes/?";
  static String filmShowTimesUrl = "filmShowTimes/?";
  static String purcheseConfirmationUrl = "purchaseConfirmation/?";


  //Live credantials
  // static String client = "NA_31";
  // static String apiKey = "aQCahNDeWmaxJbLjlIiAA3o9sQNGt8RlagUwB9e8";
  // static String authorization = "Basic TkFfMzE6NXJrNEI0RUxIUnJS";
  // static String territory = "IN";
  // static String apiVersion = "v200";
  // static String geolocation = "";
  // static String deviceDatetime = "2023-08-28T06:05:32.726Z";

}