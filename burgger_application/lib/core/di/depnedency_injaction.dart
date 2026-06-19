import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

import '../../features/cart/data/repo/cart_repo_impl.dart';
import '../../features/cart/domain/repositories/cart_repository.dart';
import '../../features/cart/domain/use_cases/add_to_cart_use_case.dart';
import '../../features/cart/domain/use_cases/delete_from_cart_use_case.dart';
import '../../features/cart/domain/use_cases/get_cart_use_case.dart';
import '../../features/cart/presentation/cubit/cart_cubit.dart';
import '../../features/home/data/data_sources/products_local_data_source.dart';
import '../../features/home/data/models/products/product_data_adapter.dart';
import '../../features/home/data/repo/categories/categories_repo_impl.dart';
import '../../features/home/data/repo/products/products_repo_impl.dart';
import '../../features/home/domain/repositories/categories_repository.dart';
import '../../features/home/domain/repositories/products_repository.dart';
import '../../features/home/domain/use_cases/get_categories_use_case.dart';
import '../../features/home/domain/use_cases/get_products_use_case.dart';
import '../../features/home/presentation/cubit/categories/categories_cubit.dart';
import '../../features/home/presentation/cubit/products/products_cubit.dart';
import '../../features/login/data/repo/login_repo_impl.dart';
import '../../features/login/domain/repositories/login_repository.dart';
import '../../features/login/domain/use_cases/login_use_case.dart';
import '../../features/login/presentation/cubit/login_cubit.dart';
import '../../features/product_details/data/repo/side_options_repo_impl.dart';
import '../../features/product_details/data/repo/toppings_repo_impl.dart';
import '../../features/product_details/domain/repositories/side_options_repository.dart';
import '../../features/product_details/domain/repositories/toppings_repository.dart';
import '../../features/product_details/domain/use_cases/get_side_options_use_case.dart';
import '../../features/product_details/domain/use_cases/get_toppings_use_case.dart';
import '../../features/product_details/presentation/cubit/product_deatlies/product_deatlies_cubit.dart';
import '../../features/product_details/presentation/cubit/side_options/side_options_cubit.dart';
import '../../features/product_details/presentation/cubit/toppings/toppings_cubit.dart';
import '../../features/profile/data/repo/profile_repo_impl.dart';
import '../../features/profile/domain/repositories/profile_repository.dart';
import '../../features/profile/domain/use_cases/get_profile_data_use_case.dart';
import '../../features/profile/domain/use_cases/update_profile_data_use_case.dart';
import '../../features/profile/presentation/cubit/cubit_get_data/profile_cubit.dart';
import '../../features/profile/presentation/cubit/cubit_update_data/profile_update_cubit.dart';
import '../../features/sign_up/data/repo/signup_repo_impl.dart';
import '../../features/sign_up/domain/repositories/signup_repository.dart';
import '../../features/sign_up/domain/use_cases/sign_up_use_cases.dart';
import '../../features/sign_up/presentation/cubit/signup_cubit.dart';
import '../networking/dio_factory.dart';
import '../networking/web_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {


// HIVE & LOCAL STORAGE INITIALIZATION
  
  await Hive.initFlutter();

  Hive.registerAdapter(ProductDataAdapter());

  final homeBox = await Hive.openBox('home_cache_box');
  getIt.registerSingleton<Box>(homeBox, instanceName: 'home_cache_box');


  //registerLazySingleton mean create only one version and i will use in all app
  // registerFactory mean every time i use create new version
  

  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<WebService>(() => WebService(dio));

  // login
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepoImpl(getIt()));
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepository>(() => SignupRepoImpl(getIt()));
  getIt.registerLazySingleton<SignupUseCase>(() => SignupUseCase(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // categoryes
  getIt.registerLazySingleton<CategoriesRepository>(() => CategoriesRepoImpl(getIt()),);
  getIt.registerLazySingleton<GetCategoriesUseCase>(()=> GetCategoriesUseCase(getIt()),);
  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit(getIt()));

  //products
  getIt.registerLazySingleton<ProductsLocalDataSource>(
    () => ProductsLocalDataSource(getIt<Box>(instanceName: 'home_cache_box')),
  );
  getIt.registerLazySingleton<ProductsRepository>(
    () => ProductsRepoImpl(getIt<WebService>(), getIt<ProductsLocalDataSource>()),
  );
  getIt.registerFactory<GetProductsUseCase>(() => GetProductsUseCase(getIt()));
  getIt.registerFactory<ProductsCubit>(() => ProductsCubit(getIt()));
  // Toppings
getIt.registerLazySingleton<ToppingsRepository>(() => ToppingsRepoImpl(getIt()));
  getIt.registerLazySingleton<GetToppingsUseCase>(() => GetToppingsUseCase(getIt()));
  getIt.registerFactory<ToppingsCubit>(() => ToppingsCubit(getIt()));

  // Side Options
getIt.registerLazySingleton<SideOptionsRepository>(() => SideOptionsRepoImpl(getIt()));
  getIt.registerLazySingleton<GetSideOptionsUseCase>(() => GetSideOptionsUseCase(getIt()));
  getIt.registerFactory<SideOptionsCubit>(() => SideOptionsCubit(getIt()));
  getIt.registerFactory<ProductDetailsCubit>(() => ProductDetailsCubit());

  // Cart
getIt.registerLazySingleton<CartRepository>(() => CartRepoImpl(getIt()));
  getIt.registerLazySingleton<AddToCartUseCase>(() => AddToCartUseCase(getIt()));
  getIt.registerLazySingleton<GetCartUseCase>(() => GetCartUseCase(getIt()));
  getIt.registerLazySingleton<DeleteFromCartUseCase>(() => DeleteFromCartUseCase(getIt()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt(), getIt(), getIt()));

  // Profile Get data
getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepoImpl(getIt()));
getIt.registerLazySingleton<GetProfileDataUseCase>(() => GetProfileDataUseCase(getIt()));
  // Profile Update data
 getIt.registerLazySingleton<UpdateProfileDataUseCase>(() => UpdateProfileDataUseCase(getIt()));
getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));
getIt.registerFactory<ProfileUpdateCubit>(() => ProfileUpdateCubit(getIt()));
}
