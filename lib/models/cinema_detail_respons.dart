/// cinema_id : 8795
/// cinema_name : "ODEON Leicester Square"
/// address : "24-26 Leicester Square"
/// address2 : "Westminster"
/// city : "London"
/// county : "Greater London"
/// country : "GBR"
/// postcode : "WC2H 7JY"
/// phone : "(0871) 224 4007"
/// lat : 51.510479
/// lng : -0.12952
/// distance : 69.091511207949
/// ticketing : 0
/// directions : ""
/// logo_url : "https://d2z9fe5yu2p0av.cloudfront.net/chainlogos/uk/UK-614-sq.jpg"
/// show_dates : [{"date":"2017-02-08"},{"date":"2017-02-09"},{"date":"2017-02-10"},{"date":"2017-02-11"},{"date":"2017-02-12"},{"date":"2017-02-13"},{"date":"2017-02-14"}]
/// status : {"count":1,"state":"OK","method":"cinemaDetails","message":null,"request_method":"GET","version":"MGv200","territory":"UK","device_datetime_sent":"2018-09-14T14:03:40.979Z","device_datetime_used":"2018-09-14 14:03:40"}

class CinemaDetailRespons {
  CinemaDetailRespons({
      num? cinemaId, 
      String? cinemaName, 
      String? address, 
      String? address2, 
      String? city, 
      String? county, 
      String? country, 
      String? postcode, 
      String? phone, 
      num? lat, 
      num? lng, 
      num? distance, 
      num? ticketing, 
      String? directions, 
      String? logoUrl, 
      List<ShowDates>? showDates, 
      Status? status,}){
    _cinemaId = cinemaId;
    _cinemaName = cinemaName;
    _address = address;
    _address2 = address2;
    _city = city;
    _county = county;
    _country = country;
    _postcode = postcode;
    _phone = phone;
    _lat = lat;
    _lng = lng;
    _distance = distance;
    _ticketing = ticketing;
    _directions = directions;
    _logoUrl = logoUrl;
    _showDates = showDates;
    _status = status;
}

  CinemaDetailRespons.fromJson(dynamic json) {
    _cinemaId = json['cinema_id'];
    _cinemaName = json['cinema_name'];
    _address = json['address'];
    _address2 = json['address2'];
    _city = json['city'];
    _county = json['county'];
    _country = json['country'];
    _postcode = json['postcode'];
    _phone = json['phone'];
    _lat = json['lat'];
    _lng = json['lng'];
    _distance = json['distance'];
    _ticketing = json['ticketing'];
    _directions = json['directions'];
    _logoUrl = json['logo_url'];
    if (json['show_dates'] != null) {
      _showDates = [];
      json['show_dates'].forEach((v) {
        _showDates?.add(ShowDates.fromJson(v));
      });
    }
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }
  num? _cinemaId;
  String? _cinemaName;
  String? _address;
  String? _address2;
  String? _city;
  String? _county;
  String? _country;
  String? _postcode;
  String? _phone;
  num? _lat;
  num? _lng;
  num? _distance;
  num? _ticketing;
  String? _directions;
  String? _logoUrl;
  List<ShowDates>? _showDates;
  Status? _status;

  num? get cinemaId => _cinemaId;
  String? get cinemaName => _cinemaName;
  String? get address => _address;
  String? get address2 => _address2;
  String? get city => _city;
  String? get county => _county;
  String? get country => _country;
  String? get postcode => _postcode;
  String? get phone => _phone;
  num? get lat => _lat;
  num? get lng => _lng;
  num? get distance => _distance;
  num? get ticketing => _ticketing;
  String? get directions => _directions;
  String? get logoUrl => _logoUrl;
  List<ShowDates>? get showDates => _showDates;
  Status? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cinema_id'] = _cinemaId;
    map['cinema_name'] = _cinemaName;
    map['address'] = _address;
    map['address2'] = _address2;
    map['city'] = _city;
    map['county'] = _county;
    map['country'] = _country;
    map['postcode'] = _postcode;
    map['phone'] = _phone;
    map['lat'] = _lat;
    map['lng'] = _lng;
    map['distance'] = _distance;
    map['ticketing'] = _ticketing;
    map['directions'] = _directions;
    map['logo_url'] = _logoUrl;
    if (_showDates != null) {
      map['show_dates'] = _showDates?.map((v) => v.toJson()).toList();
    }
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    return map;
  }

}

/// count : 1
/// state : "OK"
/// method : "cinemaDetails"
/// message : null
/// request_method : "GET"
/// version : "MGv200"
/// territory : "UK"
/// device_datetime_sent : "2018-09-14T14:03:40.979Z"
/// device_datetime_used : "2018-09-14 14:03:40"

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
      String? deviceDatetimeUsed,}){
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

/// date : "2017-02-08"

class ShowDates {
  ShowDates({
      String? date,}){
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