/// films : [{"film_id":337555,"imdb_id":22086334,"imdb_title_id":"tt22086334","film_name":"Dream Girl 2","other_titles":null,"release_dates":[{"release_date":"2023-08-25","notes":"IND"}],"age_rating":[{"rating":"U/A ","age_rating_image":"https://assets.movieglu.com/age_rating_logos/in/u/a.png","age_advisory":""}],"film_trailer":null,"synopsis_long":"Karam, a small-town boy from Mathura, is struggling to pay his father`s hefty debts. He is also deeply in love with Pari, whose father has kept conditions to marry her. To make ends meet, Karam becomes Pooja, which creates wild chaos and a comedy of errors.","images":{"poster":{"1":{"image_orientation":"portrait","region":"IN","medium":{"film_image":"https://image.movieglu.com/337555/IND_337555h0.jpg","width":225,"height":300}}}}},{"film_id":336886,"imdb_id":15441054,"imdb_title_id":"tt15441054","film_name":"Gadar 2 (Hindi)","other_titles":{"HI":"Gadar 2"},"release_dates":[{"release_date":"2023-08-11","notes":"IND"}],"age_rating":[{"rating":"U/A ","age_rating_image":"https://assets.movieglu.com/age_rating_logos/in/u/a.png","age_advisory":""}],"film_trailer":"https://trailer.movieglu.com/336886_high.mp4","synopsis_long":"\"Gadar 2\" begins in 1971, amidst the backdrop of the Bangladesh / East Pakistan partition. The story is about Tara Singh played by Sunny Deol, a father, and his son, Jeetey played by Utkarsh Sharma, who goes to Pakistan to rescue his father only to discover later that Tara never reached Pakistan and gets trapped in a conspiracy himself. Thus begins the real rescue mission where Tara Singh revisits Pakistan, this time for his son. Full of power and breath-taking action, Gadar 2 promises to embody the spirit of the first part and present a brand-new story of hope, love, patriotism & sacrifice.","images":{"poster":{"1":{"image_orientation":"portrait","region":"IN","medium":{"film_image":"https://image.movieglu.com/336886/IND_336886h0.jpg","width":240,"height":300}}}}},{"film_id":329012,"imdb_id":11663228,"imdb_title_id":"tt11663228","film_name":"Jailer (Tamil)","other_titles":{"TA":"Jailer"},"release_dates":[{"release_date":"2023-08-10","notes":"IND"}],"age_rating":[{"rating":"U/A ","age_rating_image":"https://assets.movieglu.com/age_rating_logos/in/u/a.png","age_advisory":""}],"film_trailer":null,"synopsis_long":"Muthuvel Pandian is a strict yet empathetic jailer who sets out to stop a gang from trying to rescue their leader from the prison.","images":{"poster":{"1":{"image_orientation":"portrait","region":"IN","medium":{"film_image":"https://image.movieglu.com/329012/IND_329012h0.jpg","width":207,"height":300}}}}},{"film_id":348139,"imdb_id":15732324,"imdb_title_id":"tt15732324","film_name":"OMG 2 (Hindi)","other_titles":null,"release_dates":[{"release_date":"2023-08-11","notes":"IND"}],"age_rating":[{"rating":"A ","age_rating_image":"https://assets.movieglu.com/age_rating_logos/in/a.png","age_advisory":""}],"film_trailer":"https://trailer.movieglu.com/348139_high.mp4","synopsis_long":"OMG 2, a satirical comedy-drama film, is the story of Kanti Sharan Mudgal, a staunch devotee of Lord Shiva, a simple man, a loving father, and a caring husband. One day his son, Vivek, is blamed for immoral conduct and thrown out of school. Upon confrontation, Kanti realizes that his son has been a victim of misinformation and misguidance. Grief-struck and unable to handle the crisis, Kanti decides to leave the town with his family, until... he has a divine intervention that steers him towards truth. Kanti then decides to take on everyone responsible by dragging them to court to mandate comprehensive education in schools, in a dramatic courtroom drama.","images":{"poster":{"1":{"image_orientation":"portrait","region":"IN","medium":{"film_image":"https://image.movieglu.com/348139/IND_348139h0.jpg","width":240,"height":300}}}}},{"film_id":343054,"imdb_id":28037281,"imdb_title_id":"tt28037281","film_name":"3 Ekka","other_titles":{"GU":"3 EKKA"},"release_dates":[{"release_date":"2023-08-18","notes":"IND"}],"age_rating":[{"rating":"U/A ","age_rating_image":"https://assets.movieglu.com/age_rating_logos/in/u/a.png","age_advisory":""}],"film_trailer":null,"synopsis_long":"Three friends set up a secret gambling den to escape financial difficulties in this Gujarati comedy drama, where a light hearted tone offers some counterbalance to scenes of threat.","images":{"poster":{"1":{"image_orientation":"portrait","region":"IN","medium":{"film_image":"https://image.movieglu.com/343054/IND_343054h0.jpg","width":169,"height":300}}}}}]
/// status : {"count":5,"state":"OK","method":"filmsNowShowing","message":null,"request_method":"GET","version":"NA_31v200","territory":"IN","device_datetime_sent":"2023-08-31T06:05:32.726Z","device_datetime_used":"2023-08-31 06:05:32"}

class RuningMoviesResponse {
  RuningMoviesResponse({
    List<Films>? films,
    Status? status,
  }) {
    _films = films;
    _status = status;
  }

  RuningMoviesResponse.fromJson(dynamic json) {
    if (json['films'] != null) {
      _films = [];
      json['films'].forEach((v) {
        _films?.add(Films.fromJson(v));
      });
    }
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }

  List<Films>? _films;
  Status? _status;

  List<Films>? get films => _films;

  Status? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_films != null) {
      map['films'] = _films?.map((v) => v.toJson()).toList();
    }
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    return map;
  }
}

/// count : 5
/// state : "OK"
/// method : "filmsNowShowing"
/// message : null
/// request_method : "GET"
/// version : "NA_31v200"
/// territory : "IN"
/// device_datetime_sent : "2023-08-31T06:05:32.726Z"
/// device_datetime_used : "2023-08-31 06:05:32"

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

/// film_id : 337555
/// imdb_id : 22086334
/// imdb_title_id : "tt22086334"
/// film_name : "Dream Girl 2"
/// other_titles : null
/// release_dates : [{"release_date":"2023-08-25","notes":"IND"}]
/// age_rating : [{"rating":"U/A ","age_rating_image":"https://assets.movieglu.com/age_rating_logos/in/u/a.png","age_advisory":""}]
/// film_trailer : null
/// synopsis_long : "Karam, a small-town boy from Mathura, is struggling to pay his father`s hefty debts. He is also deeply in love with Pari, whose father has kept conditions to marry her. To make ends meet, Karam becomes Pooja, which creates wild chaos and a comedy of errors."
/// images : {"poster":{"1":{"image_orientation":"portrait","region":"IN","medium":{"film_image":"https://image.movieglu.com/337555/IND_337555h0.jpg","width":225,"height":300}}}}

class Films {
  Films({
    num? filmId,
    num? imdbId,
    String? imdbTitleId,
    String? filmName,
    dynamic otherTitles,
    List<ReleaseDates>? releaseDates,
    List<AgeRating>? ageRating,
    dynamic filmTrailer,
    String? synopsisLong,
    Images? images,
  }) {
    _filmId = filmId;
    _imdbId = imdbId;
    _imdbTitleId = imdbTitleId;
    _filmName = filmName;
    _otherTitles = otherTitles;
    _releaseDates = releaseDates;
    _ageRating = ageRating;
    _filmTrailer = filmTrailer;
    _synopsisLong = synopsisLong;
    _images = images;
  }

  Films.fromJson(dynamic json) {
    _filmId = json['film_id'];
    _imdbId = json['imdb_id'];
    _imdbTitleId = json['imdb_title_id'];
    _filmName = json['film_name'];
    _otherTitles = json['other_titles'];
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
    _filmTrailer = json['film_trailer'];
    _synopsisLong = json['synopsis_long'];
    _images = json['images'] != null ? Images.fromJson(json['images']) : null;
  }

  num? _filmId;
  num? _imdbId;
  String? _imdbTitleId;
  String? _filmName;
  dynamic _otherTitles;
  List<ReleaseDates>? _releaseDates;
  List<AgeRating>? _ageRating;
  dynamic _filmTrailer;
  String? _synopsisLong;
  Images? _images;

  num? get filmId => _filmId;

  num? get imdbId => _imdbId;

  String? get imdbTitleId => _imdbTitleId;

  String? get filmName => _filmName;

  dynamic get otherTitles => _otherTitles;

  List<ReleaseDates>? get releaseDates => _releaseDates;

  List<AgeRating>? get ageRating => _ageRating;

  dynamic get filmTrailer => _filmTrailer;

  String? get synopsisLong => _synopsisLong;

  Images? get images => _images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['film_id'] = _filmId;
    map['imdb_id'] = _imdbId;
    map['imdb_title_id'] = _imdbTitleId;
    map['film_name'] = _filmName;
    map['other_titles'] = _otherTitles;
    if (_releaseDates != null) {
      map['release_dates'] = _releaseDates?.map((v) => v.toJson()).toList();
    }
    if (_ageRating != null) {
      map['age_rating'] = _ageRating?.map((v) => v.toJson()).toList();
    }
    map['film_trailer'] = _filmTrailer;
    map['synopsis_long'] = _synopsisLong;
    if (_images != null) {
      map['images'] = _images?.toJson();
    }
    return map;
  }
}

/// poster : {"1":{"image_orientation":"portrait","region":"IN","medium":{"film_image":"https://image.movieglu.com/337555/IND_337555h0.jpg","width":225,"height":300}}}

class Images {

  Images({Poster? poster,}) {
    _poster = poster;
  }

  Images.fromJson(dynamic json) {
    try{
      _poster = json['poster'] != null ? Poster.fromJson(json['poster']) : null;
    }catch(e){
      _poster = null;
    }
  }

  Poster? _poster;

  Poster? get poster => _poster;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_poster != null) {
      map['poster'] = _poster?.toJson();
    }
    return map;
  }
}

/// 1 : {"image_orientation":"portrait","region":"IN","medium":{"film_image":"https://image.movieglu.com/337555/IND_337555h0.jpg","width":225,"height":300}}

class Poster {
  Map<String, PosterItem>? _items;

  Poster({Map<String, PosterItem>? items,}) {
    _items = items;
  }

  Poster.fromJson(dynamic json) {
    final Map<String, PosterItem> items = {};

    json.forEach((key, value){
      items[key] = PosterItem.fromJson(value);
    });

    if(items.isNotEmpty) {
      _items= items;
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

/// image_orientation : "portrait"
/// region : "IN"
/// medium : {"film_image":"https://image.movieglu.com/337555/IND_337555h0.jpg","width":225,"height":300}

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

/// film_image : "https://image.movieglu.com/337555/IND_337555h0.jpg"
/// width : 225
/// height : 300

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

/// rating : "U/A "
/// age_rating_image : "https://assets.movieglu.com/age_rating_logos/in/u/a.png"
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

/// release_date : "2023-08-25"
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
