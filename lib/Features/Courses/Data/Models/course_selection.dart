class CourseSelection {
  CourseSelectionData? data;

  CourseSelection({this.data});

  CourseSelection.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? CourseSelectionData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CourseSelectionData {
  String? type;
  int? id;
  Attributes? attributes;

  CourseSelectionData({this.type, this.id, this.attributes});

  CourseSelectionData.fromJson(Map<String, dynamic> json) {
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
  int? minCreditHours;
  int? maxCreditHours;
  String? startAt;
  String? endAt;

  Attributes(
      {this.name,
      this.description,
      this.minCreditHours,
      this.maxCreditHours,
      this.startAt,
      this.endAt});

  Attributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    minCreditHours = json['minCreditHours'];
    maxCreditHours = json['maxCreditHours'];
    startAt = json['startAt'];
    endAt = json['endAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['minCreditHours'] = minCreditHours;
    data['maxCreditHours'] = maxCreditHours;
    data['startAt'] = startAt;
    data['endAt'] = endAt;
    return data;
  }
}
