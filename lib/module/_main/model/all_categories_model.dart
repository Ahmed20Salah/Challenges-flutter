/// message : "All categories show here"
/// data : [{"id":1,"name":"Football","image":"categories/qzIQivK5mr3fNAk9j2MxwUQUNsIwdcxTtScna6kR.jpg","created_at":"2023-09-14T12:16:07.000000Z","updated_at":"2023-09-14T12:16:07.000000Z"},{"id":2,"name":"Running","image":"categories/yyssCKJPQOLz1aYzCjPyB1mVCBEYC2q2EHoR6f1Q.png","created_at":"2023-09-14T12:16:22.000000Z","updated_at":"2023-09-14T12:16:22.000000Z"}]
/// status : 200

class AllCategoriesModel {
  AllCategoriesModel({
      String? message, 
      List<AllCategories>? data,
      num? status,}){
    _message = message;
    _data = data;
    _status = status;
}

  AllCategoriesModel.fromJson(dynamic json) {
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AllCategories.fromJson(v));
      });
    }
    _status = json['status'];
  }
  String? _message;
  List<AllCategories>? _data;
  num? _status;
AllCategoriesModel copyWith({  String? message,
  List<AllCategories>? data,
  num? status,
}) => AllCategoriesModel(  message: message ?? _message,
  data: data ?? _data,
  status: status ?? _status,
);
  String? get message => _message;
  List<AllCategories>? get data => _data;
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
/// name : "Football"
/// image : "categories/qzIQivK5mr3fNAk9j2MxwUQUNsIwdcxTtScna6kR.jpg"
/// created_at : "2023-09-14T12:16:07.000000Z"
/// updated_at : "2023-09-14T12:16:07.000000Z"

class AllCategories {
  AllCategories({
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

  AllCategories.fromJson(dynamic json) {
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
  AllCategories copyWith({  num? id,
  String? name,
  String? image,
  String? createdAt,
  String? updatedAt,
}) => AllCategories(  id: id ?? _id,
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