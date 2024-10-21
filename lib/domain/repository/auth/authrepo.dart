import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/createuserreq.dart';

abstract class AuthRepository {
  Future<Either> signup(Createuserreq createuserreq);
  Future<void> signin();
}
