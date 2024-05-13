class Professor {
  final String type;
  final int id;
  final ProfessorAttributes professorAttributes;

  Professor(
      {required this.type,
      required this.id,
      required this.professorAttributes});

  factory Professor.fromJson(json) {
    return Professor(
        type: json['type'],
        id: json['id'],
        professorAttributes: ProfessorAttributes.fromJson(json['attributes']));
  }
}

class ProfessorAttributes {
  final String name;
  final String email;

  ProfessorAttributes({required this.name, required this.email});

  factory ProfessorAttributes.fromJson(json) {
    return ProfessorAttributes(name: json['name'], email: json['email']);
  }
}
