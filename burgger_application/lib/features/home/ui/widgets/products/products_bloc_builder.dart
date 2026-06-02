import '../../../../../core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../logic/cubit/products/products_cubit.dart';
import '../../../logic/cubit/products/products_state.dart';
import 'products_list.dart';

class ProductsBlocBuilder extends StatelessWidget {
  const ProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) =>
          current is ProductsStateLoading ||
          current is ProductsStateSuccess ||
          current is ProductsStateError,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          },
          success: (productsdata) {
            var data = productsdata;
            return ProductsList(products: data ?? []);
          },
          error: (errorHandler) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: AppColors.errorColor, size: 50),

                  const SizedBox(height: 10),

                  Text(
                    errorHandler.apiErrorModel.message ??
                        'Something went wrong',
                   style: AppTextStyle.font16ErrorColorBold,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
