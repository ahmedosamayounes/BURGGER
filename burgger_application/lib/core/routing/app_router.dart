import 'package:burgger_application/core/di/depnedency_injaction.dart';
import 'package:burgger_application/core/networking/web_service.dart';
import 'package:burgger_application/core/routing/routes_string.dart';
import 'package:burgger_application/features/cart/logic/cubit/cart_cubit.dart';
import 'package:burgger_application/features/cart/ui/cart_screen.dart';
import 'package:burgger_application/features/home/data/models/products/products_model.dart';
import 'package:burgger_application/features/home/logic/cubit/categories/categories_cubit.dart';
import 'package:burgger_application/features/product_details/logic/cubit/product_deatlies/product_deatlies_cubit.dart';
import 'package:burgger_application/features/home/logic/cubit/products/products_cubit.dart';
import 'package:burgger_application/features/home/ui/home_screen.dart';

import 'package:burgger_application/features/product_details/logic/cubit/side_options/side_options_cubit.dart';
import 'package:burgger_application/features/product_details/logic/cubit/toppings/toppings_cubit.dart';
import 'package:burgger_application/features/product_details/ui/product_deatlies_screen.dart';
import 'package:burgger_application/features/login/data/repo/login_repo.dart';
import 'package:burgger_application/features/login/logic/cubit/login_cubit.dart';
import 'package:burgger_application/features/login/ui/login_screen.dart';
import 'package:burgger_application/features/profile/logic/cubit_get_data/profile_cubit.dart';
import 'package:burgger_application/features/profile/logic/cubit_update_data/profile_update_cubit.dart';
import 'package:burgger_application/features/profile/ui/profile_screen.dart';
import 'package:burgger_application/features/signup/data/repo/signup_repo.dart';
import 'package:burgger_application/features/signup/logic/cubit/signup_cubit.dart';
import 'package:burgger_application/features/signup/ui/register_screen.dart';
import 'package:burgger_application/root.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesString.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case RoutesString.register:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: BlocProvider(
              create: (context) => getIt<SignupCubit>(),
              child: const RegisterScreen(),
            ),
          ),
        );

      case RoutesString.home:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CategoriesCubit(getIt())..getCategories(),
              ),

              BlocProvider(
                create: (context) => ProductsCubit(getIt())..getProduct(),
              ),
              BlocProvider(create: (context) => ProfileCubit(getIt())),
            ],
            child: HomeScreen(),
          ),
        );

      case RoutesString.productDetail:
        final product = settings.arguments as ProductData;

        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    ProductDeatliesCubit(getIt())
                      ..getProductById(product.id ?? 1),
              ),
              BlocProvider(
                create: (context) => ToppingsCubit(getIt())..getToppings(),
              ),
              BlocProvider(
                create: (context) =>
                    SideOptionsCubit(getIt())..getSideOptions(),
              ),
              BlocProvider(create: (context) => getIt<CartCubit>()),
            ],

            child: ProductDeatlies(product: settings.arguments as ProductData),
          ),
        );

      case RoutesString.cart:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: BlocProvider(
              create: (context) => CartCubit(getIt()),

              child: CartScreen(),
            ),
          ),
        );

      case RoutesString.profile:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ProfileCubit(getIt())..getProfileData(),
              ),
              BlocProvider(create: (context) => ProfileUpdateCubit(getIt())),
            ],
            child: ProfileScreen(),
          ),
        );
      case RoutesString.root:
        return MaterialPageRoute(builder: (_) => RootScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
