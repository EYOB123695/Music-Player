import 'package:spotify_clone/domain/entities/song/song.dart';

abstract class PlayListState {}

class Playlistloading extends PlayListState {}

class playlistloaded extends PlayListState {
  final List<SongEntity> songs;
  playlistloaded({required this.songs});
}

class Playlistfailed extends PlayListState {}
