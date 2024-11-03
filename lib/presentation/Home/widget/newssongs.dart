import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/core/configs/constants/AppUrls.dart';
import 'package:spotify_clone/domain/entities/song/song.dart';
import 'package:spotify_clone/presentation/Home/bloc/News_song_cubit.dart';
import 'package:spotify_clone/presentation/Home/bloc/News_song_state.dart';

class Newssongs extends StatelessWidget {
  const Newssongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Newssongcubit()..getNewssongs(),
      child: SizedBox(
          height: 200,
          child: BlocBuilder<Newssongcubit, NewsSongState>(
            builder: (context, state) {
              if (state is Newssongloading) {
                return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator());
              } else if (state is Newssongloaded) {
                print(state.songs);
                return _songs(state.songs);
              }
              return Container();
            },
          )),
    );
  }

  String _sanitize(String input) {
    return input.replaceAll('"', '').trim();
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        // Sanitize and encode artist and title
        String artist = Uri.encodeComponent(_sanitize(songs[index].Artist));
        String title = Uri.encodeComponent(_sanitize(songs[index].Title));

        // Construct the complete URL
        String imageUrl =
            '${Appurls.firestorage}$artist - $title.jpg?${Appurls.mediaAlt}';

        return SizedBox(
            width: 160,
            child: Column(children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          
                            fit: BoxFit.cover, image: NetworkImage(imageUrl)))),
              )
            ]));
      },
      separatorBuilder: (context, index) => SizedBox(
        width: 14,
      ),
      itemCount: songs.length,
    );
  }
}
