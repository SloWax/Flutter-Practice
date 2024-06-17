# Json

## Json 직렬화
```
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
```

DebugConsol
<p align="left">
<img width="500" alt="7" src="https://github.com/SloWax/Flutter-Practice/assets/62653558/da72605d-2af5-4e45-b283-a6e9c353c01c">
</p>