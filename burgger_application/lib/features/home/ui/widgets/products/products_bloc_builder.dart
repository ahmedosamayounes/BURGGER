import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/features/home/logic/cubit/products/products_cubit.dart';
import 'package:burgger_application/features/home/logic/cubit/products/products_state.dart';
import 'package:burgger_application/features/home/ui/widgets/products/products_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            return const SizedBox.shrink();
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
