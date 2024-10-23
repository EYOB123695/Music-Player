
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/auth/signinreq.dart';
import 'package:spotify_clone/domain/repository/auth/authrepo.dart';
import 'package:spotify_clone/service_locator.dart';

class Signinusecase implements Usecase<Either, Signinreq> {
  @override
  Future<Either> call({Signinreq ? params}) {
    return sl<AuthRepository>().signin(params!);
  }
}
