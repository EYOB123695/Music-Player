import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';

class SongModel {
  String? Artist;
  String? Title;
  num? duration;
  Timestamp? releasedate;
  bool? isFavourite;
  String? songId;

  SongModel(
      {this.Artist,
      this.Title,
      this.duration,
      this.releasedate,
      this.isFavourite,
      this.songId});

  SongModel.fromJson(Map<String, dynamic> data) {
    Artist = data["Artist"];
    Title = data["Title"];
    duration = data["duration"];
    releasedate = data["releasedate"];
  }
  SongEntity toEntity() {
    return SongEntity(
        Artist: Artist ?? " ",
        Title: Title ?? " ",
        duration: duration ?? 0,
        releasedate: releasedate ?? Timestamp.now(),
        isFavourite: isFavourite!,
        songId: songId!);
  }
}
