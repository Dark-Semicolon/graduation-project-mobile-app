class AvailableCourses {
  List<AvailableCoursesData>? data;

  AvailableCourses({this.data});

  AvailableCourses.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AvailableCoursesData>[];
      json['data'].forEach((v) {
        data!.add(AvailableCoursesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AvailableCoursesData {
  String? type;
  int? id;
  Attributes? attributes;

  AvailableCoursesData({this.type, this.id, this.attributes});

  AvailableCoursesData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? name;
  String? description;
  int? creditHours;

  Attributes({this.name, this.description, this.creditHours});

  Attributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    creditHours = json['creditHours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['creditHours'] = creditHours;
    return data;
  }
}
