import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/features/home/logic/cubit/categories/categories_cubit.dart';
import 'package:burgger_application/features/home/logic/cubit/categories/categories_state.dart';
import 'package:burgger_application/features/home/ui/widgets/categories/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      buildWhen: (previous, current) =>
          current is CategoriesStateLoading ||
          current is CategoriesStateSuccess ||
          current is CategoriesStateError,
      builder: (context, state) {
        return state.maybeWhen(
          
          success: (categoriesData) {
            var data = categoriesData;
            return CategoriesList(categories: data ?? []);
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
