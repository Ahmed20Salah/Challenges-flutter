// /// message : "User challenges here "
// /// User challenges : [{"id":100,"title":"ttest3333","type":"private","latitude":"0.32","longitude":"0.15","team_id":3,"refree_id":1,"category_id":1,"date":"2023-08-15","distance":null,"stepsNum":null,"created_at":"2023-08-31T08:31:58.000000Z","updated_at":"2023-08-31T08:31:58.000000Z","start_time":"2023-08-15 14:30:00","end_time":"2023-08-16 14:30:00","opponent_id":2,"prize":null,"document_id":"c23f571463e34e8c8bfd","image":null,"status":"created","result_data":null,"opponent_result":null,"category":{"id":1,"name":"Football","image":"categories/VdwM6itWJPFdnngR36nT5XoPeEpm4lQpEpvgl7a9.jpg","created_at":"2023-08-10T07:48:42.000000Z","updated_at":"2023-08-27T06:10:27.000000Z"},"team":{"id":3,"image":"images/UcxywOO4NZXVb7e7BVoirZTcLqQEPWUWy59VuAFh.jpg","name":"test name team","created_at":"2023-08-29T10:59:06.000000Z","updated_at":"2023-08-29T10:59:06.000000Z","firebase_document":"05618d44b1914406a4ff"},"opponent":{"id":2,"image":"images/cyi1zB1iU73UGcF148iNAVQrVCZ0hBqDVfW2942X.jpg","name":"test name team","created_at":"2023-08-29T10:56:02.000000Z","updated_at":"2023-08-29T10:56:02.000000Z","firebase_document":"bed51945706c490bb127"},"results":[]},{"id":101,"title":"ttest3333","type":"private","latitude":"-29.04","longitude":"135.53","team_id":3,"refree_id":1,"category_id":1,"date":"2023-08-15","distance":null,"stepsNum":null,"created_at":"2023-09-03T08:52:57.000000Z","updated_at":"2023-09-03T08:52:57.000000Z","start_time":"2023-08-15 14:30:00","end_time":"2023-08-16 14:30:00","opponent_id":2,"prize":null,"document_id":"3a5640a305934289ab18","image":null,"status":"created","result_data":null,"opponent_result":null,"category":{"id":1,"name":"Football","image":"categories/VdwM6itWJPFdnngR36nT5XoPeEpm4lQpEpvgl7a9.jpg","created_at":"2023-08-10T07:48:42.000000Z","updated_at":"2023-08-27T06:10:27.000000Z"},"team":{"id":3,"image":"images/UcxywOO4NZXVb7e7BVoirZTcLqQEPWUWy59VuAFh.jpg","name":"test name team","created_at":"2023-08-29T10:59:06.000000Z","updated_at":"2023-08-29T10:59:06.000000Z","firebase_document":"05618d44b1914406a4ff"},"opponent":{"id":2,"image":"images/cyi1zB1iU73UGcF148iNAVQrVCZ0hBqDVfW2942X.jpg","name":"test name team","created_at":"2023-08-29T10:56:02.000000Z","updated_at":"2023-08-29T10:56:02.000000Z","firebase_document":"bed51945706c490bb127"},"results":[]},{"id":118,"title":"ttest3333","type":"private","latitude":"-29.04","longitude":"135.53","team_id":3,"refree_id":null,"category_id":2,"date":"2023-08-15","distance":"5","stepsNum":"3000","created_at":"2023-09-06T11:06:45.000000Z","updated_at":"2023-09-06T11:06:45.000000Z","start_time":"2023-08-15 14:30:00","end_time":"2023-08-16 14:30:00","opponent_id":null,"prize":null,"document_id":"8e7d0deb56c347f99b73","image":null,"status":"created","result_data":"\"3000\"","opponent_result":null,"category":{"id":2,"name":"Running","image":"categories/yrfwbWvpvDgjrkHnYmy7OT6BDa5G03UgSLxRri0C.png","created_at":"2023-08-10T07:48:49.000000Z","updated_at":"2023-08-27T06:12:54.000000Z"},"team":{"id":3,"image":"images/UcxywOO4NZXVb7e7BVoirZTcLqQEPWUWy59VuAFh.jpg","name":"test name team","created_at":"2023-08-29T10:59:06.000000Z","updated_at":"2023-08-29T10:59:06.000000Z","firebase_document":"05618d44b1914406a4ff"},"opponent":null,"results":[{"id":46,"challenge_id":118,"user_id":3,"team_id":3,"result_data":"3000","created_at":"2023-09-06T12:03:27.000000Z","updated_at":"2023-09-06T12:03:27.000000Z","opponent_result":null}]}]
// /// status : 200
//
// class UserChallengesModel {
//   UserChallengesModel({
//       String? message,
//       List<UserChallenges>? userchallenges,
//       num? status,}){
//     _message = message;
//     _userchallenges = userchallenges;
//     _status = status;
// }
//
//   UserChallengesModel.fromJson(dynamic json) {
//     _message = json['message'];
//     if (json['User challenges'] != null) {
//       _userchallenges = [];
//       json['User challenges'].forEach((v) {
//         _userchallenges?.add(UserChallenges.fromJson(v));
//       });
//     }
//     _status = json['status'];
//   }
//   String? _message;
//   List<UserChallenges>? _userchallenges;
//   num? _status;
// UserChallengesModel copyWith({  String? message,
//   List<UserChallenges>? userchallenges,
//   num? status,
// }) => UserChallengesModel(  message: message ?? _message,
//   userchallenges: userchallenges ?? _userchallenges,
//   status: status ?? _status,
// );
//   String? get message => _message;
//   List<UserChallenges>? get userchallenges => _userchallenges;
//   num? get status => _status;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['message'] = _message;
//     if (_userchallenges != null) {
//       map['User challenges'] = _userchallenges?.map((v) => v.toJson()).toList();
//     }
//     map['status'] = _status;
//     return map;
//   }
//
// }
//
// /// id : 100
// /// title : "ttest3333"
// /// type : "private"
// /// latitude : "0.32"
// /// longitude : "0.15"
// /// team_id : 3
// /// refree_id : 1
// /// category_id : 1
// /// date : "2023-08-15"
// /// distance : null
// /// stepsNum : null
// /// created_at : "2023-08-31T08:31:58.000000Z"
// /// updated_at : "2023-08-31T08:31:58.000000Z"
// /// start_time : "2023-08-15 14:30:00"
// /// end_time : "2023-08-16 14:30:00"
// /// opponent_id : 2
// /// prize : null
// /// document_id : "c23f571463e34e8c8bfd"
// /// image : null
// /// status : "created"
// /// result_data : null
// /// opponent_result : null
// /// category : {"id":1,"name":"Football","image":"categories/VdwM6itWJPFdnngR36nT5XoPeEpm4lQpEpvgl7a9.jpg","created_at":"2023-08-10T07:48:42.000000Z","updated_at":"2023-08-27T06:10:27.000000Z"}
// /// team : {"id":3,"image":"images/UcxywOO4NZXVb7e7BVoirZTcLqQEPWUWy59VuAFh.jpg","name":"test name team","created_at":"2023-08-29T10:59:06.000000Z","updated_at":"2023-08-29T10:59:06.000000Z","firebase_document":"05618d44b1914406a4ff"}
// /// opponent : {"id":2,"image":"images/cyi1zB1iU73UGcF148iNAVQrVCZ0hBqDVfW2942X.jpg","name":"test name team","created_at":"2023-08-29T10:56:02.000000Z","updated_at":"2023-08-29T10:56:02.000000Z","firebase_document":"bed51945706c490bb127"}
// /// results : []
//
// class UserChallenges {
//   UserChallenges({
//       num? id,
//       String? title,
//       String? type,
//       String? latitude,
//       String? longitude,
//       num? teamId,
//       num? refreeId,
//       num? categoryId,
//       String? date,
//       dynamic distance,
//       dynamic stepsNum,
//       String? createdAt,
//       String? updatedAt,
//       String? startTime,
//       String? endTime,
//       num? opponentId,
//       dynamic prize,
//       String? documentId,
//       dynamic image,
//       String? status,
//       dynamic resultData,
//       dynamic opponentResult,
//       Category? category,
//       Team? team,
//       Opponent? opponent,
//       List<dynamic>? results,}){
//     _id = id;
//     _title = title;
//     _type = type;
//     _latitude = latitude;
//     _longitude = longitude;
//     _teamId = teamId;
//     _refreeId = refreeId;
//     _categoryId = categoryId;
//     _date = date;
//     _distance = distance;
//     _stepsNum = stepsNum;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _startTime = startTime;
//     _endTime = endTime;
//     _opponentId = opponentId;
//     _prize = prize;
//     _documentId = documentId;
//     _image = image;
//     _status = status;
//     _resultData = resultData;
//     _opponentResult = opponentResult;
//     _category = category;
//     _team = team;
//     _opponent = opponent;
//     _results = results;
// }
//
//   UserChallenges.fromJson(dynamic json) {
//     _id = json['id'];
//     _title = json['title'];
//     _type = json['type'];
//     _latitude = json['latitude'];
//     _longitude = json['longitude'];
//     _teamId = json['team_id'];
//     _refreeId = json['refree_id'];
//     _categoryId = json['category_id'];
//     _date = json['date'];
//     _distance = json['distance'];
//     _stepsNum = json['stepsNum'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//     _startTime = json['start_time'];
//     _endTime = json['end_time'];
//     _opponentId = json['opponent_id'];
//     _prize = json['prize'];
//     _documentId = json['document_id'];
//     _image = json['image'];
//     _status = json['status'];
//     _resultData = json['result_data'];
//     _opponentResult = json['opponent_result'];
//     _category = json['category'] != null ? Category.fromJson(json['category']) : null;
//     _team = json['team'] != null ? Team.fromJson(json['team']) : null;
//     _opponent = json['opponent'] != null ? Opponent.fromJson(json['opponent']) : null;
//     if (json['results'] != null) {
//       _results = [];
//       json['results'].forEach((v) {
//         _results?.add(Dynamic.fromJson(v));
//       });
//     }
//   }
//   num? _id;
//   String? _title;
//   String? _type;
//   String? _latitude;
//   String? _longitude;
//   num? _teamId;
//   num? _refreeId;
//   num? _categoryId;
//   String? _date;
//   dynamic _distance;
//   dynamic _stepsNum;
//   String? _createdAt;
//   String? _updatedAt;
//   String? _startTime;
//   String? _endTime;
//   num? _opponentId;
//   dynamic _prize;
//   String? _documentId;
//   dynamic _image;
//   String? _status;
//   dynamic _resultData;
//   dynamic _opponentResult;
//   Category? _category;
//   Team? _team;
//   Opponent? _opponent;
//   List<dynamic>? _results;
// UserChallenges copyWith({  num? id,
//   String? title,
//   String? type,
//   String? latitude,
//   String? longitude,
//   num? teamId,
//   num? refreeId,
//   num? categoryId,
//   String? date,
//   dynamic distance,
//   dynamic stepsNum,
//   String? createdAt,
//   String? updatedAt,
//   String? startTime,
//   String? endTime,
//   num? opponentId,
//   dynamic prize,
//   String? documentId,
//   dynamic image,
//   String? status,
//   dynamic resultData,
//   dynamic opponentResult,
//   Category? category,
//   Team? team,
//   Opponent? opponent,
//   List<dynamic>? results,
// }) => UserChallenges(  id: id ?? _id,
//   title: title ?? _title,
//   type: type ?? _type,
//   latitude: latitude ?? _latitude,
//   longitude: longitude ?? _longitude,
//   teamId: teamId ?? _teamId,
//   refreeId: refreeId ?? _refreeId,
//   categoryId: categoryId ?? _categoryId,
//   date: date ?? _date,
//   distance: distance ?? _distance,
//   stepsNum: stepsNum ?? _stepsNum,
//   createdAt: createdAt ?? _createdAt,
//   updatedAt: updatedAt ?? _updatedAt,
//   startTime: startTime ?? _startTime,
//   endTime: endTime ?? _endTime,
//   opponentId: opponentId ?? _opponentId,
//   prize: prize ?? _prize,
//   documentId: documentId ?? _documentId,
//   image: image ?? _image,
//   status: status ?? _status,
//   resultData: resultData ?? _resultData,
//   opponentResult: opponentResult ?? _opponentResult,
//   category: category ?? _category,
//   team: team ?? _team,
//   opponent: opponent ?? _opponent,
//   results: results ?? _results,
// );
//   num? get id => _id;
//   String? get title => _title;
//   String? get type => _type;
//   String? get latitude => _latitude;
//   String? get longitude => _longitude;
//   num? get teamId => _teamId;
//   num? get refreeId => _refreeId;
//   num? get categoryId => _categoryId;
//   String? get date => _date;
//   dynamic get distance => _distance;
//   dynamic get stepsNum => _stepsNum;
//   String? get createdAt => _createdAt;
//   String? get updatedAt => _updatedAt;
//   String? get startTime => _startTime;
//   String? get endTime => _endTime;
//   num? get opponentId => _opponentId;
//   dynamic get prize => _prize;
//   String? get documentId => _documentId;
//   dynamic get image => _image;
//   String? get status => _status;
//   dynamic get resultData => _resultData;
//   dynamic get opponentResult => _opponentResult;
//   Category? get category => _category;
//   Team? get team => _team;
//   Opponent? get opponent => _opponent;
//   List<dynamic>? get results => _results;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['title'] = _title;
//     map['type'] = _type;
//     map['latitude'] = _latitude;
//     map['longitude'] = _longitude;
//     map['team_id'] = _teamId;
//     map['refree_id'] = _refreeId;
//     map['category_id'] = _categoryId;
//     map['date'] = _date;
//     map['distance'] = _distance;
//     map['stepsNum'] = _stepsNum;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     map['start_time'] = _startTime;
//     map['end_time'] = _endTime;
//     map['opponent_id'] = _opponentId;
//     map['prize'] = _prize;
//     map['document_id'] = _documentId;
//     map['image'] = _image;
//     map['status'] = _status;
//     map['result_data'] = _resultData;
//     map['opponent_result'] = _opponentResult;
//     if (_category != null) {
//       map['category'] = _category?.toJson();
//     }
//     if (_team != null) {
//       map['team'] = _team?.toJson();
//     }
//     if (_opponent != null) {
//       map['opponent'] = _opponent?.toJson();
//     }
//     if (_results != null) {
//       map['results'] = _results?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// /// id : 2
// /// image : "images/cyi1zB1iU73UGcF148iNAVQrVCZ0hBqDVfW2942X.jpg"
// /// name : "test name team"
// /// created_at : "2023-08-29T10:56:02.000000Z"
// /// updated_at : "2023-08-29T10:56:02.000000Z"
// /// firebase_document : "bed51945706c490bb127"
//
// class Opponent {
//   Opponent({
//       num? id,
//       String? image,
//       String? name,
//       String? createdAt,
//       String? updatedAt,
//       String? firebaseDocument,}){
//     _id = id;
//     _image = image;
//     _name = name;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _firebaseDocument = firebaseDocument;
// }
//
//   Opponent.fromJson(dynamic json) {
//     _id = json['id'];
//     _image = json['image'];
//     _name = json['name'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//     _firebaseDocument = json['firebase_document'];
//   }
//   num? _id;
//   String? _image;
//   String? _name;
//   String? _createdAt;
//   String? _updatedAt;
//   String? _firebaseDocument;
// Opponent copyWith({  num? id,
//   String? image,
//   String? name,
//   String? createdAt,
//   String? updatedAt,
//   String? firebaseDocument,
// }) => Opponent(  id: id ?? _id,
//   image: image ?? _image,
//   name: name ?? _name,
//   createdAt: createdAt ?? _createdAt,
//   updatedAt: updatedAt ?? _updatedAt,
//   firebaseDocument: firebaseDocument ?? _firebaseDocument,
// );
//   num? get id => _id;
//   String? get image => _image;
//   String? get name => _name;
//   String? get createdAt => _createdAt;
//   String? get updatedAt => _updatedAt;
//   String? get firebaseDocument => _firebaseDocument;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['image'] = _image;
//     map['name'] = _name;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     map['firebase_document'] = _firebaseDocument;
//     return map;
//   }
//
// }
//
// /// id : 3
// /// image : "images/UcxywOO4NZXVb7e7BVoirZTcLqQEPWUWy59VuAFh.jpg"
// /// name : "test name team"
// /// created_at : "2023-08-29T10:59:06.000000Z"
// /// updated_at : "2023-08-29T10:59:06.000000Z"
// /// firebase_document : "05618d44b1914406a4ff"
//
// class Team {
//   Team({
//       num? id,
//       String? image,
//       String? name,
//       String? createdAt,
//       String? updatedAt,
//       String? firebaseDocument,}){
//     _id = id;
//     _image = image;
//     _name = name;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//     _firebaseDocument = firebaseDocument;
// }
//
//   Team.fromJson(dynamic json) {
//     _id = json['id'];
//     _image = json['image'];
//     _name = json['name'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//     _firebaseDocument = json['firebase_document'];
//   }
//   num? _id;
//   String? _image;
//   String? _name;
//   String? _createdAt;
//   String? _updatedAt;
//   String? _firebaseDocument;
// Team copyWith({  num? id,
//   String? image,
//   String? name,
//   String? createdAt,
//   String? updatedAt,
//   String? firebaseDocument,
// }) => Team(  id: id ?? _id,
//   image: image ?? _image,
//   name: name ?? _name,
//   createdAt: createdAt ?? _createdAt,
//   updatedAt: updatedAt ?? _updatedAt,
//   firebaseDocument: firebaseDocument ?? _firebaseDocument,
// );
//   num? get id => _id;
//   String? get image => _image;
//   String? get name => _name;
//   String? get createdAt => _createdAt;
//   String? get updatedAt => _updatedAt;
//   String? get firebaseDocument => _firebaseDocument;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['image'] = _image;
//     map['name'] = _name;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     map['firebase_document'] = _firebaseDocument;
//     return map;
//   }
//
// }
//
// /// id : 1
// /// name : "Football"
// /// image : "categories/VdwM6itWJPFdnngR36nT5XoPeEpm4lQpEpvgl7a9.jpg"
// /// created_at : "2023-08-10T07:48:42.000000Z"
// /// updated_at : "2023-08-27T06:10:27.000000Z"
//
// class Category {
//   Category({
//       num? id,
//       String? name,
//       String? image,
//       String? createdAt,
//       String? updatedAt,}){
//     _id = id;
//     _name = name;
//     _image = image;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
// }
//
//   Category.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _image = json['image'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//   }
//   num? _id;
//   String? _name;
//   String? _image;
//   String? _createdAt;
//   String? _updatedAt;
// Category copyWith({  num? id,
//   String? name,
//   String? image,
//   String? createdAt,
//   String? updatedAt,
// }) => Category(  id: id ?? _id,
//   name: name ?? _name,
//   image: image ?? _image,
//   createdAt: createdAt ?? _createdAt,
//   updatedAt: updatedAt ?? _updatedAt,
// );
//   num? get id => _id;
//   String? get name => _name;
//   String? get image => _image;
//   String? get createdAt => _createdAt;
//   String? get updatedAt => _updatedAt;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['image'] = _image;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     return map;
//   }
//
// }