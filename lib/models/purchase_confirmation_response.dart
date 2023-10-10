/// film_id : 7772
/// film_name : "Raiders of the Lost Ark"
/// other_titles : null
/// date : "2023-09-22"
/// time : "12:00"
/// cinema_id : 8845
/// cinema_name : "Cinema 2"
/// movietickets_affiliate : 0
/// url : "https://en.wikipedia.org/wiki/Deadvlei"
/// dl_status : null
/// status : {"count":1,"state":"OK","method":"purchaseConfirmation","message":null,"request_method":"GET","version":"NA_31_XXv200","territory":"XX","device_datetime_sent":"2023-09-20T11:05:35.548Z","device_datetime_used":"2023-09-20 11:05:35"}

class PurchaseConfirmationResponse {
  PurchaseConfirmationResponse({
    num? filmId,
    String? filmName,
    dynamic otherTitles,
    String? date,
    String? time,
    num? cinemaId,
    String? cinemaName,
    num? movieticketsAffiliate,
    String? url,
    dynamic dlStatus,
    Status? status,
  }) {
    _filmId = filmId;
    _filmName = filmName;
    _otherTitles = otherTitles;
    _date = date;
    _time = time;
    _cinemaId = cinemaId;
    _cinemaName = cinemaName;
    _movieticketsAffiliate = movieticketsAffiliate;
    _url = url;
    _dlStatus = dlStatus;
    _status = status;
  }

  PurchaseConfirmationResponse.fromJson(dynamic json) {
    _filmId = json['film_id'];
    _filmName = json['film_name'];
    _otherTitles = json['other_titles'];
    _date = json['date'];
    _time = json['time'];
    _cinemaId = json['cinema_id'];
    _cinemaName = json['cinema_name'];
    _movieticketsAffiliate = json['movietickets_affiliate'];
    _url = json['url'];
    _dlStatus = json['dl_status'];
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }

  num? _filmId;
  String? _filmName;
  dynamic _otherTitles;
  String? _date;
  String? _time;
  num? _cinemaId;
  String? _cinemaName;
  num? _movieticketsAffiliate;
  String? _url;
  dynamic _dlStatus;
  Status? _status;

  num? get filmId => _filmId;

  String? get filmName => _filmName;

  dynamic get otherTitles => _otherTitles;

  String? get date => _date;

  String? get time => _time;

  num? get cinemaId => _cinemaId;

  String? get cinemaName => _cinemaName;

  num? get movieticketsAffiliate => _movieticketsAffiliate;

  String? get url => _url;

  dynamic get dlStatus => _dlStatus;

  Status? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['film_id'] = _filmId;
    map['film_name'] = _filmName;
    map['other_titles'] = _otherTitles;
    map['date'] = _date;
    map['time'] = _time;
    map['cinema_id'] = _cinemaId;
    map['cinema_name'] = _cinemaName;
    map['movietickets_affiliate'] = _movieticketsAffiliate;
    map['url'] = _url;
    map['dl_status'] = _dlStatus;
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    return map;
  }
}

/// count : 1
/// state : "OK"
/// method : "purchaseConfirmation"
/// message : null
/// request_method : "GET"
/// version : "NA_31_XXv200"
/// territory : "XX"
/// device_datetime_sent : "2023-09-20T11:05:35.548Z"
/// device_datetime_used : "2023-09-20 11:05:35"

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
