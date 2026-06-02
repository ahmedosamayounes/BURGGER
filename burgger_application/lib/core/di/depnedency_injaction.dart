import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/cart/data/repo/cart_repo.dart';
import '../../features/cart/logic/cubit/cart_cubit.dart';
import '../../features/home/data/repo/categories/categories_repo.dart';
import '../../features/home/data/repo/product_details/product_details_repo.dart';
import '../../features/home/data/repo/products/products_repo.dart';
import '../../features/home/logic/cubit/categories/categories_cubit.dart';
import '../../features/home/logic/cubit/products/products_cubit.dart';
import '../../features/login/data/repo/login_repo.dart';
import '../../features/login/logic/cubit/login_cubit.dart';
import '../../features/product_details/data/repo/side_options_repo.dart';
import '../../features/product_details/data/repo/toppings_repo.dart';
import '../../features/product_details/logic/cubit/product_deatlies/product_deatlies_cubit.dart';
import '../../features/product_details/logic/cubit/side_options/side_options_cubit.dart';
import '../../features/product_details/logic/cubit/toppings/toppings_cubit.dart';
import '../../features/profile/data/repo/profile_repo.dart';
import '../../features/profile/logic/cubit_get_data/profile_cubit.dart';
import '../../features/profile/logic/cubit_update_data/profile_update_cubit.dart';
import '../../features/signup/data/repo/signup_repo.dart';
import '../../features/signup/logic/cubit/signup_cubit.dart';
import '../networking/dio_factory.dart';
import '../networking/web_service.dart';

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

  // product Deatils
  getIt.registerLazySingleton<ProductDetailsRepo>(
    () => ProductDetailsRepo(getIt()),
  );
  getIt.registerFactory<ProductDetailsCubit>(
    () => ProductDetailsCubit(getIt()),
  );

  // Toppings
  getIt.registerLazySingleton<ToppingsRepo>(() => ToppingsRepo(getIt()));
  getIt.registerFactory<ToppingsCubit>(() => ToppingsCubit(getIt()));

  // Side Options
  getIt.registerLazySingleton<SideOptionsRepo>(() => SideOptionsRepo(getIt()));
  getIt.registerFactory<SideOptionsCubit>(() => SideOptionsCubit(getIt()));

  // Cart
  getIt.registerLazySingleton<CartRepo>(() => CartRepo(getIt()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));

  // Profile Get data
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));
  // Profile Update data
  getIt.registerFactory<ProfileUpdateCubit>(() => ProfileUpdateCubit(getIt()));
}
