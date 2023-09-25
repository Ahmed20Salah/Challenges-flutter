/// message : "My Team Page data"
/// User_team : {"document_id":"316afb7da7914d959310","id":2,"name":"team4 update","image":null}
/// Challenges : [{"id":2,"title":"challenge1","type":"private","latitude":"-29.04","longitude":"135.53","team_id":2,"refree_id":null,"category_id":2,"date":"2023-08-15","distance":"5","stepsNum":"3000","created_at":"2023-09-17T11:51:32.000000Z","updated_at":"2023-09-17T11:51:32.000000Z","start_time":"2023-08-15 14:30:00","end_time":"2023-08-16 14:30:00","opponent_id":null,"prize":null,"document_id":"3c9f42002a4d478f8c20","image":null,"status":"created"},{"id":3,"title":"challenge1","type":"private","latitude":"-29.04","longitude":"135.53","team_id":2,"refree_id":7,"category_id":1,"date":"2023-08-15","distance":null,"stepsNum":null,"created_at":"2023-09-17T12:02:49.000000Z","updated_at":"2023-09-17T12:09:50.000000Z","start_time":"2023-08-15 14:30:00","end_time":"2023-08-16 14:30:00","opponent_id":1,"prize":null,"document_id":"dbd0082b7bc5402abc02","image":null,"status":"ended"}]
/// Members : [{"id":7,"name":"bfcbhfvfc","avatar":null,"uid":"jcxxaIstg4QF7ovTiNxT2G4o4Ta2"},{"id":8,"name":"user8","avatar":null,"uid":"JdcLlmxGwHXcmrHhBPLTO2eaT7s2"}]
/// status : 200

class TeamDetailsModel {
  TeamDetailsModel({
      String? message, 
      UserTeam? userTeam, 
      List<Challenges>? challenges, 
      List<Members>? members, 
      num? status,}){
    _message = message;
    _userTeam = userTeam;
    _challenges = challenges;
    _members = members;
    _status = status;
}

  TeamDetailsModel.fromJson(dynamic json) {
    _message = json['message'];
    _userTeam = json['User_team'] != null ? UserTeam.fromJson(json['User_team']) : null;
    if (json['Challenges'] != null) {
      _challenges = [];
      json['Challenges'].forEach((v) {
        _challenges?.add(Challenges.fromJson(v));
      });
    }
    if (json['Members'] != null) {
      _members = [];
      json['Members'].forEach((v) {
        _members?.add(Members.fromJson(v));
      });
    }
    _status = json['status'];
  }
  String? _message;
  UserTeam? _userTeam;
  List<Challenges>? _challenges;
  List<Members>? _members;
  num? _status;
TeamDetailsModel copyWith({  String? message,
  UserTeam? userTeam,
  List<Challenges>? challenges,
  List<Members>? members,
  num? status,
}) => TeamDetailsModel(  message: message ?? _message,
  userTeam: userTeam ?? _userTeam,
  challenges: challenges ?? _challenges,
  members: members ?? _members,
  status: status ?? _status,
);
  String? get message => _message;
  UserTeam? get userTeam => _userTeam;
  List<Challenges>? get challenges => _challenges;
  List<Members>? get members => _members;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_userTeam != null) {
      map['User_team'] = _userTeam?.toJson();
    }
    if (_challenges != null) {
      map['Challenges'] = _challenges?.map((v) => v.toJson()).toList();
    }
    if (_members != null) {
      map['Members'] = _members?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }

}

/// id : 7
/// name : "bfcbhfvfc"
/// avatar : null
/// uid : "jcxxaIstg4QF7ovTiNxT2G4o4Ta2"

class Members {
  Members({
      num? id, 
      String? name, 
      dynamic avatar, 
      String? uid,}){
    _id = id;
    _name = name;
    _avatar = avatar;
    _uid = uid;
}

  Members.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _avatar = json['avatar'];
    _uid = json['uid'];
  }
  num? _id;
  String? _name;
  dynamic _avatar;
  String? _uid;
Members copyWith({  num? id,
  String? name,
  dynamic avatar,
  String? uid,
}) => Members(  id: id ?? _id,
  name: name ?? _name,
  avatar: avatar ?? _avatar,
  uid: uid ?? _uid,
);
  num? get id => _id;
  String? get name => _name;
  dynamic get avatar => _avatar;
  String? get uid => _uid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['avatar'] = _avatar;
    map['uid'] = _uid;
    return map;
  }

}

/// id : 2
/// title : "challenge1"
/// type : "private"
/// latitude : "-29.04"
/// longitude : "135.53"
/// team_id : 2
/// refree_id : null
/// category_id : 2
/// date : "2023-08-15"
/// distance : "5"
/// stepsNum : "3000"
/// created_at : "2023-09-17T11:51:32.000000Z"
/// updated_at : "2023-09-17T11:51:32.000000Z"
/// start_time : "2023-08-15 14:30:00"
/// end_time : "2023-08-16 14:30:00"
/// opponent_id : null
/// prize : null
/// document_id : "3c9f42002a4d478f8c20"
/// image : null
/// status : "created"

class Challenges {
  Challenges({
      num? id, 
      String? title, 
      String? type, 
      String? latitude, 
      String? longitude, 
      num? teamId, 
      dynamic refreeId, 
      num? categoryId, 
      String? date, 
      String? distance, 
      String? stepsNum, 
      String? createdAt, 
      String? updatedAt, 
      String? startTime, 
      String? endTime, 
      dynamic opponentId, 
      dynamic prize, 
      String? documentId, 
      dynamic image, 
      String? status,}){
    _id = id;
    _title = title;
    _type = type;
    _latitude = latitude;
    _longitude = longitude;
    _teamId = teamId;
    _refreeId = refreeId;
    _categoryId = categoryId;
    _date = date;
    _distance = distance;
    _stepsNum = stepsNum;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _startTime = startTime;
    _endTime = endTime;
    _opponentId = opponentId;
    _prize = prize;
    _documentId = documentId;
    _image = image;
    _status = status;
}

  Challenges.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _type = json['type'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _teamId = json['team_id'];
    _refreeId = json['refree_id'];
    _categoryId = json['category_id'];
    _date = json['date'];
    _distance = json['distance'];
    _stepsNum = json['stepsNum'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _opponentId = json['opponent_id'];
    _prize = json['prize'];
    _documentId = json['document_id'];
    _image = json['image'];
    _status = json['status'];
  }
  num? _id;
  String? _title;
  String? _type;
  String? _latitude;
  String? _longitude;
  num? _teamId;
  dynamic _refreeId;
  num? _categoryId;
  String? _date;
  String? _distance;
  String? _stepsNum;
  String? _createdAt;
  String? _updatedAt;
  String? _startTime;
  String? _endTime;
  dynamic _opponentId;
  dynamic _prize;
  String? _documentId;
  dynamic _image;
  String? _status;
Challenges copyWith({  num? id,
  String? title,
  String? type,
  String? latitude,
  String? longitude,
  num? teamId,
  dynamic refreeId,
  num? categoryId,
  String? date,
  String? distance,
  String? stepsNum,
  String? createdAt,
  String? updatedAt,
  String? startTime,
  String? endTime,
  dynamic opponentId,
  dynamic prize,
  String? documentId,
  dynamic image,
  String? status,
}) => Challenges(  id: id ?? _id,
  title: title ?? _title,
  type: type ?? _type,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  teamId: teamId ?? _teamId,
  refreeId: refreeId ?? _refreeId,
  categoryId: categoryId ?? _categoryId,
  date: date ?? _date,
  distance: distance ?? _distance,
  stepsNum: stepsNum ?? _stepsNum,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  startTime: startTime ?? _startTime,
  endTime: endTime ?? _endTime,
  opponentId: opponentId ?? _opponentId,
  prize: prize ?? _prize,
  documentId: documentId ?? _documentId,
  image: image ?? _image,
  status: status ?? _status,
);
  num? get id => _id;
  String? get title => _title;
  String? get type => _type;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  num? get teamId => _teamId;
  dynamic get refreeId => _refreeId;
  num? get categoryId => _categoryId;
  String? get date => _date;
  String? get distance => _distance;
  String? get stepsNum => _stepsNum;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  dynamic get opponentId => _opponentId;
  dynamic get prize => _prize;
  String? get documentId => _documentId;
  dynamic get image => _image;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['type'] = _type;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['team_id'] = _teamId;
    map['refree_id'] = _refreeId;
    map['category_id'] = _categoryId;
    map['date'] = _date;
    map['distance'] = _distance;
    map['stepsNum'] = _stepsNum;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['opponent_id'] = _opponentId;
    map['prize'] = _prize;
    map['document_id'] = _documentId;
    map['image'] = _image;
    map['status'] = _status;
    return map;
  }

}

/// document_id : "316afb7da7914d959310"
/// id : 2
/// name : "team4 update"
/// image : null

class UserTeam {
  UserTeam({
      String? documentId, 
      num? id, 
      String? name, 
      dynamic image,}){
    _documentId = documentId;
    _id = id;
    _name = name;
    _image = image;
}

  UserTeam.fromJson(dynamic json) {
    _documentId = json['document_id'];
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
  }
  String? _documentId;
  num? _id;
  String? _name;
  dynamic _image;
UserTeam copyWith({  String? documentId,
  num? id,
  String? name,
  dynamic image,
}) => UserTeam(  documentId: documentId ?? _documentId,
  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
);
  String? get documentId => _documentId;
  num? get id => _id;
  String? get name => _name;
  dynamic get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['document_id'] = _documentId;
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }

}