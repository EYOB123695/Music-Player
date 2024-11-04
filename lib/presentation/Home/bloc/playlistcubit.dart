import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/domain/usecases/song/getnewsongusecae.dart';
import 'package:spotify_clone/domain/usecases/song/getplaylistusecase.dart';
import 'package:spotify_clone/presentation/Home/bloc/News_song_state.dart';
import 'package:spotify_clone/presentation/Home/bloc/playlist_state.dart';
import 'package:spotify_clone/service_locator.dart';

class Playlistcubit extends Cubit<PlayListState> {
  Playlistcubit() : super(Playlistloading());
  Future<void> getplaylist() async {
    var returnedsongs = await sl<Getplaylistusecase>().call();
    returnedsongs.fold((l) {
      emit(Playlistfailed());
    }, (data) {
      emit(playlistloaded(songs: data));
    });
  }
}
