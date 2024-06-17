import 'dart:convert';

class User {
  String firstName;
  String lastName;
  bool isActive;
  int age;

  User(this.firstName, this.lastName, this.isActive, this.age);

  String toJson() {
    Map<String, dynamic> userMap = {
      'firstName': firstName,
      'lastName': lastName,
      'isActive': isActive,
      'age': age
    };

    return jsonEncode(userMap);
  }
}

void main() {
  var user = User('Gildong', 'Hong', true, 30);
  var jsonString = user.toJson();

  print(jsonString);
}

