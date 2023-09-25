/// message : "User profile here"
/// user_data : {"id":10,"name":"Mohammed","phone":"+972595236275","email":"moh@gmail.com","avatar":null,"password":"$2y$10$J1WuhVpcvWxHMzC6sBX4Q.5iAEKWZWFMZC3zstSLP/4fS7sC6nfv6","api_token":"tEU33bLuNUJhL4hunXy4qPwTyqwjMtv2kiTSb5LEs3iG2YXZuczDTXJ7RNEv","created_at":"2023-09-14T13:39:21.000000Z","updated_at":"2023-09-20T12:50:39.000000Z","firebase_uid":"DRLEGpz3xKSdi2RyElmmlUCEVov1","fcm_token":null,"type":"leader","points":null,"team_id":13,"contacts":"[\"+972531950244\",\"+98745632101\",\"+972599229320\",\"+972599229820\",\"+972599221120\",\"+972598444111\",\"+972597723826\",\"+972599229320\",\"+972599229820\",\"+972599221120\",\"+972598444111\",\"+972597723826\",\"+972598415201\"]","team":{"id":13,"image":"images/rq6VQuxBquardzL7Jh1iK3VXJPcDvmR0wuHnV9bt.jpg","name":"team2","created_at":"2023-09-19T05:28:42.000000Z","updated_at":"2023-09-19T05:28:42.000000Z","firebase_document":"f3be96d6c4824a33a6a0"}}
/// status : 200

class UserModel {
  UserModel({
      String? message, 
      UserData? userData, 
      num? status,}){
    _message = message;
    _userData = userData;
    _status = status;
}

  UserModel.fromJson(dynamic json) {
    _message = json['message'];
    _userData = json['user_data'] != null ? UserData.fromJson(json['user_data']) : null;
    _status = json['status'];
  }
  String? _message;
  UserData? _userData;
  num? _status;
UserModel copyWith({  String? message,
  UserData? userData,
  num? status,
}) => UserModel(  message: message ?? _message,
  userData: userData ?? _userData,
  status: status ?? _status,
);
  String? get message => _message;
  UserData? get userData => _userData;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_userData != null) {
      map['user_data'] = _userData?.toJson();
    }
    map['status'] = _status;
    return map;
  }

}

/// id : 10
/// name : "Mohammed"
/// phone : "+972595236275"
/// email : "moh@gmail.com"
/// avatar : null
/// password : "$2y$10$J1WuhVpcvWxHMzC6sBX4Q.5iAEKWZWFMZC3zstSLP/4fS7sC6nfv6"
/// api_token : "tEU33bLuNUJhL4hunXy4qPwTyqwjMtv2kiTSb5LEs3iG2YXZuczDTXJ7RNEv"
/// created_at : "2023-09-14T13:39:21.000000Z"
/// updated_at : "2023-09-20T12:50:39.000000Z"
/// firebase_uid : "DRLEGpz3xKSdi2RyElmmlUCEVov1"
/// fcm_token : null
/// type : "leader"
/// points : null
/// team_id : 13
/// contacts : "[\"+972531950244\",\"+98745632101\",\"+972599229320\",\"+972599229820\",\"+972599221120\",\"+972598444111\",\"+972597723826\",\"+972599229320\",\"+972599229820\",\"+972599221120\",\"+972598444111\",\"+972597723826\",\"+972598415201\"]"
/// team : {"id":13,"image":"images/rq6VQuxBquardzL7Jh1iK3VXJPcDvmR0wuHnV9bt.jpg","name":"team2","created_at":"2023-09-19T05:28:42.000000Z","updated_at":"2023-09-19T05:28:42.000000Z","firebase_document":"f3be96d6c4824a33a6a0"}

class UserData {
  UserData({
      num? id, 
      String? name, 
      String? phone, 
      String? email, 
      dynamic avatar, 
      String? password, 
      String? apiToken, 
      String? createdAt, 
      String? updatedAt, 
      String? firebaseUid, 
      dynamic fcmToken, 
      String? type, 
      dynamic points, 
      num? teamId, 
      String? contacts, 
      Team? team,}){
    _id = id;
    _name = name;
    _phone = phone;
    _email = email;
    _avatar = avatar;
    _password = password;
    _apiToken = apiToken;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _firebaseUid = firebaseUid;
    _fcmToken = fcmToken;
    _type = type;
    _points = points;
    _teamId = teamId;
    _contacts = contacts;
    _team = team;
}

  UserData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    _avatar = json['avatar'];
    _password = json['password'];
    _apiToken = json['api_token'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _firebaseUid = json['firebase_uid'];
    _fcmToken = json['fcm_token'];
    _type = json['type'];
    _points = json['points'];
    _teamId = json['team_id'];
    _contacts = json['contacts'];
    _team = json['team'] != null ? Team.fromJson(json['team']) : null;
  }
  num? _id;
  String? _name;
  String? _phone;
  String? _email;
  dynamic _avatar;
  String? _password;
  String? _apiToken;
  String? _createdAt;
  String? _updatedAt;
  String? _firebaseUid;
  dynamic _fcmToken;
  String? _type;
  dynamic _points;
  num? _teamId;
  String? _contacts;
  Team? _team;
UserData copyWith({  num? id,
  String? name,
  String? phone,
  String? email,
  dynamic avatar,
  String? password,
  String? apiToken,
  String? createdAt,
  String? updatedAt,
  String? firebaseUid,
  dynamic fcmToken,
  String? type,
  dynamic points,
  num? teamId,
  String? contacts,
  Team? team,
}) => UserData(  id: id ?? _id,
  name: name ?? _name,
  phone: phone ?? _phone,
  email: email ?? _email,
  avatar: avatar ?? _avatar,
  password: password ?? _password,
  apiToken: apiToken ?? _apiToken,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  firebaseUid: firebaseUid ?? _firebaseUid,
  fcmToken: fcmToken ?? _fcmToken,
  type: type ?? _type,
  points: points ?? _points,
  teamId: teamId ?? _teamId,
  contacts: contacts ?? _contacts,
  team: team ?? _team,
);
  num? get id => _id;
  String? get name => _name;
  String? get phone => _phone;
  String? get email => _email;
  dynamic get avatar => _avatar;
  String? get password => _password;
  String? get apiToken => _apiToken;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get firebaseUid => _firebaseUid;
  dynamic get fcmToken => _fcmToken;
  String? get type => _type;
  dynamic get points => _points;
  num? get teamId => _teamId;
  String? get contacts => _contacts;
  Team? get team => _team;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['email'] = _email;
    map['avatar'] = _avatar;
    map['password'] = _password;
    map['api_token'] = _apiToken;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['firebase_uid'] = _firebaseUid;
    map['fcm_token'] = _fcmToken;
    map['type'] = _type;
    map['points'] = _points;
    map['team_id'] = _teamId;
    map['contacts'] = _contacts;
    if (_team != null) {
      map['team'] = _team?.toJson();
    }
    return map;
  }

}

/// id : 13
/// image : "images/rq6VQuxBquardzL7Jh1iK3VXJPcDvmR0wuHnV9bt.jpg"
/// name : "team2"
/// created_at : "2023-09-19T05:28:42.000000Z"
/// updated_at : "2023-09-19T05:28:42.000000Z"
/// firebase_document : "f3be96d6c4824a33a6a0"

class Team {
  Team({
      num? id, 
      String? image, 
      String? name, 
      String? createdAt, 
      String? updatedAt, 
      String? firebaseDocument,}){
    _id = id;
    _image = image;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _firebaseDocument = firebaseDocument;
}

  Team.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _firebaseDocument = json['firebase_document'];
  }
  num? _id;
  String? _image;
  String? _name;
  String? _createdAt;
  String? _updatedAt;
  String? _firebaseDocument;
Team copyWith({  num? id,
  String? image,
  String? name,
  String? createdAt,
  String? updatedAt,
  String? firebaseDocument,
}) => Team(  id: id ?? _id,
  image: image ?? _image,
  name: name ?? _name,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  firebaseDocument: firebaseDocument ?? _firebaseDocument,
);
  num? get id => _id;
  String? get image => _image;
  String? get name => _name;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get firebaseDocument => _firebaseDocument;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['name'] = _name;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['firebase_document'] = _firebaseDocument;
    return map;
  }

}