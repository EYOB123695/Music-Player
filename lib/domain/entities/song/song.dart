import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String Artist;
  final String Title;
  final num duration;
  final Timestamp releasedate;
  final bool isFavourite;
  final String songId;

  SongEntity(
      {required this.Artist,
      required this.Title,
      required this.duration,
      required this.releasedate,
      required this.isFavourite,
      required this.songId});
}
