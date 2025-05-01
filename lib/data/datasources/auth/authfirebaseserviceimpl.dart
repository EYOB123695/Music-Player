import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/core/configs/constants/AppUrls.dart';
import 'package:spotify_clone/data/datasources/auth/authfirebaseserviceabstract.dart';
import 'package:spotify_clone/data/models/auth/createuserreq.dart';
import 'package:spotify_clone/data/models/auth/signinreq.dart';
import 'package:spotify_clone/data/models/auth/usermodel.dart';
import 'package:spotify_clone/domain/entities/auth/user.dart';

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
      String uid = data.user?.uid ?? '';
      

      if (uid.isNotEmpty) {
        try {
          await FirebaseFirestore.instance.collection('users').doc(uid).set({
            "name": createuserreq.fullname,
            "email": data.user?.email,
          });
          return const Right("Account Created successfully!");
        } catch (e) {
          print("Firestore Error: $e");
          return Left("Failed to save user data to Firestore");
        }
      } else {
        return Left("Failed to create user document due to missing UID");
      }
    } on FirebaseAuthException catch (e) {
      String message = " ";
      if (e.code == "weak-password") {
        message = "The password you entered is weak";
      } else if (e.code == "email-already-in-use") {
        message = "The email is already in use";
      }
      return Left(message);
    }
  }
  
  @override
  
    Future<Either> getUser() async {
    try{
    FirebaseAuth firebaseauth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = await firebaseFirestore
        .collection('Users')
        .doc(firebaseauth.currentUser!.uid)
        .get();
    UserModel userModel = UserModel.fromJson(user.data()!);
    userModel.ImageUrl = firebaseauth.currentUser?.photoURL ?? Appurls.defaultImage ;
    UserEntity userEntity = userModel.toEntity();
    return Right(userEntity); 
    }catch(e){
      return Left("An error has occured");
    }
  }
  
}
