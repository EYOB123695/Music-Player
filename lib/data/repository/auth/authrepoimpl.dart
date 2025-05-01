import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/core/configs/constants/AppUrls.dart';
import 'package:spotify_clone/data/datasources/auth/authfirebaseserviceabstract.dart';
import 'package:spotify_clone/data/models/auth/createuserreq.dart';
import 'package:spotify_clone/data/models/auth/signinreq.dart';
import 'package:spotify_clone/data/models/auth/usermodel.dart';
import 'package:spotify_clone/domain/entities/auth/user.dart';
import 'package:spotify_clone/domain/repository/auth/authrepo.dart';
import 'package:spotify_clone/service_locator.dart';

class Authrepoimpl extends AuthRepository {
  @override
  Future<Either> signin(Signinreq signinreq) async {
    return await sl<AuthFirebaseService>().signin(signinreq);
  }

  @override
  Future<Either> signup(Createuserreq createuserreq) async {
    return await sl<AuthFirebaseService>().signup(createuserreq);
  }

  @override
  Future<Either> getUser() async {
    return await sl<AuthFirebaseService>().getUser();
    
  }
}
