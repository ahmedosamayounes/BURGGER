import 'package:burgger_application/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../logic/cubit/side_options/side_options_cubit.dart';
import '../../logic/cubit/side_options/side_options_state.dart';
import 'toppings_and_side_options_ui.dart';

class SideOptionsList extends StatelessWidget {
  const SideOptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SideOptionsCubit, SideOptionsState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          ),
          orElse: () {
            return const SizedBox.shrink();
          },
          success: (sideOptionsList) {
            return SizedBox(
              height: 140.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: sideOptionsList!.length,
                itemBuilder: (context, index) {
                  return ToppingsAndSideOptionsUi(
                    id: sideOptionsList[index]!.id?.toInt() ?? 0,

                    name: sideOptionsList[index]!.name ?? '',
                    image: sideOptionsList[index]!.image ?? '',
                    isTopping: false,
                  );
                },
              ),
            );
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
        );
      },
    );
  }
}
