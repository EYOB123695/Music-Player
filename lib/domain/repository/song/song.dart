import 'package:dartz/dartz.dart';

abstract class Songrepo {
  Future<Either> getNewSongs();
  Future<Either> getplaylist();
}
