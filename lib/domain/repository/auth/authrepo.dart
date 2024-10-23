import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/createuserreq.dart';
import 'package:spotify_clone/data/models/auth/signinreq.dart';

abstract class AuthRepository {
  Future<Either> signup(Createuserreq createuserreq);
  Future<Either> signin(Signinreq signinreq);
}
