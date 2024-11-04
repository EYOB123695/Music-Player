import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/song/song.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewSongs();
  Future<Either> getplaylist();
}

class SongFirebaseServiceimpl implements SongFirebaseService {
  @override
  Future<Either> getNewSongs() async {
    List<SongEntity> Songs = [];
    try {
      var data = await FirebaseFirestore.instance
          .collection("song")
          .orderBy('releasedate', descending: true)
          .limit(4)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        // print('Song retrieved: ${songModel.toJson()}');

        Songs.add(songModel.toEntity());
      }
      return Right(Songs);
    } catch (e) {
      return Left("An error has occured try again");
    }
  }
  
  @override
  Future<Either> getplaylist() async {
     List<SongEntity> Songs = [];
    try {
      var data = await FirebaseFirestore.instance
          .collection("song")
          .orderBy('releasedate', descending: true)
          .limit(4)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        // print('Song retrieved: ${songModel.toJson()}');

        Songs.add(songModel.toEntity());
      }
      return Right(Songs);
    } catch (e) {
      return Left("An error has occured try again");
    }
  
  }
}
