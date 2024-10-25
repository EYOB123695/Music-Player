import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String Artist;
  final String Title;
  final num duration;
  final Timestamp releasedate;

  SongEntity({required this.Artist, required this.Title, required this.duration, required this.releasedate});

  
}
