class FixerModel {
  final String userName;
  final String email;
  final String description;
  final double rating;
  final String specialty;
  final List<String>? otherSpecialties;
  final String contact;
  final double experience;

  FixerModel({
    required this.userName,
    required this.email,
    required this.description,
    required this.rating,
    required this.specialty,
    required this.otherSpecialties,
    required this.contact,
    required this.experience,
  });
}
