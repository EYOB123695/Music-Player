import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/datasources/auth/authfirebaseserviceabstract.dart';
import 'package:spotify_clone/data/datasources/auth/authfirebaseserviceimpl.dart';
import 'package:spotify_clone/data/repository/auth/authrepoimpl.dart';
import 'package:spotify_clone/domain/repository/auth/authrepo.dart';
import 'package:spotify_clone/domain/usecases/signupusecase.dart';

final sl = GetIt.instance;

Future<void> initializedependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseimpl());
  sl.registerSingleton<AuthRepository>(Authrepoimpl());
  sl.registerSingleton<Signupusecase>(Signupusecase());
}
