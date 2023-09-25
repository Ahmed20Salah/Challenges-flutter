/// message : "User profile here"
/// user_data : {"id":10,"name":"Mohammed","phone":"+972595236275","email":"moh@gmail.com","avatar":null,"password":"$2y$10$J1WuhVpcvWxHMzC6sBX4Q.5iAEKWZWFMZC3zstSLP/4fS7sC6nfv6","api_token":"tEU33bLuNUJhL4hunXy4qPwTyqwjMtv2kiTSb5LEs3iG2YXZuczDTXJ7RNEv","created_at":"2023-09-14T13:39:21.000000Z","updated_at":"2023-09-23T09:21:52.000000Z","firebase_uid":"DRLEGpz3xKSdi2RyElmmlUCEVov1","fcm_token":null,"type":"leader","points":null,"team_id":13,"contacts":"[\"+972531950244\",\"+98745632101\",\"+972599229320\",\"+972599229820\",\"+972599221120\",\"+972598444111\",\"+972597723826\",\"+972599229320\",\"+972599229820\",\"+972599221120\",\"+972598444111\",\"+972597723826\",\"+972598415201\"]","team":{"id":13,"image":"images/rq6VQuxBquardzL7Jh1iK3VXJPcDvmR0wuHnV9bt.jpg","name":"team2","created_at":"2023-09-19T05:28:42.000000Z","updated_at":"2023-09-19T05:28:42.000000Z","firebase_document":"f3be96d6c4824a33a6a0"}}
/// challenges : [{"id":112,"title":"ttest3333","type":"private","latitude":"-29.04","longitude":"135.53","team_id":9,"refree_id":1,"category_id":1,"date":"2023-08-15","distance":null,"stepsNum":null,"created_at":"2023-09-06T08:07:15.000000Z","updated_at":"2023-09-06T08:07:15.000000Z","start_time":"2023-08-15 14:30:00","end_time":"2023-08-16 14:30:00","opponent_id":2,"prize":null,"document_id":"2b9f52c49ab84da28aad","image":null,"status":"created","category":{"id":1,"name":"Football","image":"categories/VdwM6itWJPFdnngR36nT5XoPeEpm4lQpEpvgl7a9.jpg","created_at":"2023-08-10T07:48:42.000000Z","updated_at":"2023-08-27T06:10:27.000000Z"},"team":{"id":9,"image":"images/sndoWf1SXO1U6rSG7Bi1w1Vzl1ySYUew4StPECe0.jpg","name":"test TeamUser","created_at":"2023-09-06T07:44:58.000000Z","updated_at":"2023-09-06T07:44:58.000000Z","firebase_document":"1f8003034a4f456a821f"}},{"id":113,"title":"ttest3333","type":"private","latitude":"-29.04","longitude":"135.53","team_id":9,"refree_id":null,"category_id":2,"date":"2023-08-15","distance":"5","stepsNum":"3000","created_at":"2023-09-06T08:07:25.000000Z","updated_at":"2023-09-06T08:07:25.000000Z","start_time":"2023-08-15 14:30:00","end_time":"2023-08-16 14:30:00","opponent_id":null,"prize":null,"document_id":"24ff98ac38d547a981a8","image":null,"status":"created","category":{"id":2,"name":"Running","image":"categories/yrfwbWvpvDgjrkHnYmy7OT6BDa5G03UgSLxRri0C.png","created_at":"2023-08-10T07:48:49.000000Z","updated_at":"2023-08-27T06:12:54.000000Z"},"team":{"id":9,"image":"images/sndoWf1SXO1U6rSG7Bi1w1Vzl1ySYUew4StPECe0.jpg","name":"test TeamUser","created_at":"2023-09-06T07:44:58.000000Z","updated_at":"2023-09-06T07:44:58.000000Z","firebase_document":"1f8003034a4f456a821f"}},{"id":117,"title":"ttest3333","type":"private","latitude":"-29.04","longitude":"135.53","team_id":9,"refree_id":null,"category_id":2,"date":"2023-08-15","distance":"5","stepsNum":"3000","created_at":"2023-09-06T09:21:16.000000Z","updated_at":"2023-09-06T09:21:16.000000Z","start_time":"2023-08-15 14:30:00","end_time":"2023-08-16 14:30:00","opponent_id":null,"prize":null,"document_id":"8aec1be70e2c4fc5ab53","image":null,"status":"created","category":{"id":2,"name":"Running","image":"categories/yrfwbWvpvDgjrkHnYmy7OT6BDa5G03UgSLxRri0C.png","created_at":"2023-08-10T07:48:49.000000Z","updated_at":"2023-08-27T06:12:54.000000Z"},"team":{"id":9,"image":"images/sndoWf1SXO1U6rSG7Bi1w1Vzl1ySYUew4StPECe0.jpg","name":"test TeamUser","created_at":"2023-09-06T07:44:58.000000Z","updated_at":"2023-09-06T07:44:58.000000Z","firebase_document":"1f8003034a4f456a821f"}},{"id":16,"title":"public test1","type":"public","latitude":"0.55","longitude":"0.26","team_id":null,"refree_id":null,"category_id":2,"date":"2023-08-15","distance":null,"stepsNum":null,"created_at":"2023-08-14T08:34:18.000000Z","updated_at":"2023-08-14T08:34:18.000000Z","start_time":"2023-08-15 14:30:00","end_time":"2023-08-15 14:30:00","opponent_id":null,"prize":"1$","document_id":null,"image":null,"status":"created","category":{"id":2,"name":"Running","image":"categories/yrfwbWvpvDgjrkHnYmy7OT6BDa5G03UgSLxRri0C.png","created_at":"2023-08-10T07:48:49.000000Z","updated_at":"2023-08-27T06:12:54.000000Z"}}]
/// status : 200

class ProfileModel {
  ProfileModel({
      String? message, 
      UserData? userData, 
      List<Challenges>? challenges, 
      num? status,}){
    _message = message;
    _userData = userData;
    _challenges = challenges;
    _status = status;
}

  ProfileModel.fromJson(dynamic json) {
    _message = json['message'];
    _userData = json['user_data'] != null ? UserData.fromJson(json['user_data']) : null;
    if (json['challenges'] != null) {
      _challenges = [];
      json['challenges'].forEach((v) {
        _challenges?.add(Challenges.fromJson(v));
      });
    }
    _status = json['status'];
  }
  String? _message;
  UserData? _userData;
  List<Challenges>? _challenges;
  num? _status;
ProfileModel copyWith({  String? message,
  UserData? userData,
  List<Challenges>? challenges,
  num? status,
}) => ProfileModel(  message: message ?? _message,
  userData: userData ?? _userData,
  challenges: challenges ?? _challenges,
  status: status ?? _status,
);
  String? get message => _message;
  UserData? get userData => _userData;
  List<Challenges>? get challenges => _challenges;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_userData != null) {
      map['user_data'] = _userData?.toJson();
    }
    if (_challenges != null) {
      map['challenges'] = _challenges?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }

}

/// id : 112
/// title : "ttest3333"
/// type : "private"
/// latitude : "-29.04"
/// longitude : "135.53"
/// team_id : 9
/// refree_id : 1
/// category_id : 1
/// date : "2023-08-15"
/// distance : null
/// stepsNum : null
/// created_at : "2023-09-06T08:07:15.000000Z"
/// updated_at : "2023-09-06T08:07:15.000000Z"
/// start_time : "2023-08-15 14:30:00"
/// end_time : "2023-08-16 14:30:00"
/// opponent_id : 2
/// prize : null
/// document_id : "2b9f52c49ab84da28aad"
/// image : null
/// status : "created"
/// category : {"id":1,"name":"Football","image":"categories/VdwM6itWJPFdnngR36nT5XoPeEpm4lQpEpvgl7a9.jpg","created_at":"2023-08-10T07:48:42.000000Z","updated_at":"2023-08-27T06:10:27.000000Z"}
/// team : {"id":9,"image":"images/sndoWf1SXO1U6rSG7Bi1w1Vzl1ySYUew4StPECe0.jpg","name":"test TeamUser","created_at":"2023-09-06T07:44:58.000000Z","updated_at":"2023-09-06T07:44:58.000000Z","firebase_document":"1f8003034a4f456a821f"}

class Challenges {
  Challenges({
      num? id, 
      String? title, 
      String? type, 
      String? latitude, 
      String? longitude, 
      num? teamId, 
      num? refreeId, 
      num? categoryId, 
      String? date, 
      dynamic distance, 
      dynamic stepsNum, 
      String? createdAt, 
      String? updatedAt, 
      String? startTime, 
      String? endTime, 
      num? opponentId, 
      dynamic prize, 
      String? documentId, 
      dynamic image, 
      String? status, 
      Category? category, 
      Team? team,}){
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
    _category = category;
    _team = team;
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
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
    _team = json['team'] != null ? Team.fromJson(json['team']) : null;
  }
  num? _id;
  String? _title;
  String? _type;
  String? _latitude;
  String? _longitude;
  num? _teamId;
  num? _refreeId;
  num? _categoryId;
  String? _date;
  dynamic _distance;
  dynamic _stepsNum;
  String? _createdAt;
  String? _updatedAt;
  String? _startTime;
  String? _endTime;
  num? _opponentId;
  dynamic _prize;
  String? _documentId;
  dynamic _image;
  String? _status;
  Category? _category;
  Team? _team;
Challenges copyWith({  num? id,
  String? title,
  String? type,
  String? latitude,
  String? longitude,
  num? teamId,
  num? refreeId,
  num? categoryId,
  String? date,
  dynamic distance,
  dynamic stepsNum,
  String? createdAt,
  String? updatedAt,
  String? startTime,
  String? endTime,
  num? opponentId,
  dynamic prize,
  String? documentId,
  dynamic image,
  String? status,
  Category? category,
  Team? team,
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
  category: category ?? _category,
  team: team ?? _team,
);
  num? get id => _id;
  String? get title => _title;
  String? get type => _type;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  num? get teamId => _teamId;
  num? get refreeId => _refreeId;
  num? get categoryId => _categoryId;
  String? get date => _date;
  dynamic get distance => _distance;
  dynamic get stepsNum => _stepsNum;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  num? get opponentId => _opponentId;
  dynamic get prize => _prize;
  String? get documentId => _documentId;
  dynamic get image => _image;
  String? get status => _status;
  Category? get category => _category;
  Team? get team => _team;

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
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    if (_team != null) {
      map['team'] = _team?.toJson();
    }
    return map;
  }

}

/// id : 9
/// image : "images/sndoWf1SXO1U6rSG7Bi1w1Vzl1ySYUew4StPECe0.jpg"
/// name : "test TeamUser"
/// created_at : "2023-09-06T07:44:58.000000Z"
/// updated_at : "2023-09-06T07:44:58.000000Z"
/// firebase_document : "1f8003034a4f456a821f"

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

/// id : 1
/// name : "Football"
/// image : "categories/VdwM6itWJPFdnngR36nT5XoPeEpm4lQpEpvgl7a9.jpg"
/// created_at : "2023-08-10T07:48:42.000000Z"
/// updated_at : "2023-08-27T06:10:27.000000Z"

class Category {
  Category({
      num? id, 
      String? name, 
      String? image, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
Category copyWith({  num? id,
  String? name,
  String? image,
  String? createdAt,
  String? updatedAt,
}) => Category(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
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
/// updated_at : "2023-09-23T09:21:52.000000Z"
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
