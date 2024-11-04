import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/core/configs/constants/AppUrls.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage(imageUrl)))),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    width: 40,
                    height: 40,
                    transform: Matrix4.translationValues(10, 10, 0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.isDarkMode
                            ? AppColors.Darkgray
                            : const Color(0xffE6E6E6E)),
                    child: Icon(Icons.play_arrow_rounded,
                        color: context.isDarkMode
                            ? Color(0xff959595)
                            : Color(0xff555555))),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                songs[index].Title,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                songs[index].Artist,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white),
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
