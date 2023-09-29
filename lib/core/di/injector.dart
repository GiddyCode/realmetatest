import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/auth_services.dart';
import '../services/utils/deeplinking_service.dart';
import '../services/utils/storage_service.dart';

final di = GetIt.instance;

Future<void> dependencyInjections() async {
  di.registerLazySingleton(() => AuthService());
  final sharedPreferences = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPreferences);
}
