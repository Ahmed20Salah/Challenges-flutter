/// message : "Team added successfully"
/// data : {"name":"team2","firebase_document":"316afb7da7914d959310","image":"images/TiyvG0zI5C8CpaOiAJ9g6KAeIvd8DLn8uYhQNRTl.png","updated_at":"2023-09-17T11:25:44.000000Z","created_at":"2023-09-17T11:25:44.000000Z","id":2}
/// document_id : "316afb7da7914d959310"
/// users : ["jcxxaIstg4QF7ovTiNxT2G4o4Ta2","JdcLlmxGwHXcmrHhBPLTO2eaT7s2","wN4r0zoZwFbMP6qkVibSIK9KdMu2"]
/// leader : "wN4r0zoZwFbMP6qkVibSIK9KdMu2"
/// invitations : [{"user_uid":"jcxxaIstg4QF7ovTiNxT2G4o4Ta2","invitation_id":4},{"user_uid":"JdcLlmxGwHXcmrHhBPLTO2eaT7s2","invitation_id":5}]
/// status : 200

class CreateTeamModel {
  CreateTeamModel({
      String? message,
    TeamModel ? data,
      String? documentId, 
      List<String>? users, 
      String? leader, 
      List<Invitations>? invitations, 
      num? status,}){
    _message = message;
    _data = data;
    _documentId = documentId;
    _users = users;
    _leader = leader;
    _invitations = invitations;
    _status = status;
}

  CreateTeamModel.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? TeamModel.fromJson(json['data']) : null;
    _documentId = json['document_id'];
    _users = json['users'] != null ? json['users'].cast<String>() : [];
    _leader = json['leader'];
    if (json['invitations'] != null) {
      _invitations = [];
      json['invitations'].forEach((v) {
        _invitations?.add(Invitations.fromJson(v));
      });
    }
    _status = json['status'];
  }
  String? _message;
  TeamModel ? _data;
  String? _documentId;
  List<String>? _users;
  String? _leader;
  List<Invitations>? _invitations;
  num? _status;
CreateTeamModel copyWith({  String? message,
  TeamModel ? data,
  String? documentId,
  List<String>? users,
  String? leader,
  List<Invitations>? invitations,
  num? status,
}) => CreateTeamModel(  message: message ?? _message,
  data: data ?? _data,
  documentId: documentId ?? _documentId,
  users: users ?? _users,
  leader: leader ?? _leader,
  invitations: invitations ?? _invitations,
  status: status ?? _status,
);
  String? get message => _message;
  TeamModel ? get data => _data;
  String? get documentId => _documentId;
  List<String>? get users => _users;
  String? get leader => _leader;
  List<Invitations>? get invitations => _invitations;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['document_id'] = _documentId;
    map['users'] = _users;
    map['leader'] = _leader;
    if (_invitations != null) {
      map['invitations'] = _invitations?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }

}

/// user_uid : "jcxxaIstg4QF7ovTiNxT2G4o4Ta2"
/// invitation_id : 4

class Invitations {
  Invitations({
      String? userUid, 
      num? invitationId,}){
    _userUid = userUid;
    _invitationId = invitationId;
}

  Invitations.fromJson(dynamic json) {
    _userUid = json['user_uid'];
    _invitationId = json['invitation_id'];
  }
  String? _userUid;
  num? _invitationId;
Invitations copyWith({  String? userUid,
  num? invitationId,
}) => Invitations(  userUid: userUid ?? _userUid,
  invitationId: invitationId ?? _invitationId,
);
  String? get userUid => _userUid;
  num? get invitationId => _invitationId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_uid'] = _userUid;
    map['invitation_id'] = _invitationId;
    return map;
  }

}

/// name : "team2"
/// firebase_document : "316afb7da7914d959310"
/// image : "images/TiyvG0zI5C8CpaOiAJ9g6KAeIvd8DLn8uYhQNRTl.png"
/// updated_at : "2023-09-17T11:25:44.000000Z"
/// created_at : "2023-09-17T11:25:44.000000Z"
/// id : 2

class TeamModel  {
  TeamModel ({
      String? name, 
      String? firebaseDocument, 
      String? image, 
      String? updatedAt, 
      String? createdAt, 
      num? id,}){
    _name = name;
    _firebaseDocument = firebaseDocument;
    _image = image;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  TeamModel .fromJson(dynamic json) {
    _name = json['name'];
    _firebaseDocument = json['firebase_document'];
    _image = json['image'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _name;
  String? _firebaseDocument;
  String? _image;
  String? _updatedAt;
  String? _createdAt;
  num? _id;
  TeamModel  copyWith({  String? name,
  String? firebaseDocument,
  String? image,
  String? updatedAt,
  String? createdAt,
  num? id,
}) => TeamModel (  name: name ?? _name,
  firebaseDocument: firebaseDocument ?? _firebaseDocument,
  image: image ?? _image,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
);
  String? get name => _name;
  String? get firebaseDocument => _firebaseDocument;
  String? get image => _image;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  num? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['firebase_document'] = _firebaseDocument;
    map['image'] = _image;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}