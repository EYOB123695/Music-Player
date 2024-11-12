import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify_clone/presentation/Home/pages/song_player/pages/bloc/song_player_state.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration songduration = Duration.zero;
  Duration songposition = Duration.zero;
  SongPlayerCubit() : super(SongPlayerLoading()) {
    audioPlayer.positionStream.listen((position) {
      songposition = position;
      updateplaysong();
    });
    audioPlayer.durationStream.listen((duration) {
      songduration = duration!;
    });
  }

  void loadsong(String url) async {
    try {
      await audioPlayer.setUrl(url);
      emit(SongPlayerLoaded());
    } catch (e) {
      emit(SongPlayerFailure());
    }
  }

  void playorpause() {
    if (audioPlayer.playing) {
      audioPlayer.stop();
    } else {
      audioPlayer.play();
    }
  }

  void updateplaysong() {
    emit(SongPlayerLoaded());
  }

  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
