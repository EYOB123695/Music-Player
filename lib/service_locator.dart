import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/datasources/auth/authfirebaseserviceabstract.dart';
import 'package:spotify_clone/data/datasources/auth/authfirebaseserviceimpl.dart';
import 'package:spotify_clone/data/datasources/song/song_firebase_service.dart';
import 'package:spotify_clone/data/repository/auth/authrepoimpl.dart';
import 'package:spotify_clone/data/repository/song/songrepoimpl.dart';
import 'package:spotify_clone/domain/repository/auth/authrepo.dart';
import 'package:spotify_clone/domain/repository/song/song.dart';
import 'package:spotify_clone/domain/usecases/signinusecase.dart';
import 'package:spotify_clone/domain/usecases/signupusecase.dart';
import 'package:spotify_clone/domain/usecases/song/addorremove_favourites.dart';
import 'package:spotify_clone/domain/usecases/song/getnewsongusecae.dart';
import 'package:spotify_clone/domain/usecases/song/getplaylistusecase.dart';
import 'package:spotify_clone/domain/usecases/song/isfavourite_uecase.dart';

final sl = GetIt.instance;

Future<void> initializedependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseimpl());
  sl.registerSingleton<AuthRepository>(Authrepoimpl());
  sl.registerSingleton<Signupusecase>(Signupusecase());
  sl.registerSingleton<Signinusecase>(Signinusecase());
  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceimpl());
  sl.registerSingleton<Songrepo>(Songrepoimpl());
  sl.registerSingleton<Getnewsongusecase>(Getnewsongusecase());
  sl.registerSingleton<Getplaylistusecase>(Getplaylistusecase());
  sl.registerSingleton<Addorremovefavouriteusecase>(
      Addorremovefavouriteusecase());
  sl.registerSingleton<IsfavouriteUsecase>(IsfavouriteUsecase());
}
