import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/datasources/auth/authfirebaseserviceabstract.dart';
import 'package:spotify_clone/data/models/auth/createuserreq.dart';

class AuthFirebaseimpl extends AuthFirebaseService {
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(Createuserreq createuserreq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createuserreq.email, password: createuserreq.password);

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
