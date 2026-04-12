import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:burgger_application/features/product_details/logic/cubit/side_options_cubit.dart';
import 'package:burgger_application/features/product_details/logic/cubit/side_options_state.dart';
import 'package:burgger_application/features/product_details/ui/widgets/toppings_and_side_options_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SideOptionsList extends StatelessWidget {
  const SideOptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SideOptionsCubit, SideOptionsState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const SizedBox.shrink();
          },
          success: (sideOptionsList) {
            return SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: sideOptionsList!.length,
                itemBuilder: (context, index) {
                  return ToppingsAndSideOptionsUi(
                    name: sideOptionsList[index]!.name ?? '',
                    image: sideOptionsList[index]!.image ?? '',
                  );
                },
              ),
            );
          },
          error: (errorHandler) => const SizedBox.shrink(),
        );
      },
    );
  }
}
