/// message : "User challenges here "
/// User challenges : [{"id":10,"title":"MTSH","type":"private","latitude":"31.52","longitude":"31.52","team_id":13,"refree_id":null,"category_id":2,"distance":"1222222","stepsNum":"342232","created_at":"2023-09-25T15:25:56.000000Z","updated_at":"2023-09-25T15:25:56.000000Z","start_time":"2023-09-25 18:25:00","end_time":"2023-09-26 18:25:00","opponent_id":null,"prize":null,"document_id":"858a02eda36e45719731","image":null,"status":"created","users_points":null,"winner_points":null,"result_data":null,"opponent_result":null,"category":{"id":2,"name":"Running","image":"categories/yyssCKJPQOLz1aYzCjPyB1mVCBEYC2q2EHoR6f1Q.png","created_at":"2023-09-14T12:16:22.000000Z","updated_at":"2023-09-14T12:16:22.000000Z"},"team":{"id":13,"image":"images/rq6VQuxBquardzL7Jh1iK3VXJPcDvmR0wuHnV9bt.jpg","name":"team2","created_at":"2023-09-19T05:28:42.000000Z","updated_at":"2023-09-19T05:28:42.000000Z","firebase_document":"f3be96d6c4824a33a6a0"},"opponent":{"id":13,"image":"images/rq6VQuxBquardzL7Jh1iK3VXJPcDvmR0wuHnV9bt.jpg","name":"team2","created_at":"2023-09-19T05:28:42.000000Z","updated_at":"2023-09-19T05:28:42.000000Z","firebase_document":"f3be96d6c4824a33a6a0"},"results":[{"id":2,"challenge_id":2,"user_id":7,"team_id":2,"result_data":"1000","created_at":"2023-09-17T11:55:05.000000Z","updated_at":"2023-09-17T11:55:05.000000Z","opponent_result":null}]},{"id":10,"title":"MTSH","type":"private","latitude":"31.52","longitude":"31.52","team_id":13,"refree_id":null,"category_id":2,"distance":"1222222","stepsNum":"342232","created_at":"2023-09-25T15:25:56.000000Z","updated_at":"2023-09-25T15:25:56.000000Z","start_time":"2023-09-25 18:25:00","end_time":"2023-09-26 18:25:00","opponent_id":null,"prize":null,"document_id":"858a02eda36e45719731","image":null,"status":"created","users_points":null,"winner_points":null,"result_data":null,"opponent_result":null,"category":{"id":2,"name":"Running","image":"categories/yyssCKJPQOLz1aYzCjPyB1mVCBEYC2q2EHoR6f1Q.png","created_at":"2023-09-14T12:16:22.000000Z","updated_at":"2023-09-14T12:16:22.000000Z"},"team":{"id":13,"image":"images/rq6VQuxBquardzL7Jh1iK3VXJPcDvmR0wuHnV9bt.jpg","name":"team2","created_at":"2023-09-19T05:28:42.000000Z","updated_at":"2023-09-19T05:28:42.000000Z","firebase_document":"f3be96d6c4824a33a6a0"},"opponent":{"id":13,"image":"images/rq6VQuxBquardzL7Jh1iK3VXJPcDvmR0wuHnV9bt.jpg","name":"team2","created_at":"2023-09-19T05:28:42.000000Z","updated_at":"2023-09-19T05:28:42.000000Z","firebase_document":"f3be96d6c4824a33a6a0"},"results":[{"id":2,"challenge_id":2,"user_id":7,"team_id":2,"result_data":"1000","created_at":"2023-09-17T11:55:05.000000Z","updated_at":"2023-09-17T11:55:05.000000Z","opponent_result":null}]}]
/// status : 200

class UserChallengesModel {
  UserChallengesModel({
      String? message, 
      List<UserChallenges>? userchallenges, 
      num? status,}){
    _message = message;
    _userchallenges = userchallenges;
    _status = status;
}

  UserChallengesModel.fromJson(dynamic json) {
    _message = json['message'];
    if (json['User challenges'] != null) {
      _userchallenges = [];
      json['User challenges'].forEach((v) {
        _userchallenges?.add(UserChallenges.fromJson(v));
      });
    }
    _status = json['status'];
  }
  String? _message;
  List<UserChallenges>? _userchallenges;
  num? _status;
UserChallengesModel copyWith({  String? message,
  List<UserChallenges>? userchallenges,
  num? status,
}) => UserChallengesModel(  message: message ?? _message,
  userchallenges: userchallenges ?? _userchallenges,
  status: status ?? _status,
);
  String? get message => _message;
  List<UserChallenges>? get userchallenges => _userchallenges;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_userchallenges != null) {
      map['User challenges'] = _userchallenges?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }

}

/// id : 10
/// title : "MTSH"
/// type : "private"
/// latitude : "31.52"
/// longitude : "31.52"
/// team_id : 13
/// refree_id : null
/// category_id : 2
/// distance : "1222222"
/// stepsNum : "342232"
/// created_at : "2023-09-25T15:25:56.000000Z"
/// updated_at : "2023-09-25T15:25:56.000000Z"
/// start_time : "2023-09-25 18:25:00"
/// end_time : "2023-09-26 18:25:00"
/// opponent_id : null
/// prize : null
/// document_id : "858a02eda36e45719731"
/// image : null
/// status : "created"
/// users_points : null
/// winner_points : null
/// result_data : null
/// opponent_result : null
/// category : {"id":2,"name":"Running","image":"categories/yyssCKJPQOLz1aYzCjPyB1mVCBEYC2q2EHoR6f1Q.png","created_at":"2023-09-14T12:16:22.000000Z","updated_at":"2023-09-14T12:16:22.000000Z"}
/// team : {"id":13,"image":"images/rq6VQuxBquardzL7Jh1iK3VXJPcDvmR0wuHnV9bt.jpg","name":"team2","created_at":"2023-09-19T05:28:42.000000Z","updated_at":"2023-09-19T05:28:42.000000Z","firebase_document":"f3be96d6c4824a33a6a0"}
/// opponent : {"id":13,"image":"images/rq6VQuxBquardzL7Jh1iK3VXJPcDvmR0wuHnV9bt.jpg","name":"team2","created_at":"2023-09-19T05:28:42.000000Z","updated_at":"2023-09-19T05:28:42.000000Z","firebase_document":"f3be96d6c4824a33a6a0"}
/// results : [{"id":2,"challenge_id":2,"user_id":7,"team_id":2,"result_data":"1000","created_at":"2023-09-17T11:55:05.000000Z","updated_at":"2023-09-17T11:55:05.000000Z","opponent_result":null}]

class UserChallenges {
  UserChallenges({
      num? id, 
      String? title, 
      String? type, 
      String? latitude, 
      String? longitude, 
      num? teamId, 
      dynamic refreeId, 
      num? categoryId, 
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
      dynamic usersPoints, 
      dynamic winnerPoints, 
      dynamic resultData, 
      dynamic opponentResult, 
      Category? category, 
      Team? team, 
      Opponent? opponent, 
      List<Results>? results,}){
    _id = id;
    _title = title;
    _type = type;
    _latitude = latitude;
    _longitude = longitude;
    _teamId = teamId;
    _refreeId = refreeId;
    _categoryId = categoryId;
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
    _usersPoints = usersPoints;
    _winnerPoints = winnerPoints;
    _resultData = resultData;
    _opponentResult = opponentResult;
    _category = category;
    _team = team;
    _opponent = opponent;
    _results = results;
}

  UserChallenges.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _type = json['type'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _teamId = json['team_id'];
    _refreeId = json['refree_id'];
    _categoryId = json['category_id'];
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
    _usersPoints = json['users_points'];
    _winnerPoints = json['winner_points'];
    _resultData = json['result_data'];
    _opponentResult = json['opponent_result'];
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
    _team = json['team'] != null ? Team.fromJson(json['team']) : null;
    _opponent = json['opponent'] != null ? Opponent.fromJson(json['opponent']) : null;
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
  }
  num? _id;
  String? _title;
  String? _type;
  String? _latitude;
  String? _longitude;
  num? _teamId;
  dynamic _refreeId;
  num? _categoryId;
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
  dynamic _usersPoints;
  dynamic _winnerPoints;
  dynamic _resultData;
  dynamic _opponentResult;
  Category? _category;
  Team? _team;
  Opponent? _opponent;
  List<Results>? _results;
UserChallenges copyWith({  num? id,
  String? title,
  String? type,
  String? latitude,
  String? longitude,
  num? teamId,
  dynamic refreeId,
  num? categoryId,
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
  dynamic usersPoints,
  dynamic winnerPoints,
  dynamic resultData,
  dynamic opponentResult,
  Category? category,
  Team? team,
  Opponent? opponent,
  List<Results>? results,
}) => UserChallenges(  id: id ?? _id,
  title: title ?? _title,
  type: type ?? _type,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  teamId: teamId ?? _teamId,
  refreeId: refreeId ?? _refreeId,
  categoryId: categoryId ?? _categoryId,
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
  usersPoints: usersPoints ?? _usersPoints,
  winnerPoints: winnerPoints ?? _winnerPoints,
  resultData: resultData ?? _resultData,
  opponentResult: opponentResult ?? _opponentResult,
  category: category ?? _category,
  team: team ?? _team,
  opponent: opponent ?? _opponent,
  results: results ?? _results,
);
  num? get id => _id;
  String? get title => _title;
  String? get type => _type;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  num? get teamId => _teamId;
  dynamic get refreeId => _refreeId;
  num? get categoryId => _categoryId;
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
  dynamic get usersPoints => _usersPoints;
  dynamic get winnerPoints => _winnerPoints;
  dynamic get resultData => _resultData;
  dynamic get opponentResult => _opponentResult;
  Category? get category => _category;
  Team? get team => _team;
  Opponent? get opponent => _opponent;
  List<Results>? get results => _results;

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
    map['users_points'] = _usersPoints;
    map['winner_points'] = _winnerPoints;
    map['result_data'] = _resultData;
    map['opponent_result'] = _opponentResult;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    if (_team != null) {
      map['team'] = _team?.toJson();
    }
    if (_opponent != null) {
      map['opponent'] = _opponent?.toJson();
    }
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2
/// challenge_id : 2
/// user_id : 7
/// team_id : 2
/// result_data : "1000"
/// created_at : "2023-09-17T11:55:05.000000Z"
/// updated_at : "2023-09-17T11:55:05.000000Z"
/// opponent_result : null

class Results {
  Results({
      num? id, 
      num? challengeId, 
      num? userId, 
      num? teamId, 
      String? resultData, 
      String? createdAt, 
      String? updatedAt, 
      dynamic opponentResult,}){
    _id = id;
    _challengeId = challengeId;
    _userId = userId;
    _teamId = teamId;
    _resultData = resultData;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _opponentResult = opponentResult;
}

  Results.fromJson(dynamic json) {
    _id = json['id'];
    _challengeId = json['challenge_id'];
    _userId = json['user_id'];
    _teamId = json['team_id'];
    _resultData = json['result_data'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _opponentResult = json['opponent_result'];
  }
  num? _id;
  num? _challengeId;
  num? _userId;
  num? _teamId;
  String? _resultData;
  String? _createdAt;
  String? _updatedAt;
  dynamic _opponentResult;
Results copyWith({  num? id,
  num? challengeId,
  num? userId,
  num? teamId,
  String? resultData,
  String? createdAt,
  String? updatedAt,
  dynamic opponentResult,
}) => Results(  id: id ?? _id,
  challengeId: challengeId ?? _challengeId,
  userId: userId ?? _userId,
  teamId: teamId ?? _teamId,
  resultData: resultData ?? _resultData,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  opponentResult: opponentResult ?? _opponentResult,
);
  num? get id => _id;
  num? get challengeId => _challengeId;
  num? get userId => _userId;
  num? get teamId => _teamId;
  String? get resultData => _resultData;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get opponentResult => _opponentResult;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['challenge_id'] = _challengeId;
    map['user_id'] = _userId;
    map['team_id'] = _teamId;
    map['result_data'] = _resultData;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['opponent_result'] = _opponentResult;
    return map;
  }

}

/// id : 13
/// image : "images/rq6VQuxBquardzL7Jh1iK3VXJPcDvmR0wuHnV9bt.jpg"
/// name : "team2"
/// created_at : "2023-09-19T05:28:42.000000Z"
/// updated_at : "2023-09-19T05:28:42.000000Z"
/// firebase_document : "f3be96d6c4824a33a6a0"

class Opponent {
  Opponent({
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

  Opponent.fromJson(dynamic json) {
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
Opponent copyWith({  num? id,
  String? image,
  String? name,
  String? createdAt,
  String? updatedAt,
  String? firebaseDocument,
}) => Opponent(  id: id ?? _id,
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

/// id : 2
/// name : "Running"
/// image : "categories/yyssCKJPQOLz1aYzCjPyB1mVCBEYC2q2EHoR6f1Q.png"
/// created_at : "2023-09-14T12:16:22.000000Z"
/// updated_at : "2023-09-14T12:16:22.000000Z"

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