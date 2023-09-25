/// message : "Challenge added successfully"
/// data : {"title":"challenge1","type":"private","latitude":"-29.03610698242562","longitude":"135.526421875","category":"2","refree_id":null,"opponent_id":null,"teamID":"316afb7da7914d959310","start_time":"2023-08-15 14:30:00","end_time":"2023-08-16 14:30:00","date":"2023-08-15","stepsNum":"3000","distance":"5"}
/// document_id : "3c9f42002a4d478f8c20"
/// challenge_name : "Running"
/// status : 200

class CreateChallengeModel {
  CreateChallengeModel({
      String? message, 
      Data? data, 
      String? documentId, 
      String? challengeName, 
      num? status,}){
    _message = message;
    _data = data;
    _documentId = documentId;
    _challengeName = challengeName;
    _status = status;
}

  CreateChallengeModel.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _documentId = json['document_id'];
    _challengeName = json['challenge_name'];
    _status = json['status'];
  }
  String? _message;
  Data? _data;
  String? _documentId;
  String? _challengeName;
  num? _status;
CreateChallengeModel copyWith({  String? message,
  Data? data,
  String? documentId,
  String? challengeName,
  num? status,
}) => CreateChallengeModel(  message: message ?? _message,
  data: data ?? _data,
  documentId: documentId ?? _documentId,
  challengeName: challengeName ?? _challengeName,
  status: status ?? _status,
);
  String? get message => _message;
  Data? get data => _data;
  String? get documentId => _documentId;
  String? get challengeName => _challengeName;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['document_id'] = _documentId;
    map['challenge_name'] = _challengeName;
    map['status'] = _status;
    return map;
  }

}

/// title : "challenge1"
/// type : "private"
/// latitude : "-29.03610698242562"
/// longitude : "135.526421875"
/// category : "2"
/// refree_id : null
/// opponent_id : null
/// teamID : "316afb7da7914d959310"
/// start_time : "2023-08-15 14:30:00"
/// end_time : "2023-08-16 14:30:00"
/// date : "2023-08-15"
/// stepsNum : "3000"
/// distance : "5"

class Data {
  Data({
      String? title, 
      String? type, 
      String? latitude, 
      String? longitude, 
      String? category, 
      dynamic refreeId, 
      dynamic opponentId, 
      String? teamID, 
      String? startTime, 
      String? endTime, 
      String? date, 
      String? stepsNum, 
      String? distance,}){
    _title = title;
    _type = type;
    _latitude = latitude;
    _longitude = longitude;
    _category = category;
    _refreeId = refreeId;
    _opponentId = opponentId;
    _teamID = teamID;
    _startTime = startTime;
    _endTime = endTime;
    _date = date;
    _stepsNum = stepsNum;
    _distance = distance;
}

  Data.fromJson(dynamic json) {
    _title = json['title'];
    _type = json['type'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _category = json['category'];
    _refreeId = json['refree_id'];
    _opponentId = json['opponent_id'];
    _teamID = json['teamID'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _date = json['date'];
    _stepsNum = json['stepsNum'];
    _distance = json['distance'];
  }
  String? _title;
  String? _type;
  String? _latitude;
  String? _longitude;
  String? _category;
  dynamic _refreeId;
  dynamic _opponentId;
  String? _teamID;
  String? _startTime;
  String? _endTime;
  String? _date;
  String? _stepsNum;
  String? _distance;
Data copyWith({  String? title,
  String? type,
  String? latitude,
  String? longitude,
  String? category,
  dynamic refreeId,
  dynamic opponentId,
  String? teamID,
  String? startTime,
  String? endTime,
  String? date,
  String? stepsNum,
  String? distance,
}) => Data(  title: title ?? _title,
  type: type ?? _type,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  category: category ?? _category,
  refreeId: refreeId ?? _refreeId,
  opponentId: opponentId ?? _opponentId,
  teamID: teamID ?? _teamID,
  startTime: startTime ?? _startTime,
  endTime: endTime ?? _endTime,
  date: date ?? _date,
  stepsNum: stepsNum ?? _stepsNum,
  distance: distance ?? _distance,
);
  String? get title => _title;
  String? get type => _type;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get category => _category;
  dynamic get refreeId => _refreeId;
  dynamic get opponentId => _opponentId;
  String? get teamID => _teamID;
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  String? get date => _date;
  String? get stepsNum => _stepsNum;
  String? get distance => _distance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['type'] = _type;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['category'] = _category;
    map['refree_id'] = _refreeId;
    map['opponent_id'] = _opponentId;
    map['teamID'] = _teamID;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['date'] = _date;
    map['stepsNum'] = _stepsNum;
    map['distance'] = _distance;
    return map;
  }

}