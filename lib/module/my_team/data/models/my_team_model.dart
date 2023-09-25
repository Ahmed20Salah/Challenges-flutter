/// message : "My Team Page data"
/// User_team : {"document_id":"bed51945706c490bb127","id":2,"name":"test name team","image":"images/cyi1zB1iU73UGcF148iNAVQrVCZ0hBqDVfW2942X.jpg"}
/// status : 200
/// invitations : [{"invitation_data":{"invitation_id":10,"invitation_team_id":2,"invitation_user_id":3,"invitation_status":"pending","team":{"team_id":2,"team_document":"bed51945706c490bb127","name":"test name team","image":"images/cyi1zB1iU73UGcF148iNAVQrVCZ0hBqDVfW2942X.jpg"},"users":[{"id":3,"name":"qqqq","avatar":null},{"id":37,"name":"bfcbhfvfc","avatar":null}]}},{"invitation_data":{"invitation_id":25,"invitation_team_id":6,"invitation_user_id":3,"invitation_status":"pending","team":{"team_id":6,"team_document":"d5e0045efeea4f9f9b7e","name":"team4 update","image":null},"users":[{"id":9,"name":"vvvv","avatar":null},{"id":10,"name":"bbbbbb","avatar":null},{"id":11,"name":"qazwsx11","avatar":"avatars/r8cQQOdYk11MsG4VcFhNM1Y2TUDV5yjpTfwgjEej.jpg"},{"id":13,"name":"bbnn","avatar":null}]}}]

class MyTeamModel {
  MyTeamModel({
      String? message, 
      UserTeam? userTeam, 
      num? status, 
      List<Invitations>? invitations,}){
    _message = message;
    _userTeam = userTeam;
    _status = status;
    _invitations = invitations;
}

  MyTeamModel.fromJson(dynamic json) {
    _message = json['message'];
    _userTeam = json['User_team'] != null ? UserTeam.fromJson(json['User_team']) : null;
    _status = json['status'];
    if (json['invitations'] != null) {
      _invitations = [];
      json['invitations'].forEach((v) {
        _invitations?.add(Invitations.fromJson(v));
      });
    }
  }
  String? _message;
  UserTeam? _userTeam;
  num? _status;
  List<Invitations>? _invitations;
MyTeamModel copyWith({  String? message,
  UserTeam? userTeam,
  num? status,
  List<Invitations>? invitations,
}) => MyTeamModel(  message: message ?? _message,
  userTeam: userTeam ?? _userTeam,
  status: status ?? _status,
  invitations: invitations ?? _invitations,
);
  String? get message => _message;
  UserTeam? get userTeam => _userTeam;
  num? get status => _status;
  List<Invitations>? get invitations => _invitations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_userTeam != null) {
      map['User_team'] = _userTeam?.toJson();
    }
    map['status'] = _status;
    if (_invitations != null) {
      map['invitations'] = _invitations?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// invitation_data : {"invitation_id":10,"invitation_team_id":2,"invitation_user_id":3,"invitation_status":"pending","team":{"team_id":2,"team_document":"bed51945706c490bb127","name":"test name team","image":"images/cyi1zB1iU73UGcF148iNAVQrVCZ0hBqDVfW2942X.jpg"},"users":[{"id":3,"name":"qqqq","avatar":null},{"id":37,"name":"bfcbhfvfc","avatar":null}]}

class Invitations {
  Invitations({
      InvitationData? invitationData,}){
    _invitationData = invitationData;
}

  Invitations.fromJson(dynamic json) {
    _invitationData = json['invitation_data'] != null ? InvitationData.fromJson(json['invitation_data']) : null;
  }
  InvitationData? _invitationData;
Invitations copyWith({  InvitationData? invitationData,
}) => Invitations(  invitationData: invitationData ?? _invitationData,
);
  InvitationData? get invitationData => _invitationData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_invitationData != null) {
      map['invitation_data'] = _invitationData?.toJson();
    }
    return map;
  }

}

/// invitation_id : 10
/// invitation_team_id : 2
/// invitation_user_id : 3
/// invitation_status : "pending"
/// team : {"team_id":2,"team_document":"bed51945706c490bb127","name":"test name team","image":"images/cyi1zB1iU73UGcF148iNAVQrVCZ0hBqDVfW2942X.jpg"}
/// users : [{"id":3,"name":"qqqq","avatar":null},{"id":37,"name":"bfcbhfvfc","avatar":null}]

class InvitationData {
  InvitationData({
      num? invitationId, 
      num? invitationTeamId, 
      num? invitationUserId, 
      String? invitationStatus, 
      Team? team, 
      List<Users>? users,}){
    _invitationId = invitationId;
    _invitationTeamId = invitationTeamId;
    _invitationUserId = invitationUserId;
    _invitationStatus = invitationStatus;
    _team = team;
    _users = users;
}

  InvitationData.fromJson(dynamic json) {
    _invitationId = json['invitation_id'];
    _invitationTeamId = json['invitation_team_id'];
    _invitationUserId = json['invitation_user_id'];
    _invitationStatus = json['invitation_status'];
    _team = json['team'] != null ? Team.fromJson(json['team']) : null;
    if (json['users'] != null) {
      _users = [];
      json['users'].forEach((v) {
        _users?.add(Users.fromJson(v));
      });
    }
  }
  num? _invitationId;
  num? _invitationTeamId;
  num? _invitationUserId;
  String? _invitationStatus;
  Team? _team;
  List<Users>? _users;
InvitationData copyWith({  num? invitationId,
  num? invitationTeamId,
  num? invitationUserId,
  String? invitationStatus,
  Team? team,
  List<Users>? users,
}) => InvitationData(  invitationId: invitationId ?? _invitationId,
  invitationTeamId: invitationTeamId ?? _invitationTeamId,
  invitationUserId: invitationUserId ?? _invitationUserId,
  invitationStatus: invitationStatus ?? _invitationStatus,
  team: team ?? _team,
  users: users ?? _users,
);
  num? get invitationId => _invitationId;
  num? get invitationTeamId => _invitationTeamId;
  num? get invitationUserId => _invitationUserId;
  String? get invitationStatus => _invitationStatus;
  Team? get team => _team;
  List<Users>? get users => _users;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['invitation_id'] = _invitationId;
    map['invitation_team_id'] = _invitationTeamId;
    map['invitation_user_id'] = _invitationUserId;
    map['invitation_status'] = _invitationStatus;
    if (_team != null) {
      map['team'] = _team?.toJson();
    }
    if (_users != null) {
      map['users'] = _users?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// name : "qqqq"
/// avatar : null

class Users {
  Users({
      num? id, 
      String? name, 
      dynamic avatar,}){
    _id = id;
    _name = name;
    _avatar = avatar;
}

  Users.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _avatar = json['avatar'];
  }
  num? _id;
  String? _name;
  dynamic _avatar;
Users copyWith({  num? id,
  String? name,
  dynamic avatar,
}) => Users(  id: id ?? _id,
  name: name ?? _name,
  avatar: avatar ?? _avatar,
);
  num? get id => _id;
  String? get name => _name;
  dynamic get avatar => _avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['avatar'] = _avatar;
    return map;
  }

}

/// team_id : 2
/// team_document : "bed51945706c490bb127"
/// name : "test name team"
/// image : "images/cyi1zB1iU73UGcF148iNAVQrVCZ0hBqDVfW2942X.jpg"

class Team {
  Team({
      num? teamId, 
      String? teamDocument, 
      String? name, 
      String? image,}){
    _teamId = teamId;
    _teamDocument = teamDocument;
    _name = name;
    _image = image;
}

  Team.fromJson(dynamic json) {
    _teamId = json['team_id'];
    _teamDocument = json['team_document'];
    _name = json['name'];
    _image = json['image'];
  }
  num? _teamId;
  String? _teamDocument;
  String? _name;
  String? _image;
Team copyWith({  num? teamId,
  String? teamDocument,
  String? name,
  String? image,
}) => Team(  teamId: teamId ?? _teamId,
  teamDocument: teamDocument ?? _teamDocument,
  name: name ?? _name,
  image: image ?? _image,
);
  num? get teamId => _teamId;
  String? get teamDocument => _teamDocument;
  String? get name => _name;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['team_id'] = _teamId;
    map['team_document'] = _teamDocument;
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }

}

/// document_id : "bed51945706c490bb127"
/// id : 2
/// name : "test name team"
/// image : "images/cyi1zB1iU73UGcF148iNAVQrVCZ0hBqDVfW2942X.jpg"

class UserTeam {
  UserTeam({
      String? documentId, 
      num? id, 
      String? name, 
      String? image,}){
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
  String? _image;
UserTeam copyWith({  String? documentId,
  num? id,
  String? name,
  String? image,
}) => UserTeam(  documentId: documentId ?? _documentId,
  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
);
  String? get documentId => _documentId;
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['document_id'] = _documentId;
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }

}