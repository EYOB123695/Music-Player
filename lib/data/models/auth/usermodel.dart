import 'package:spotify_clone/domain/entities/auth/user.dart';

class UserModel {
  String? ImageUrl;
  String? Fullname;
  String? email;
  UserModel({this.ImageUrl, this.Fullname, this.email});

  UserModel.fromJson(Map<String, dynamic> data) {
    Fullname = data["name"];
    email = data["email"];
    
  }
  UserEntity toEntity() {
    return UserEntity(
        email : email,
        Fullname : Fullname,
        );
  }
}
