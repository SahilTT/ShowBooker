/// cinemas : [{"cinema_id":10636,"cinema_name":"Cinema 6","address":"Jetty","address2":"address2","city":"city","state":"State","county":"county","postcode":"Zip","lat":-22.680721,"lng":14.519094,"distance":57.55892076987,"logo_url":"https://assets.movieglu.com/chain_logos/xx/UK-0-sq.jpg"},{"cinema_id":42963,"cinema_name":"Cinema 7","address":"Welwitschia Plains","address2":"address2","city":"city","state":"State","county":"county","postcode":"Zip","lat":-22.669146,"lng":15.028214,"distance":80.352112347501,"logo_url":"https://assets.movieglu.com/chain_logos/xx/UK-0-sq.jpg"},{"cinema_id":45353,"cinema_name":"Cinema 8","address":"Eduard Bohlen","address2":"address2","city":"city","state":"State","county":"county","postcode":"Zip","lat":-23.996033,"lng":14.457391,"distance":140.95552847269,"logo_url":"https://assets.movieglu.com/chain_logos/xx/UK-0-sq.jpg"},{"cinema_id":8845,"cinema_name":"Cinema 2","address":"Deadvlei","address2":"address2","city":"city","state":"State","county":"county","postcode":"Zip","lat":-24.759233,"lng":15.292389,"distance":207.52516109344,"logo_url":"https://assets.movieglu.com/chain_logos/xx/UK-1-sq.jpg"},{"cinema_id":9435,"cinema_name":"Cinema 5","address":"Sesriem Canyon","address2":"address2","city":"city","state":"State","county":"county","postcode":"Zip","lat":-24.519194,"lng":15.790539,"distance":207.88720228852,"logo_url":"https://assets.movieglu.com/chain_logos/xx/UK-1-sq.jpg"}]
/// status : {"count":5,"state":"OK","method":"cinemasNearby","message":null,"request_method":"GET","version":"NA_31_XXv200","territory":"XX","device_datetime_sent":"2023-09-13T11:46:55.123Z","device_datetime_used":"2023-09-13 11:46:55"}

class NearByCineamResponse {
  NearByCineamResponse({
      List<Cinemas>? cinemas, 
      Status? status,}){
    _cinemas = cinemas;
    _status = status;
}

  NearByCineamResponse.fromJson(dynamic json) {
    if (json['cinemas'] != null) {
      _cinemas = [];
      json['cinemas'].forEach((v) {
        _cinemas?.add(Cinemas.fromJson(v));
      });
    }
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }
  List<Cinemas>? _cinemas;
  Status? _status;

  List<Cinemas>? get cinemas => _cinemas;
  Status? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_cinemas != null) {
      map['cinemas'] = _cinemas?.map((v) => v.toJson()).toList();
    }
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    return map;
  }

}

/// count : 5
/// state : "OK"
/// method : "cinemasNearby"
/// message : null
/// request_method : "GET"
/// version : "NA_31_XXv200"
/// territory : "XX"
/// device_datetime_sent : "2023-09-13T11:46:55.123Z"
/// device_datetime_used : "2023-09-13 11:46:55"

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

/// cinema_id : 10636
/// cinema_name : "Cinema 6"
/// address : "Jetty"
/// address2 : "address2"
/// city : "city"
/// state : "State"
/// county : "county"
/// postcode : "Zip"
/// lat : -22.680721
/// lng : 14.519094
/// distance : 57.55892076987
/// logo_url : "https://assets.movieglu.com/chain_logos/xx/UK-0-sq.jpg"

class Cinemas {
  Cinemas({
      num? cinemaId, 
      String? cinemaName, 
      String? address, 
      String? address2, 
      String? city, 
      String? state, 
      String? county, 
      String? postcode, 
      num? lat, 
      num? lng, 
      num? distance, 
      String? logoUrl,}){
    _cinemaId = cinemaId;
    _cinemaName = cinemaName;
    _address = address;
    _address2 = address2;
    _city = city;
    _state = state;
    _county = county;
    _postcode = postcode;
    _lat = lat;
    _lng = lng;
    _distance = distance;
    _logoUrl = logoUrl;
}

  Cinemas.fromJson(dynamic json) {
    _cinemaId = json['cinema_id'];
    _cinemaName = json['cinema_name'];
    _address = json['address'];
    _address2 = json['address2'];
    _city = json['city'];
    _state = json['state'];
    _county = json['county'];
    _postcode = json['postcode'];
    _lat = json['lat'];
    _lng = json['lng'];
    _distance = json['distance'];
    _logoUrl = json['logo_url'];
  }
  num? _cinemaId;
  String? _cinemaName;
  String? _address;
  String? _address2;
  String? _city;
  String? _state;
  String? _county;
  String? _postcode;
  num? _lat;
  num? _lng;
  num? _distance;
  String? _logoUrl;

  num? get cinemaId => _cinemaId;
  String? get cinemaName => _cinemaName;
  String? get address => _address;
  String? get address2 => _address2;
  String? get city => _city;
  String? get state => _state;
  String? get county => _county;
  String? get postcode => _postcode;
  num? get lat => _lat;
  num? get lng => _lng;
  num? get distance => _distance;
  String? get logoUrl => _logoUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cinema_id'] = _cinemaId;
    map['cinema_name'] = _cinemaName;
    map['address'] = _address;
    map['address2'] = _address2;
    map['city'] = _city;
    map['state'] = _state;
    map['county'] = _county;
    map['postcode'] = _postcode;
    map['lat'] = _lat;
    map['lng'] = _lng;
    map['distance'] = _distance;
    map['logo_url'] = _logoUrl;
    return map;
  }

}