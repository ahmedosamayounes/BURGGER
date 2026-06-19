import '../../features/cart/presentation/cubit/cart_cubit.dart';
import '../../features/cart/presentation/screens/cart_screen.dart';
import '../../features/home/domain/entities/product_entity.dart';
import '../../features/home/presentation/cubit/categories/categories_cubit.dart';
import '../../features/home/presentation/cubit/products/products_cubit.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/login/presentation/cubit/login_cubit.dart';
import '../../features/login/presentation/screens/login_screen.dart';
import '../../features/product_details/presentation/cubit/product_deatlies/product_deatlies_cubit.dart';
import '../../features/product_details/presentation/cubit/side_options/side_options_cubit.dart';
import '../../features/product_details/presentation/cubit/toppings/toppings_cubit.dart';
import '../../features/product_details/presentation/screens/product_details_screen.dart';
import '../../features/profile/presentation/cubit/cubit_get_data/profile_cubit.dart';
import '../../features/profile/presentation/cubit/cubit_update_data/profile_update_cubit.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/sign_up/presentation/cubit/signup_cubit.dart';
import '../../features/sign_up/presentation/screens/signup_screen.dart';
import '../di/depnedency_injaction.dart';
import 'routes_string.dart';
import '../../root.dart';
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
              child: const SignupScreen(),
            ),
          ),
        );

      case RoutesString.home:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ProductsCubit>()..getProduct(),
              ),
              BlocProvider(
                create: (context) => getIt<ProfileCubit>(),
              ),
            ],
            child: HomeScreen(),
          ),
        );

      case RoutesString.productDetail:
        final product = settings.arguments as ProductEntity;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ProductDetailsCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<ToppingsCubit>()..getToppings(),
              ),
              BlocProvider(
                create: (context) => getIt<SideOptionsCubit>()..getSideOptions(),
              ),
              BlocProvider(
                create: (context) => getIt<CartCubit>(),
              ),
            ],
            child: ProductDetails(product: product),
          ),
        );

      case RoutesString.cart:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: BlocProvider(
              create: (context) => getIt<CartCubit>(),
              child: CartScreen(),
            ),
          ),
        );

      case RoutesString.profile:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ProfileCubit>()..getProfileData(),
              ),
              BlocProvider(
                create: (context) => getIt<ProfileUpdateCubit>(),
              ),
            ],
            child: ProfileScreen(),
          ),
        );

      case RoutesString.root:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CategoriesCubit>()..getCategories(),
            child: const RootScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}