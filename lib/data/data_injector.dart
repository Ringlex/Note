import 'package:get_it/get_it.dart';
import 'package:note/data/database/db_helper.dart';
import 'package:note/data/local/adapter/shared_preferences_adapter.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension DataInjector on GetIt {
  Future<void> registerData({required String apiUrl}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    this
      ..registerLazySingleton<SharedPreferencesAdapter>(
        () => SharedPreferencesAdapter(sharedPreferences: sharedPreferences),
      )
      ..registerLazySingleton<DBHelper>(() => DBHelper());
  }
}
