import 'package:spotify_clone/domain/entities/song/song.dart';

abstract class NewsSongState {}

class Newssongloading extends NewsSongState {}

class Newssongloaded extends NewsSongState {
  final List<SongEntity> songs;
  Newssongloaded({required this.songs}); 


}
class Newssongfailed extends NewsSongState{}


