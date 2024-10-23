import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/datasources/auth/authfirebaseserviceabstract.dart';
import 'package:spotify_clone/data/models/auth/createuserreq.dart';
import 'package:spotify_clone/data/models/auth/signinreq.dart';

class AuthFirebaseimpl extends AuthFirebaseService {
  @override
  Future<Either> signin(Signinreq signinreq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinreq.email, password: signinreq.password);

      return const Right("Account Created succesfully !");
    } on FirebaseAuthException catch (e) {
      String message = " ";
      if (e.code == "invalid-email") {
        message = "Incorrect email";
      } else if (e.code == "invalid-credentials") {
        message = "Wrong password provided for the credentials";
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signup(Createuserreq createuserreq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createuserreq.email, password: createuserreq.password);
      try {
        FirebaseFirestore.instance
            .collection('Users')
            .add({"name": createuserreq.fullname, "email": data.user?.email});
      } catch (e) {
        print("Firestore Error: $e");
      }

      return const Right("Account Created succesfully !");
    } on FirebaseAuthException catch (e) {
      String message = " ";
      if (e.code == "weak-password") {
        message = "The password you entered is weak ";
      } else if (e.code == "email-already-in-use") {
        message = "The email is already in use";
      }
      return Left(message);
    }
  }
}
