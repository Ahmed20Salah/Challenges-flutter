/// message : "Selected users already have a team"
/// data : [{"id":1,"image":null,"name":"team4 update","created_at":"2023-09-14T12:39:55.000000Z","updated_at":"2023-09-14T12:48:36.000000Z","firebase_document":"7693cc9521b049daac3f"},{"id":2,"image":null,"name":"team4 update","created_at":"2023-09-17T11:25:44.000000Z","updated_at":"2023-09-17T12:05:03.000000Z","firebase_document":"316afb7da7914d959310"},{"id":3,"image":"images/xBemJ0cyV26cjD9squAoI2UHvkUi0PSRis1jUq5D.png","name":"team2","created_at":"2023-09-18T08:46:32.000000Z","updated_at":"2023-09-18T08:46:32.000000Z","firebase_document":"6f42323a6ba64d21bdab"},{"id":4,"image":"images/U2Ka65oU7Vhs52Iei8IBSf28ZPHi4yW9rmNsqEtX.png","name":"team2","created_at":"2023-09-18T08:48:28.000000Z","updated_at":"2023-09-18T08:48:28.000000Z","firebase_document":"ad54bff31e844553be50"},{"id":5,"image":"images/LfktaNwkzqIoXdBps9CXn6ZAjslPANA0jPK1RwFR.png","name":"team2","created_at":"2023-09-18T08:48:41.000000Z","updated_at":"2023-09-18T08:48:41.000000Z","firebase_document":"1f343cf98e234d66bf09"},{"id":6,"image":"images/ea04KfOcyPUjQ67EE26oNZo35MJPyZb0Q5SNSd3F.png","name":"team2","created_at":"2023-09-18T08:48:50.000000Z","updated_at":"2023-09-18T08:48:50.000000Z","firebase_document":"19210bc527484205a5ff"},{"id":7,"image":"images/KX1Vv6ZeLYf3ct6WMCzolaaVuZ025l2Zw5OGz46W.jpg","name":"Mohammed team","created_at":"2023-09-18T18:59:26.000000Z","updated_at":"2023-09-18T18:59:26.000000Z","firebase_document":"93bd930ec910456b8d25"},{"id":8,"image":"images/PnkD8ULcmcEuWG7jY0wMESdT7t74s2Vaj6KDCYAD.jpg","name":"cacao","created_at":"2023-09-18T19:01:14.000000Z","updated_at":"2023-09-18T19:01:14.000000Z","firebase_document":"096f52d0bfb64560bd6a"},{"id":9,"image":"images/ytIwuIxukKfCpGngqSOn4Vau70CosaBbcOHPe42U.jpg","name":"team2","created_at":"2023-09-18T19:02:41.000000Z","updated_at":"2023-09-18T19:02:41.000000Z","firebase_document":"5c3e56fed1654098ab1a"},{"id":10,"image":"images/e2B6KpLixQirJvwnWXCR54D5Z0eaDf3pLJ2GCVc5.jpg","name":"team2","created_at":"2023-09-18T19:02:44.000000Z","updated_at":"2023-09-18T19:02:44.000000Z","firebase_document":"f59ef78aa8c3467bb86f"},{"id":11,"image":"images/uPdIf2iZSymhWRpoxargQTkQDN2rDtMK0hvz797F.jpg","name":"team2","created_at":"2023-09-18T19:02:49.000000Z","updated_at":"2023-09-18T19:02:49.000000Z","firebase_document":"79a0d71c5dea474684ba"},{"id":12,"image":"images/Up26HnxXLZ1KKv2aiNhujN6WzD6phPA3QwllyGao.jpg","name":"team2","created_at":"2023-09-18T19:03:01.000000Z","updated_at":"2023-09-18T19:03:01.000000Z","firebase_document":"bacd26db5a534370ad28"},{"id":13,"image":"images/rq6VQuxBquardzL7Jh1iK3VXJPcDvmR0wuHnV9bt.jpg","name":"team2","created_at":"2023-09-19T05:28:42.000000Z","updated_at":"2023-09-19T05:28:42.000000Z","firebase_document":"f3be96d6c4824a33a6a0"}]
/// status : 200

class AllTeamModel {
  AllTeamModel({
      String? message, 
      List<TeamModel>? data,
      num? status,}){
    _message = message;
    _data = data;
    _status = status;
}

  AllTeamModel.fromJson(dynamic json) {
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {

        _data?.add(TeamModel.fromJson(v));
      });
    }
    _status = json['status'];
  }
  String? _message;
  List<TeamModel>? _data;
  num? _status;
AllTeamModel copyWith({  String? message,
  List<TeamModel>? data,
  num? status,
}) => AllTeamModel(  message: message ?? _message,
  data: data ?? _data,
  status: status ?? _status,
);
  String? get message => _message;
  List<TeamModel>? get data => _data;
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

/// id : 1
/// image : null
/// name : "team4 update"
/// created_at : "2023-09-14T12:39:55.000000Z"
/// updated_at : "2023-09-14T12:48:36.000000Z"
/// firebase_document : "7693cc9521b049daac3f"

class TeamModel {
  TeamModel({
      num? id, 
      dynamic image, 
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

  TeamModel.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _firebaseDocument = json['firebase_document'];
  }
  num? _id;
  dynamic _image;
  String? _name;
  String? _createdAt;
  String? _updatedAt;
  String? _firebaseDocument;
  bool isSelected=false;
  TeamModel copyWith({  num? id,
  dynamic image,
  String? name,
  String? createdAt,
  String? updatedAt,
  String? firebaseDocument,
}) => TeamModel(  id: id ?? _id,
  image: image ?? _image,
  name: name ?? _name,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  firebaseDocument: firebaseDocument ?? _firebaseDocument,
);
  num? get id => _id;
  dynamic get image => _image;
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