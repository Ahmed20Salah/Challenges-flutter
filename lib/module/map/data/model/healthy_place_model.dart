/// message : "All Healthy Places Here"
/// data : [{"id":2,"name":"Healthy Place  test","image":"healthy/XP7G8Bh71SKFJ37NXqUdeEStg3PEILheC9v3m7VV.jpg","latitude":"0.25410000","longitude":"0.12454854","address":"helthy address test","created_at":"2023-09-17 11:11:42","updated_at":"2023-09-17 11:11:42","distance":65618.2845321456},{"id":3,"name":"Healthy Place  test3","image":"healthy/quqizrJe2D1PghGHz9Yu2oyPzIowkNBoq3L8skXX.jpg","latitude":"0.12300000","longitude":"0.23532500","address":"address test3","created_at":"2023-09-17 11:14:44","updated_at":"2023-09-17 11:14:44","distance":65657.81069713997},{"id":1,"name":"dgxfch","image":"healthy/LgE7ixLOC1bSZJ0mHgSB5lUgYu5vDnGWEVqxj0OU.jpg","latitude":"0.14520000","longitude":"0.14526530","address":"hjhmg,jk","created_at":"2023-09-14 12:15:43","updated_at":"2023-09-14 12:15:43","distance":65691.79190491531}]
/// status : 200

class HealthyPlaceModel {
  HealthyPlaceModel({
      String? message, 
      List<Data>? data, 
      num? status,}){
    _message = message;
    _data = data;
    _status = status;
}

  HealthyPlaceModel.fromJson(dynamic json) {
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
HealthyPlaceModel copyWith({  String? message,
  List<Data>? data,
  num? status,
}) => HealthyPlaceModel(  message: message ?? _message,
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

/// id : 2
/// name : "Healthy Place  test"
/// image : "healthy/XP7G8Bh71SKFJ37NXqUdeEStg3PEILheC9v3m7VV.jpg"
/// latitude : "0.25410000"
/// longitude : "0.12454854"
/// address : "helthy address test"
/// created_at : "2023-09-17 11:11:42"
/// updated_at : "2023-09-17 11:11:42"
/// distance : 65618.2845321456

class Data {
  Data({
      num? id, 
      String? name, 
      String? image, 
      String? latitude, 
      String? longitude, 
      String? address, 
      String? createdAt, 
      String? updatedAt, 
      num? distance,}){
    _id = id;
    _name = name;
    _image = image;
    _latitude = latitude;
    _longitude = longitude;
    _address = address;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _distance = distance;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _address = json['address'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _distance = json['distance'];
  }
  num? _id;
  String? _name;
  String? _image;
  String? _latitude;
  String? _longitude;
  String? _address;
  String? _createdAt;
  String? _updatedAt;
  num? _distance;
Data copyWith({  num? id,
  String? name,
  String? image,
  String? latitude,
  String? longitude,
  String? address,
  String? createdAt,
  String? updatedAt,
  num? distance,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  address: address ?? _address,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  distance: distance ?? _distance,
);
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get address => _address;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get distance => _distance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['address'] = _address;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['distance'] = _distance;
    return map;
  }

}