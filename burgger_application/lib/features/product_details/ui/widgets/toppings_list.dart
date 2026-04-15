import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:burgger_application/features/product_details/data/models/product_option/product_option_model.dart';
import 'package:burgger_application/features/product_details/logic/cubit/toppings/toppings_cubit.dart';
import 'package:burgger_application/features/product_details/logic/cubit/toppings/toppings_state.dart';
import 'package:burgger_application/features/product_details/ui/widgets/toppings_and_side_options_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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
          success: (toppingsList) {
            return SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: toppingsList!.length,
                itemBuilder: (context, index) {
                  return ToppingsAndSideOptionsUi(
                    id: toppingsList[index]!.id?.toInt() ?? 0,
                    name: toppingsList[index]!.name ?? '',
                    image: toppingsList[index]!.image ?? '',
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
