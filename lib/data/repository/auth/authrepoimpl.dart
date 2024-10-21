import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/datasources/auth/authfirebaseserviceabstract.dart';
import 'package:spotify_clone/data/models/auth/createuserreq.dart';
import 'package:spotify_clone/domain/repository/auth/authrepo.dart';
import 'package:spotify_clone/service_locator.dart';

class Authrepoimpl extends AuthRepository {
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(Createuserreq createuserreq) async{
    return await sl<AuthFirebaseService>().signup(createuserreq);
    
  }
}