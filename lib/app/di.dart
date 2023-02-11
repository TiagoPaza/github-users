import 'package:get_it/get_it.dart';
import 'package:github_users/data/data_source/local_data_source.dart';
import 'package:github_users/data/data_source/remote_data_source.dart';
import 'package:github_users/data/network/app_api.dart';
import 'package:github_users/data/network/dio_factory.dart';
import 'package:github_users/data/network/network_info.dart';
import 'package:github_users/data/repository/repository_impl.dart';
import 'package:github_users/domain/repository/repository.dart';
import 'package:github_users/domain/usecase/home_usecase.dart';
import 'package:github_users/domain/usecase/user_details_usecase.dart';
import 'package:github_users/presentation/home/cubit/home_cubit.dart';
import 'package:github_users/presentation/user_details/cubit/user_details_cubit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_prefs.dart';

final getIt = GetIt.instance;

Future<void> initAppModule() async {
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs getIt
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs getIt
  getIt.registerLazySingleton<AppPreferences>(() => AppPreferences(getIt()));

  // network info
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  getIt.registerLazySingleton<DioFactory>(() => DioFactory(getIt()));

  // app  service client
  final dio = await getIt<DioFactory>().getDio();
  getIt.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  getIt.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImplementer(getIt()),
  );

  // local data source
  getIt.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImplementer(),
  );

  // repository
  getIt.registerLazySingleton<Repository>(
    () => RepositoryImpl(getIt(), getIt(), getIt()),
  );
}

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    getIt.registerFactory<HomeUseCase>(() => HomeUseCase(getIt()));

    getIt.registerLazySingleton<HomeCubit>(
      () => HomeCubit(getIt()),
    );
  }
}

initUserDetailsModule() {
  if (!GetIt.I.isRegistered<UserDetailsUseCase>()) {
    getIt.registerFactory<UserDetailsUseCase>(() => UserDetailsUseCase());

    getIt.registerLazySingleton<UserDetailsCubit>(
      () => UserDetailsCubit(getIt()),
    );
  }
}

resetModules() {
  getIt.reset(dispose: false);

  initAppModule();
  initHomeModule();
  initUserDetailsModule();
}
