import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/auth/signinreq.dart';
import 'package:spotify_clone/domain/repository/auth/authrepo.dart';
import 'package:spotify_clone/domain/repository/song/song.dart';
import 'package:spotify_clone/service_locator.dart';

class Getplaylistusecase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<Songrepo>().getplaylist();
  }
}
