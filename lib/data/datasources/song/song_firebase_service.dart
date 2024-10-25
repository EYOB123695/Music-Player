import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewSongs();
}

class SongFirebaseServiceimpl implements SongFirebaseService {
  @override
  Future<Either> getNewSongs() async {
    List Songs = [];
    try {
      var data = await FirebaseFirestore.instance
          .collection("Songs")
          .orderBy('releasedate', descending: true)
          .limit(3)
          .get();
      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        Songs.add(songModel.toEntity());
      }
      return Right(Songs);
    } catch (e) {
      return Left("An error has occured try again");
    }
  }
}
