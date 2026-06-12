import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes_string.dart';
import '../../../../core/shared/app_button.dart';
import '../../../../core/theming/styles.dart';
import '../../../cart/data/models/cart_request_model.dart';
import '../../../cart/logic/cubit/cart_cubit.dart';
import '../../../cart/logic/cubit/cart_state.dart';
import '../../../home/data/models/products/products_model.dart';
import '../../logic/cubit/product_deatlies/product_deatlies_cubit.dart';

class AddToCartBlocListener extends StatelessWidget {
  final ProductData product;

  const AddToCartBlocListener({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartState = context.watch<CartCubit>().state;
    final isLoading = cartState is CartLoading;
    return BlocListener<CartCubit, CartState>(
      listenWhen: (previous, current) =>
          current is CartSuccess || current is CartError,
      listener: (context, state) {
        state.maybeWhen(
          cartSuccess: (data) {
            Navigator.pushReplacementNamed(context, RoutesString.cart);
          },
          orElse: () {
            SizedBox.shrink();
          },
          cartError: (e) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 50),

                  const SizedBox(height: 10),

                  Text(
                    e,

                    style: AppTextStyle.font16ErrorColorBold,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        );
      },
      child: AppButton(
        buttonText: 'Add to Cart',
        isLoading: isLoading,
        textStyle: AppTextStyle.font18TextColorExtraBold,
        onPressed: () {
          final productCubit = context.read<ProductDetailsCubit>();
          final cartCubit = context.read<CartCubit>();

          if (product.id == null) return;

          final model = CartRequestModel(
            items: [
              CartItem(
                productId: product.id!,
                quantity: 1,
                spicy: 0.1,
                toppings: productCubit.selectedToppings,
                sideOptions: productCubit.selectedSides,
              ),
            ],
          );

          cartCubit.addToCart(model);
        },
      ),
    );
  }
}
