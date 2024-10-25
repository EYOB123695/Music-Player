import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/datasources/song/song_firebase_service.dart';
import 'package:spotify_clone/domain/repository/song/song.dart';
import 'package:spotify_clone/service_locator.dart';

class Songrepoimpl extends Songrepo {
  @override
  Future<Either> getNewSongs() async{
    return  await sl<SongFirebaseService>().getNewSongs() ;
  }
}