import 'package:get/get_rx/src/rx_types/rx_types.dart';

/// message : "Contacts"
/// data : [{"phone":"+972531950244","status":"found","user_data":{"id":4,"name":"bbbbb","phone":"+972531950244","email":"bbbbb@gmail.com","avatar":null,"password":"$2y$10$u7cAt1EcJjwIBVL8HBnh3uwxAWZ.HwMS3i/nxdjURY3Xbi46UN3ta","api_token":"QSu4ybsvtNsuGrWfgeUEuPoa4L3DWSNAqNDNIgluDjxv9TirYiWlv11VMfwW","created_at":"2023-08-10T09:22:50.000000Z","updated_at":"2023-08-10T10:58:10.000000Z","firebase_uid":"9ekDl31M5PUbnw4oCmGb0jUaajs1","fcm_token":null,"type":"member","points":null,"team_id":null,"contacts":null}}]
/// status : 200

class AllContactModel {
  AllContactModel({
      String? message, 
      List<Data>? data, 
      num? status,}){
    _message = message;
    _data = data;
    _status = status;
}

  AllContactModel.fromJson(dynamic json) {
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _status = json['status'];
  }
  String? _message;
  List<Data>? _data;
  num? _status;
AllContactModel copyWith({  String? message,
  List<Data>? data,
  num? status,
}) => AllContactModel(  message: message ?? _message,
  data: data ?? _data,
  status: status ?? _status,
);
  String? get message => _message;
  List<Data>? get data => _data;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }

}

/// phone : "+972531950244"
/// status : "found"
/// user_data : {"id":4,"name":"bbbbb","phone":"+972531950244","email":"bbbbb@gmail.com","avatar":null,"password":"$2y$10$u7cAt1EcJjwIBVL8HBnh3uwxAWZ.HwMS3i/nxdjURY3Xbi46UN3ta","api_token":"QSu4ybsvtNsuGrWfgeUEuPoa4L3DWSNAqNDNIgluDjxv9TirYiWlv11VMfwW","created_at":"2023-08-10T09:22:50.000000Z","updated_at":"2023-08-10T10:58:10.000000Z","firebase_uid":"9ekDl31M5PUbnw4oCmGb0jUaajs1","fcm_token":null,"type":"member","points":null,"team_id":null,"contacts":null}

class Data {
  Data({
      String? phone, 
      String? status, 
      UserData? userData,}){
    _phone = phone;
    _status = status;
    _userData = userData;
}

  Data.fromJson(dynamic json) {
    _phone = json['phone'];
    _status = json['status'];
    _userData = json['user_data'] != null ? UserData.fromJson(json['user_data']) : null;
  }
  String? _phone;
  String? _status;
  UserData? _userData;
  RxBool isCheck = false.obs;
Data copyWith({  String? phone,
  String? status,
  UserData? userData,
}) => Data(  phone: phone ?? _phone,
  status: status ?? _status,
  userData: userData ?? _userData,
);
  String? get phone => _phone;
  String? get status => _status;
  UserData? get userData => _userData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = _phone;
    map['status'] = _status;
    if (_userData != null) {
      map['user_data'] = _userData?.toJson();
    }
    return map;
  }

}

/// id : 4
/// name : "bbbbb"
/// phone : "+972531950244"
/// email : "bbbbb@gmail.com"
/// avatar : null
/// password : "$2y$10$u7cAt1EcJjwIBVL8HBnh3uwxAWZ.HwMS3i/nxdjURY3Xbi46UN3ta"
/// api_token : "QSu4ybsvtNsuGrWfgeUEuPoa4L3DWSNAqNDNIgluDjxv9TirYiWlv11VMfwW"
/// created_at : "2023-08-10T09:22:50.000000Z"
/// updated_at : "2023-08-10T10:58:10.000000Z"
/// firebase_uid : "9ekDl31M5PUbnw4oCmGb0jUaajs1"
/// fcm_token : null
/// type : "member"
/// points : null
/// team_id : null
/// contacts : null

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
      dynamic teamId, 
      dynamic contacts,}){
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
  dynamic _teamId;
  dynamic _contacts;
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
  dynamic teamId,
  dynamic contacts,
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
  dynamic get teamId => _teamId;
  dynamic get contacts => _contacts;

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
    return map;
  }

}