import '../../../../../core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/categories/categories_cubit.dart';
import '../../../logic/cubit/categories/categories_state.dart';
import 'categories_list.dart';

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
