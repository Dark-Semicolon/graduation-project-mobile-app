class EnrollmentBody {
  List<int>? courses;

  EnrollmentBody({this.courses});

  EnrollmentBody.fromJson(Map<String, dynamic> json) {
    courses = json['courses'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['courses'] = courses;
    return data;
  }
}
