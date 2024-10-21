import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/auth/createuserreq.dart';
import 'package:spotify_clone/domain/repository/auth/authrepo.dart';
import 'package:spotify_clone/service_locator.dart';

class Signupusecase implements Usecase<Either, Createuserreq> {
  @override
  Future<Either> call({Createuserreq? params}) {
    return sl<AuthRepository>().signup(params!);
  }
}
