import '../../../cart/domain/entities/cart_request_entity.dart';
import '../../../cart/presentation/cubit/cart_cubit.dart';
import '../../../cart/presentation/cubit/cart_state.dart';
import '../../../home/domain/entities/product_entity.dart';
import '../cubit/product_deatlies/product_deatlies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes_string.dart';
import '../../../../core/shared/app_button.dart';
import '../../../../core/theming/styles.dart';

class AddToCartBlocListener extends StatelessWidget {
  final ProductEntity product;

  const AddToCartBlocListener({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartState = context.watch<CartCubit>().state;
    final isLoading = cartState.maybeWhen(
      cartLoading: () => true,
      orElse: () => false,
    );

    return BlocListener<CartCubit, CartState>(
      listenWhen: (previous, current) =>
          current is CartSuccess || current is CartError,
      listener: (context, state) {
        state.maybeWhen(
          cartSuccess: (data) {
            Navigator.pushReplacementNamed(context, RoutesString.cart);
          },
          cartError: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  error,
                  style: AppTextStyle.font16ErrorColorBold,
                ),
                backgroundColor: Colors.red,
              ),
            );
          },
          orElse: () {},
        );
      },
      child: AppButton(
        buttonText: 'Add to Cart',
        isLoading: isLoading,
        textStyle: AppTextStyle.font18TextColorExtraBold,
        onPressed: () {
          final productCubit = context.read<ProductDetailsCubit>();
          final cartCubit = context.read<CartCubit>();

          final entity = CartRequestEntity(
            items: [
              CartRequestItemEntity(
                productId: product.id,
                quantity: 1,
                spicy: 0.1,
                toppings: productCubit.selectedToppings,
                sideOptions: productCubit.selectedSides,
              ),
            ],
          );

          cartCubit.addToCart(entity);
        },
      ),
    );
  }
}