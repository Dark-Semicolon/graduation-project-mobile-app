class UserDataModel {
  Data? data;

  UserDataModel({this.data});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? type;
  int? id;
  Attributes? attributes;
  double? gpa;

  Data({this.type, this.id, this.attributes, this.gpa});

  Data.fromJson(Map<String, dynamic> json) {
    gpa = json['gpa']?.toDouble(); // Ensure it's parsed as a double
    type = json['type'];
    id = json['id'];
    attributes = json['attributes'] != null ? Attributes.fromJson(json['attributes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gpa'] = gpa;
    data['type'] = type;
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? image;
  String? name;
  String? email;
  Null emailVerifiedAt;
  int? status;
  int? grade;
  String? createdAt;
  String? updatedAt;

  Attributes(
      {this.image,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.status,
        this.grade,
        this.createdAt,
        this.updatedAt});

  Attributes.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['emailVerifiedAt'];
    status = json['status'];
    grade = json['grade'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['email'] = email;
    data['emailVerifiedAt'] = emailVerifiedAt;
    data['status'] = status;
    data['grade'] = grade;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
