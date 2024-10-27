import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/song/getnewsongusecae.dart';
import 'package:spotify_clone/presentation/Home/bloc/News_song_state.dart';
import 'package:spotify_clone/service_locator.dart';

class Newssongcubit extends Cubit<NewsSongState> {
  Newssongcubit() : super(Newssongloading());
  Future<void> getNewssongs() async {
    var returnedsongs = await sl<Getnewsongusecase>().call();
    returnedsongs.fold((l) {
      emit(Newssongfailed());
    }, (data) {
      emit(Newssongloaded(Songs: data));
    });
  }
}
