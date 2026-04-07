import 'package:burgger_application/core/networking/dio_factory.dart';
import 'package:burgger_application/core/networking/web_service.dart';
import 'package:burgger_application/features/home/data/repo/categories/categories_repo.dart';
import 'package:burgger_application/features/home/data/repo/products/products_repo.dart';
import 'package:burgger_application/features/home/logic/cubit/categories/categories_cubit.dart';
import 'package:burgger_application/features/home/logic/cubit/products/products_cubit.dart';
import 'package:burgger_application/features/login/data/repo/login_repo.dart';
import 'package:burgger_application/features/login/logic/cubit/login_cubit.dart';
import 'package:burgger_application/features/signup/data/repo/signup_repo.dart';
import 'package:burgger_application/features/signup/logic/cubit/signup_cubit.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<WebService>(() => WebService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //registerLazySingleton mean create only one version and i will use in all app
  // registerFactory mean every time i use create new version

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // categoryes
  getIt.registerLazySingleton<CategoriesRepo>(() => CategoriesRepo(getIt()));
  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit(getIt()));

  //products
  getIt.registerLazySingleton<ProductsRepo>(() => ProductsRepo(getIt()));
  getIt.registerFactory<ProductsCubit>(() => ProductsCubit(getIt()));

}
