/// message : "User added successfully"
/// data : {"name":"mohammed","phone":"+970595236275","email":"m.s@gmail.com","password":"$2y$10$bjD2.DwGJ664Hu2jqFB9aOC1aTWc9hcTB9R4jpAb7Sgl1oZMKBpzK","api_token":"WfMPDEUSuOQupPAa3PZUyOz3J0LVoll9BcqWSfYaPrM0mLL62LygsduvZEmb","firebase_uid":"jEB3TTj1znffCfJPXRkJj5cXwVo1","updated_at":"2023-08-28T11:36:40.000000Z","created_at":"2023-08-28T11:36:40.000000Z","id":28}
/// status : 200

class RegisterModel {
  RegisterModel({
      String? message, 
      Data? data, 
      num? status,}){
    _message = message;
    _data = data;
    _status = status;
}

  RegisterModel.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
  }
  String? _message;
  Data? _data;
  num? _status;
RegisterModel copyWith({  String? message,
  Data? data,
  num? status,
}) => RegisterModel(  message: message ?? _message,
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

/// name : "mohammed"
/// phone : "+970595236275"
/// email : "m.s@gmail.com"
/// password : "$2y$10$bjD2.DwGJ664Hu2jqFB9aOC1aTWc9hcTB9R4jpAb7Sgl1oZMKBpzK"
/// api_token : "WfMPDEUSuOQupPAa3PZUyOz3J0LVoll9BcqWSfYaPrM0mLL62LygsduvZEmb"
/// firebase_uid : "jEB3TTj1znffCfJPXRkJj5cXwVo1"
/// updated_at : "2023-08-28T11:36:40.000000Z"
/// created_at : "2023-08-28T11:36:40.000000Z"
/// id : 28

class Data {
  Data({
      String? name, 
      String? phone, 
      String? email, 
      String? password, 
      String? apiToken, 
      String? firebaseUid, 
      String? updatedAt, 
      String? createdAt, 
      num? id,}){
    _name = name;
    _phone = phone;
    _email = email;
    _password = password;
    _apiToken = apiToken;
    _firebaseUid = firebaseUid;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    _password = json['password'];
    _apiToken = json['api_token'];
    _firebaseUid = json['firebase_uid'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _name;
  String? _phone;
  String? _email;
  String? _password;
  String? _apiToken;
  String? _firebaseUid;
  String? _updatedAt;
  String? _createdAt;
  num? _id;
Data copyWith({  String? name,
  String? phone,
  String? email,
  String? password,
  String? apiToken,
  String? firebaseUid,
  String? updatedAt,
  String? createdAt,
  num? id,
}) => Data(  name: name ?? _name,
  phone: phone ?? _phone,
  email: email ?? _email,
  password: password ?? _password,
  apiToken: apiToken ?? _apiToken,
  firebaseUid: firebaseUid ?? _firebaseUid,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
);
  String? get name => _name;
  String? get phone => _phone;
  String? get email => _email;
  String? get password => _password;
  String? get apiToken => _apiToken;
  String? get firebaseUid => _firebaseUid;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['phone'] = _phone;
    map['email'] = _email;
    map['password'] = _password;
    map['api_token'] = _apiToken;
    map['firebase_uid'] = _firebaseUid;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}