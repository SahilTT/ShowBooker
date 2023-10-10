/// film_id : 333663
/// imdb_id : 15354916
/// imdb_title_id : "tt15354916"
/// film_name : "Jawan (Hindi)"
/// other_titles : {"HI":"Jawan"}
/// version_type : "Standard"
/// images : {"poster":{"1":{"image_orientation":"portrait","region":"IN","medium":{"film_image":"https://image.movieglu.com/333663/IND_333663h0.jpg","width":225,"height":300}},"2":{"image_orientation":"portrait","region":"global","medium":{"film_image":"https://image.movieglu.com/333663/333663h1.jpg","width":200,"height":300}}},"still":{"1":{"image_orientation":"landscape","medium":{"film_image":"https://image.movieglu.com/333663/333663h2.jpg","width":300,"height":200}},"2":{"image_orientation":"landscape","medium":{"film_image":"https://image.movieglu.com/333663/333663h3.jpg","width":300,"height":200}},"3":{"image_orientation":"landscape","medium":{"film_image":"https://image.movieglu.com/333663/333663h4.jpg","width":300,"height":200}},"4":{"image_orientation":"landscape","medium":{"film_image":"https://image.movieglu.com/333663/333663h5.jpg","width":300,"height":200}},"5":{"image_orientation":"landscape","medium":{"film_image":"https://image.movieglu.com/333663/333663h6.jpg","width":300,"height":200}},"6":{"image_orientation":"landscape","medium":{"film_image":"https://image.movieglu.com/333663/333663h7.jpg","width":300,"height":200}},"7":{"image_orientation":"landscape","medium":{"film_image":"https://image.movieglu.com/333663/333663h8.jpg","width":300,"height":200}},"8":{"image_orientation":"landscape","medium":{"film_image":"https://image.movieglu.com/333663/333663h9.jpg","width":300,"height":200}},"9":{"image_orientation":"landscape","medium":{"film_image":"https://image.movieglu.com/333663/333663ha.jpg","width":300,"height":200}}}}
/// synopsis_long : "The emotional journey of a man who is set to rectify the wrongs in the society, in an attempt to get even with his past, driven by a personal vendetta while keeping up to a promise made years ago. A high-octane action thriller where he is up against a dreadful monstrous outlaw who knows no fear and has caused extreme suffering to many. In the journey he will cross paths with a high-minded seasoned lady officer whose emotions might get the better of her as she gets involved in this battle. As his past catches up with him, to overcome the challenges and restore the harmony in their world, he will need all the firepower and intelligence he can muster."
/// distributor_id : null
/// distributor : null
/// release_dates : [{"release_date":"2023-09-07","notes":"IND"}]
/// age_rating : [{"rating":"0 ","age_rating_image":"https://assets.movieglu.com/age_rating_logos/in/uc.png","age_advisory":""}]
/// duration_mins : 165
/// review_stars : 0
/// review_txt : ""
/// trailers : {"high":[{"film_trailer":"https://trailer.movieglu.com/333663_high.mp4","trailer_image":"https://image.movieglu.com/333663/333663h3.jpg","version":1,"quality":"high","region":"US"}]}
/// genres : [{"genre_id":5,"genre_name":"Action/Adventure"},{"genre_id":11,"genre_name":"Suspense/Thriller"}]
/// cast : [{"cast_id":5843,"cast_name":"Shah Rukh Khan"},{"cast_id":1509,"cast_name":"Nayanthara"},{"cast_id":5645,"cast_name":"Sanya Malhotra"},{"cast_id":1907,"cast_name":"Priyamani"},{"cast_id":1410,"cast_name":"Yogi Babu"},{"cast_id":16972,"cast_name":"Simarjeet Singh Nagra"},{"cast_id":16973,"cast_name":"Manahar Kumar"}]
/// directors : [{"director_id":835,"director_name":"Atlee Kumar"}]
/// producers : [{"producer_id":265,"producer_name":"Gauri Khan"}]
/// writers : [{"writer_id":781,"writer_name":"Atlee Kumar"}]
/// show_dates : [{"date":"2023-09-07"},{"date":"2023-09-08"},{"date":"2023-09-09"},{"date":"2023-09-10"},{"date":"2023-09-11"},{"date":"2023-09-12"},{"date":"2023-09-13"},{"date":"2023-09-14"},{"date":"2023-09-15"},{"date":"2023-09-16"},{"date":"2023-09-17"},{"date":"2023-09-18"},{"date":"2023-09-19"},{"date":"2023-09-20"},{"date":"2023-09-21"}]
/// alternate_versions : [{"film_id":333667,"film_name":"Jawan (Telugu)","version_type":"Other"},{"film_id":333668,"film_name":"Jawan (Tamil)","version_type":"Other"},{"film_id":350085,"film_name":"Jawan: The IMAX 2D Experience","version_type":"IMAX"}]
/// status : {"count":1,"state":"OK","method":"filmDetails","message":null,"request_method":"GET","version":"NA_31v200","territory":"IN","device_datetime_sent":"2023-09-04T18:29:56.259Z","device_datetime_used":"2023-09-04 18:29:56"}

class FilmDetailsResponse {
  FilmDetailsResponse({
    num? filmId,
    num? imdbId,
    String? imdbTitleId,
    String? filmName,
    OtherTitles? otherTitles,
    String? versionType,
    Images? images,
    String? synopsisLong,
    dynamic distributorId,
    dynamic distributor,
    List<ReleaseDates>? releaseDates,
    List<AgeRating>? ageRating,
    num? durationMins,
    num? reviewStars,
    String? reviewTxt,
    Trailers? trailers,
    List<Genres>? genres,
    List<Cast>? cast,
    List<Directors>? directors,
    List<Producers>? producers,
    List<Writers>? writers,
    List<ShowDates>? showDates,
    List<AlternateVersions>? alternateVersions,
    Status? status,
  }) {
    _filmId = filmId;
    _imdbId = imdbId;
    _imdbTitleId = imdbTitleId;
    _filmName = filmName;
    _otherTitles = otherTitles;
    _versionType = versionType;
    _images = images;
    _synopsisLong = synopsisLong;
    _distributorId = distributorId;
    _distributor = distributor;
    _releaseDates = releaseDates;
    _ageRating = ageRating;
    _durationMins = durationMins;
    _reviewStars = reviewStars;
    _reviewTxt = reviewTxt;
    _trailers = trailers;
    _genres = genres;
    _cast = cast;
    _directors = directors;
    _producers = producers;
    _writers = writers;
    _showDates = showDates;
    _alternateVersions = alternateVersions;
    _status = status;
  }

  FilmDetailsResponse.fromJson(dynamic json) {
    _filmId = json['film_id'];
    _imdbId = json['imdb_id'];
    _imdbTitleId = json['imdb_title_id'];
    _filmName = json['film_name'];
    _otherTitles = json['other_titles'] != null
        ? OtherTitles.fromJson(json['other_titles'])
        : null;
    _versionType = json['version_type'];
    _images = json['images'] != null ? Images.fromJson(json['images']) : null;
    _synopsisLong = json['synopsis_long'];
    _distributorId = json['distributor_id'];
    _distributor = json['distributor'];
    if (json['release_dates'] != null) {
      _releaseDates = [];
      json['release_dates'].forEach((v) {
        _releaseDates?.add(ReleaseDates.fromJson(v));
      });
    }
    if (json['age_rating'] != null) {
      _ageRating = [];
      json['age_rating'].forEach((v) {
        _ageRating?.add(AgeRating.fromJson(v));
      });
    }
    _durationMins = json['duration_mins'];
    _reviewStars = json['review_stars'];
    _reviewTxt = json['review_txt'];
    _trailers =
        json['trailers'] != null ? Trailers.fromJson(json['trailers']) : null;
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(Genres.fromJson(v));
      });
    }
    if (json['cast'] != null) {
      _cast = [];
      json['cast'].forEach((v) {
        _cast?.add(Cast.fromJson(v));
      });
    }
    if (json['directors'] != null) {
      _directors = [];
      json['directors'].forEach((v) {
        _directors?.add(Directors.fromJson(v));
      });
    }
    if (json['producers'] != null) {
      _producers = [];
      json['producers'].forEach((v) {
        _producers?.add(Producers.fromJson(v));
      });
    }
    if (json['writers'] != null) {
      _writers = [];
      json['writers'].forEach((v) {
        _writers?.add(Writers.fromJson(v));
      });
    }
    if (json['show_dates'] != null) {
      _showDates = [];
      json['show_dates'].forEach((v) {
        _showDates?.add(ShowDates.fromJson(v));
      });
    }
    if (json['alternate_versions'] != null) {
      _alternateVersions = [];
      json['alternate_versions'].forEach((v) {
        _alternateVersions?.add(AlternateVersions.fromJson(v));
      });
    }
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }

  num? _filmId;
  num? _imdbId;
  String? _imdbTitleId;
  String? _filmName;
  OtherTitles? _otherTitles;
  String? _versionType;
  Images? _images;
  String? _synopsisLong;
  dynamic _distributorId;
  dynamic _distributor;
  List<ReleaseDates>? _releaseDates;
  List<AgeRating>? _ageRating;
  num? _durationMins;
  num? _reviewStars;
  String? _reviewTxt;
  Trailers? _trailers;
  List<Genres>? _genres;
  List<Cast>? _cast;
  List<Directors>? _directors;
  List<Producers>? _producers;
  List<Writers>? _writers;
  List<ShowDates>? _showDates;
  List<AlternateVersions>? _alternateVersions;
  Status? _status;

  num? get filmId => _filmId;

  num? get imdbId => _imdbId;

  String? get imdbTitleId => _imdbTitleId;

  String? get filmName => _filmName;

  OtherTitles? get otherTitles => _otherTitles;

  String? get versionType => _versionType;

  Images? get images => _images;

  String? get synopsisLong => _synopsisLong;

  dynamic get distributorId => _distributorId;

  dynamic get distributor => _distributor;

  List<ReleaseDates>? get releaseDates => _releaseDates;

  List<AgeRating>? get ageRating => _ageRating;

  num? get durationMins => _durationMins;

  num? get reviewStars => _reviewStars;

  String? get reviewTxt => _reviewTxt;

  Trailers? get trailers => _trailers;

  List<Genres>? get genres => _genres;

  List<Cast>? get cast => _cast;

  List<Directors>? get directors => _directors;

  List<Producers>? get producers => _producers;

  List<Writers>? get writers => _writers;

  List<ShowDates>? get showDates => _showDates;

  List<AlternateVersions>? get alternateVersions => _alternateVersions;

  Status? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['film_id'] = _filmId;
    map['imdb_id'] = _imdbId;
    map['imdb_title_id'] = _imdbTitleId;
    map['film_name'] = _filmName;
    if (_otherTitles != null) {
      map['other_titles'] = _otherTitles?.toJson();
    }
    map['version_type'] = _versionType;
    if (_images != null) {
      map['images'] = _images?.toJson();
    }
    map['synopsis_long'] = _synopsisLong;
    map['distributor_id'] = _distributorId;
    map['distributor'] = _distributor;
    if (_releaseDates != null) {
      map['release_dates'] = _releaseDates?.map((v) => v.toJson()).toList();
    }
    if (_ageRating != null) {
      map['age_rating'] = _ageRating?.map((v) => v.toJson()).toList();
    }
    map['duration_mins'] = _durationMins;
    map['review_stars'] = _reviewStars;
    map['review_txt'] = _reviewTxt;
    if (_trailers != null) {
      map['trailers'] = _trailers?.toJson();
    }
    if (_genres != null) {
      map['genres'] = _genres?.map((v) => v.toJson()).toList();
    }
    if (_cast != null) {
      map['cast'] = _cast?.map((v) => v.toJson()).toList();
    }
    if (_directors != null) {
      map['directors'] = _directors?.map((v) => v.toJson()).toList();
    }
    if (_producers != null) {
      map['producers'] = _producers?.map((v) => v.toJson()).toList();
    }
    if (_writers != null) {
      map['writers'] = _writers?.map((v) => v.toJson()).toList();
    }
    if (_showDates != null) {
      map['show_dates'] = _showDates?.map((v) => v.toJson()).toList();
    }
    if (_alternateVersions != null) {
      map['alternate_versions'] =
          _alternateVersions?.map((v) => v.toJson()).toList();
    }
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    return map;
  }
}

/// count : 1
/// state : "OK"
/// method : "filmDetails"
/// message : null
/// request_method : "GET"
/// version : "NA_31v200"
/// territory : "IN"
/// device_datetime_sent : "2023-09-04T18:29:56.259Z"
/// device_datetime_used : "2023-09-04 18:29:56"

class Status {
  Status({
    num? count,
    String? state,
    String? method,
    dynamic message,
    String? requestMethod,
    String? version,
    String? territory,
    String? deviceDatetimeSent,
    String? deviceDatetimeUsed,
  }) {
    _count = count;
    _state = state;
    _method = method;
    _message = message;
    _requestMethod = requestMethod;
    _version = version;
    _territory = territory;
    _deviceDatetimeSent = deviceDatetimeSent;
    _deviceDatetimeUsed = deviceDatetimeUsed;
  }

  Status.fromJson(dynamic json) {
    _count = json['count'];
    _state = json['state'];
    _method = json['method'];
    _message = json['message'];
    _requestMethod = json['request_method'];
    _version = json['version'];
    _territory = json['territory'];
    _deviceDatetimeSent = json['device_datetime_sent'];
    _deviceDatetimeUsed = json['device_datetime_used'];
  }

  num? _count;
  String? _state;
  String? _method;
  dynamic _message;
  String? _requestMethod;
  String? _version;
  String? _territory;
  String? _deviceDatetimeSent;
  String? _deviceDatetimeUsed;

  num? get count => _count;

  String? get state => _state;

  String? get method => _method;

  dynamic get message => _message;

  String? get requestMethod => _requestMethod;

  String? get version => _version;

  String? get territory => _territory;

  String? get deviceDatetimeSent => _deviceDatetimeSent;

  String? get deviceDatetimeUsed => _deviceDatetimeUsed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['state'] = _state;
    map['method'] = _method;
    map['message'] = _message;
    map['request_method'] = _requestMethod;
    map['version'] = _version;
    map['territory'] = _territory;
    map['device_datetime_sent'] = _deviceDatetimeSent;
    map['device_datetime_used'] = _deviceDatetimeUsed;
    return map;
  }
}

/// film_id : 333667
/// film_name : "Jawan (Telugu)"
/// version_type : "Other"

class AlternateVersions {
  AlternateVersions({
    num? filmId,
    String? filmName,
    String? versionType,
  }) {
    _filmId = filmId;
    _filmName = filmName;
    _versionType = versionType;
  }

  AlternateVersions.fromJson(dynamic json) {
    _filmId = json['film_id'];
    _filmName = json['film_name'];
    _versionType = json['version_type'];
  }

  num? _filmId;
  String? _filmName;
  String? _versionType;

  num? get filmId => _filmId;

  String? get filmName => _filmName;

  String? get versionType => _versionType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['film_id'] = _filmId;
    map['film_name'] = _filmName;
    map['version_type'] = _versionType;
    return map;
  }
}

/// date : "2023-09-07"

class ShowDates {
  ShowDates({
    String? date,
  }) {
    _date = date;
  }

  ShowDates.fromJson(dynamic json) {
    _date = json['date'];
  }

  String? _date;

  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    return map;
  }
}

/// writer_id : 781
/// writer_name : "Atlee Kumar"

class Writers {
  Writers({
    num? writerId,
    String? writerName,
  }) {
    _writerId = writerId;
    _writerName = writerName;
  }

  Writers.fromJson(dynamic json) {
    _writerId = json['writer_id'];
    _writerName = json['writer_name'];
  }

  num? _writerId;
  String? _writerName;

  num? get writerId => _writerId;

  String? get writerName => _writerName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['writer_id'] = _writerId;
    map['writer_name'] = _writerName;
    return map;
  }
}

/// producer_id : 265
/// producer_name : "Gauri Khan"

class Producers {
  Producers({
    num? producerId,
    String? producerName,
  }) {
    _producerId = producerId;
    _producerName = producerName;
  }

  Producers.fromJson(dynamic json) {
    _producerId = json['producer_id'];
    _producerName = json['producer_name'];
  }

  num? _producerId;
  String? _producerName;

  num? get producerId => _producerId;

  String? get producerName => _producerName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['producer_id'] = _producerId;
    map['producer_name'] = _producerName;
    return map;
  }
}

/// director_id : 835
/// director_name : "Atlee Kumar"

class Directors {
  Directors({
    num? directorId,
    String? directorName,
  }) {
    _directorId = directorId;
    _directorName = directorName;
  }

  Directors.fromJson(dynamic json) {
    _directorId = json['director_id'];
    _directorName = json['director_name'];
  }

  num? _directorId;
  String? _directorName;

  num? get directorId => _directorId;

  String? get directorName => _directorName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['director_id'] = _directorId;
    map['director_name'] = _directorName;
    return map;
  }
}

/// cast_id : 5843
/// cast_name : "Shah Rukh Khan"

class Cast {
  Cast({
    num? castId,
    String? castName,
  }) {
    _castId = castId;
    _castName = castName;
  }

  Cast.fromJson(dynamic json) {
    _castId = json['cast_id'];
    _castName = json['cast_name'];
  }

  num? _castId;
  String? _castName;

  num? get castId => _castId;

  String? get castName => _castName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cast_id'] = _castId;
    map['cast_name'] = _castName;
    return map;
  }
}

/// genre_id : 5
/// genre_name : "Action/Adventure"

class Genres {
  Genres({
    num? genreId,
    String? genreName,
  }) {
    _genreId = genreId;
    _genreName = genreName;
  }

  Genres.fromJson(dynamic json) {
    _genreId = json['genre_id'];
    _genreName = json['genre_name'];
  }

  num? _genreId;
  String? _genreName;

  num? get genreId => _genreId;

  String? get genreName => _genreName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['genre_id'] = _genreId;
    map['genre_name'] = _genreName;
    return map;
  }
}

/// high : [{"film_trailer":"https://trailer.movieglu.com/333663_high.mp4","trailer_image":"https://image.movieglu.com/333663/333663h3.jpg","version":1,"quality":"high","region":"US"}]

class Trailers {
  Trailers({
    List<High>? high,
  }) {
    _high = high;
  }

  Trailers.fromJson(dynamic json) {
    if (json['high'] != null) {
      _high = [];
      json['high'].forEach((v) {
        _high?.add(High.fromJson(v));
      });
    }
  }

  List<High>? _high;

  List<High>? get high => _high;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_high != null) {
      map['high'] = _high?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// film_trailer : "https://trailer.movieglu.com/333663_high.mp4"
/// trailer_image : "https://image.movieglu.com/333663/333663h3.jpg"
/// version : 1
/// quality : "high"
/// region : "US"

class High {
  High({
    String? filmTrailer,
    String? trailerImage,
    num? version,
    String? quality,
    String? region,
  }) {
    _filmTrailer = filmTrailer;
    _trailerImage = trailerImage;
    _version = version;
    _quality = quality;
    _region = region;
  }

  High.fromJson(dynamic json) {
    _filmTrailer = json['film_trailer'];
    _trailerImage = json['trailer_image'];
    _version = json['version'];
    _quality = json['quality'];
    _region = json['region'];
  }

  String? _filmTrailer;
  String? _trailerImage;
  num? _version;
  String? _quality;
  String? _region;

  String? get filmTrailer => _filmTrailer;

  String? get trailerImage => _trailerImage;

  num? get version => _version;

  String? get quality => _quality;

  String? get region => _region;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['film_trailer'] = _filmTrailer;
    map['trailer_image'] = _trailerImage;
    map['version'] = _version;
    map['quality'] = _quality;
    map['region'] = _region;
    return map;
  }
}

/// rating : "0 "
/// age_rating_image : "https://assets.movieglu.com/age_rating_logos/in/uc.png"
/// age_advisory : ""

class AgeRating {
  AgeRating({
    String? rating,
    String? ageRatingImage,
    String? ageAdvisory,
  }) {
    _rating = rating;
    _ageRatingImage = ageRatingImage;
    _ageAdvisory = ageAdvisory;
  }

  AgeRating.fromJson(dynamic json) {
    _rating = json['rating'];
    _ageRatingImage = json['age_rating_image'];
    _ageAdvisory = json['age_advisory'];
  }

  String? _rating;
  String? _ageRatingImage;
  String? _ageAdvisory;

  String? get rating => _rating;

  String? get ageRatingImage => _ageRatingImage;

  String? get ageAdvisory => _ageAdvisory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rating'] = _rating;
    map['age_rating_image'] = _ageRatingImage;
    map['age_advisory'] = _ageAdvisory;
    return map;
  }
}

/// release_date : "2023-09-07"
/// notes : "IND"

class ReleaseDates {
  ReleaseDates({
    String? releaseDate,
    String? notes,
  }) {
    _releaseDate = releaseDate;
    _notes = notes;
  }

  ReleaseDates.fromJson(dynamic json) {
    _releaseDate = json['release_date'];
    _notes = json['notes'];
  }

  String? _releaseDate;
  String? _notes;

  String? get releaseDate => _releaseDate;

  String? get notes => _notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['release_date'] = _releaseDate;
    map['notes'] = _notes;
    return map;
  }
}

/// poster : {"1":{"image_orientation":"portrait","region":"IN","medium":{"film_image":"https://image.movieglu.com/333663/IND_333663h0.jpg","width":225,"height":300}},"2":{"image_orientation":"portrait","region":"global","medium":{"film_image":"https://image.movieglu.com/333663/333663h1.jpg","width":200,"height":300}}}
/// still : {"1":{"image_orientation":"landscape","medium":{"film_image":"https://image.movieglu.com/333663/333663h2.jpg","width":300,"height":200}},"2":{"image_orientation":"landscape","medium":{"film_image":"https://image.movieglu.com/333663/333663h3.jpg","width":300,"height":200}},"3":{"image_orientation":"landscape","medium":{"film_image":"https://image.movieglu.com/333663/333663h4.jpg","width":300,"height":200}},"4":{"image_orientation":"landscape","medium":{"film_image":"https://image.movieglu.com/333663/333663h5.jpg","width":300,"height":200}},"5":{"image_orientation":"landscape","medium":{"film_image":"https://image.movieglu.com/333663/333663h6.jpg","width":300,"height":200}},"6":{"image_orientation":"landscape","medium":{"film_image":"https://image.movieglu.com/333663/333663h7.jpg","width":300,"height":200}},"7":{"image_orientation":"landscape","medium":{"film_image":"https://image.movieglu.com/333663/333663h8.jpg","width":300,"height":200}},"8":{"image_orientation":"landscape","medium":{"film_image":"https://image.movieglu.com/333663/333663h9.jpg","width":300,"height":200}},"9":{"image_orientation":"landscape","medium":{"film_image":"https://image.movieglu.com/333663/333663ha.jpg","width":300,"height":200}}}

class Images {
  Images({
    Poster? poster,
    Still? still,
  }) {
    _poster = poster;
    _still = still;
  }

  Images.fromJson(dynamic json) {
    _poster = json['poster'] != null ? Poster.fromJson(json['poster']) : null;
    _still = json['still'] != null ? Still.fromJson(json['still']) : null;
  }

  Poster? _poster;
  Still? _still;

  Poster? get poster => _poster;

  Still? get still => _still;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_poster != null) {
      map['poster'] = _poster?.toJson();
    }
    if (_still != null) {
      map['still'] = _still?.toJson();
    }
    return map;
  }
}

class Still {
  Map<String, StillItem>? _items;

  Still({
    Map<String, StillItem>? items,
  }) {
    _items = items;
  }

  Still.fromJson(dynamic json) {
    final Map<String, StillItem> items = {};

    json.forEach((key, value) {
      items[key] = StillItem.fromJson(value);
    });

    if (items.isNotEmpty) {
      _items = items;
    }
  }

  Map<String, StillItem>? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    _items?.forEach((key, value) {
      map[key] = value.toJson();
    });

    return map;
  }
}

class Medium {
  Medium({
    String? filmImage,
    num? width,
    num? height,
  }) {
    _filmImage = filmImage;
    _width = width;
    _height = height;
  }

  Medium.fromJson(dynamic json) {
    _filmImage = json['film_image'];
    _width = json['width'];
    _height = json['height'];
  }

  String? _filmImage;
  num? _width;
  num? _height;

  String? get filmImage => _filmImage;

  num? get width => _width;

  num? get height => _height;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['film_image'] = _filmImage;
    map['width'] = _width;
    map['height'] = _height;
    return map;
  }
}

class Poster {
  Map<String, PosterItem>? _items;

  Poster({
    Map<String, PosterItem>? items,
  }) {
    _items = items;
  }

  Poster.fromJson(dynamic json) {
    final Map<String, PosterItem> items = {};

    json.forEach((key, value) {
      items[key] = PosterItem.fromJson(value);
    });

    if (items.isNotEmpty) {
      _items = items;
    }
  }

  Map<String, PosterItem>? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    _items?.forEach((key, value) {
      map[key] = value.toJson();
    });

    return map;
  }
}

class PosterItem {
  PosterItem({
    String? imageOrientation,
    String? region,
    Medium? medium,
  }) {
    _imageOrientation = imageOrientation;
    _region = region;
    _medium = medium;
  }

  PosterItem.fromJson(dynamic json) {
    _imageOrientation = json['image_orientation'];
    _region = json['region'];
    _medium = json['medium'] != null ? Medium.fromJson(json['medium']) : null;
  }

  String? _imageOrientation;
  String? _region;
  Medium? _medium;

  String? get imageOrientation => _imageOrientation;

  String? get region => _region;

  Medium? get medium => _medium;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image_orientation'] = _imageOrientation;
    map['region'] = _region;
    if (_medium != null) {
      map['medium'] = _medium?.toJson();
    }
    return map;
  }
}

class StillItem {
  StillItem({
    String? imageOrientation,
    Medium? medium,
  }) {
    _imageOrientation = imageOrientation;
    _medium = medium;
  }

  StillItem.fromJson(dynamic json) {
    _imageOrientation = json['image_orientation'];
    _medium = json['medium'] != null ? Medium.fromJson(json['medium']) : null;
  }

  String? _imageOrientation;
  String? _region;
  Medium? _medium;

  String? get imageOrientation => _imageOrientation;

  String? get region => _region;

  Medium? get medium => _medium;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image_orientation'] = _imageOrientation;
    if (_medium != null) {
      map['medium'] = _medium?.toJson();
    }
    return map;
  }
}

/// HI : "Jawan"

class OtherTitles {
  OtherTitles({
    String? hi,
  }) {
    _hi = hi;
  }

  OtherTitles.fromJson(dynamic json) {
    _hi = json['HI'];
  }

  String? _hi;

  String? get hi => _hi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['HI'] = _hi;
    return map;
  }
}