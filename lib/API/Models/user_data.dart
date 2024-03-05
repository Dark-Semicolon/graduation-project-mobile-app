class UserDataModel {
  int? id;
  dynamic image;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  int? status;
  int? grade;
  String? createdAt;
  String? updatedAt;

  UserDataModel({
    this.id,
    this.image,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.status,
    this.grade,
    this.createdAt,
    this.updatedAt,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      status: json['status'],
      grade: json['grade'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
