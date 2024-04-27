

class Professor{
  final String type;
  final int id;
  final ProfessorAttributes professorAttributes;

  Professor({required this.type, required this.id, required this.professorAttributes});


}

class ProfessorAttributes{
  final String name;
  final String email;

  ProfessorAttributes({required this.name, required this.email});
}