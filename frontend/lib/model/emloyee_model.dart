class EmployeeModel {
  final String username;
  final String email;
  final String? password;
  final String? imgUrl;

  EmployeeModel(
      {required this.username,
      required this.email,
      this.password,
      this.imgUrl});

  toJson() {
    return {
      "username": username,
      "email": email,
      "password": password,
      "imgUrl": imgUrl,
    };
  }
}
