import 'package:get_it/get_it.dart';
import 'package:note/data/data_injector.dart';
import 'package:note/presentation/components/auth/bloc/auth_bloc.dart';
import 'package:note/presentation/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:note/presentation/screens/dashboard/dashboard_argument.dart';
import 'package:note/presentation/screens/home/bloc/home_bloc.dart';
import 'package:note/presentation/screens/home/home_argument.dart';
import 'package:note/presentation/screens/profile/bloc/profile_bloc.dart';
import 'package:note/presentation/screens/profile/profile_argument.dart';

final injector = GetIt.instance;

Future<void> init({
  required String apiUrl,
}) async {
  await injector.registerData(apiUrl: apiUrl);

  injector
    ..registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        dbHelper: injector(),
      ),
    )
    ..registerFactoryParam<DashboardBloc, DashboardArgument, void>(
      (argument, _) => DashboardBloc(
        argument: argument,
      ),
    )
    ..registerFactoryParam<HomeBloc, HomeArgument, void>(
      (argument, _) => HomeBloc(
        argument: argument,
      ),
    )
    ..registerFactoryParam<ProfileBloc, ProfileArgument, void>(
      (argument, _) => ProfileBloc(
        argument: argument,
      ),
    );
}
