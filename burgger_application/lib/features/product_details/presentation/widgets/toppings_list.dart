import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../cubit/toppings/toppings_cubit.dart';
import '../cubit/toppings/toppings_state.dart';
import 'toppings_and_side_options_ui.dart';

class ToppingsList extends StatelessWidget {
  const ToppingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToppingsCubit, ToppingsState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const SizedBox.shrink();
          },
          error: (errorHandler) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 50),

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
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          ),
          success: (toppingsList) {
            return SizedBox(
              height: 140.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: toppingsList.length,
                itemBuilder: (context, index) {
                  return ToppingsAndSideOptionsUi(
                    id: toppingsList[index].id.toInt(),
                    name: toppingsList[index].name,
                    image: toppingsList[index].image,
                    isTopping: true,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
