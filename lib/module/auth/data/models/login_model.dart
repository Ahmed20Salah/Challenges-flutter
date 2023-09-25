/// message : "User login successfully."
/// data : {"id":7,"name":"imaaaaaaan","phone":"+972531950233","email":"imaaaaaaan@gmail.com","avatar":null,"password":"$2y$10$LQNu66IC0.rxTuNK4rJDre2gOQ9wR.8.ovM1ltyb0rUqMgEXX8A2.","api_token":"Ge1zUgAARQiAdVXTbzd5bFWctz2tkr7W3VuewKukJu2ir0vQLoPON2X2QdkM","created_at":"2023-08-10T10:57:47.000000Z","updated_at":"2023-08-30T13:15:28.000000Z","firebase_uid":"ThDLweS25xMgUXutK4nYIrREdAl1","fcm_token":null,"type":"leader","points":null,"team_id":4}
/// status : 200

class LoginModel {
  LoginModel({
      String? message, 
      Data? data, 
      num? status,}){
    _message = message;
    _data = data;
    _status = status;
}

  LoginModel.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
  }
  String? _message;
  Data? _data;
  num? _status;
LoginModel copyWith({  String? message,
  Data? data,
  num? status,
}) => LoginModel(  message: message ?? _message,
  data: data ?? _data,
  status: status ?? _status,
);
  String? get message => _message;
  Data? get data => _data;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['status'] = _status;
    return map;
  }

}

/// id : 7
/// name : "imaaaaaaan"
/// phone : "+972531950233"
/// email : "imaaaaaaan@gmail.com"
/// avatar : null
/// password : "$2y$10$LQNu66IC0.rxTuNK4rJDre2gOQ9wR.8.ovM1ltyb0rUqMgEXX8A2."
/// api_token : "Ge1zUgAARQiAdVXTbzd5bFWctz2tkr7W3VuewKukJu2ir0vQLoPON2X2QdkM"
/// created_at : "2023-08-10T10:57:47.000000Z"
/// updated_at : "2023-08-30T13:15:28.000000Z"
/// firebase_uid : "ThDLweS25xMgUXutK4nYIrREdAl1"
/// fcm_token : null
/// type : "leader"
/// points : null
/// team_id : 4

class Data {
  Data({
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
      num? teamId,}){
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
}

  Data.fromJson(dynamic json) {
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
Data copyWith({  num? id,
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
}) => Data(  id: id ?? _id,
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
    return map;
  }

}