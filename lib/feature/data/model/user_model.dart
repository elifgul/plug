import 'package:plug/feature/domain/entity/user.dart';

class UserModel extends User {
  UserModel(
      {String userId,
      String userName,
      String name,
      String surname,
      String displayName,
      String token})
      : super(userId, userName, name, surname, displayName, token);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      userName: json['userName'],
      name: json['name'],
      surname: json['surname'],
      displayName: json['displayName'],
      token:null,
    );
  }
}
