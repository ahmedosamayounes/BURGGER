import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:burgger_application/features/cart/logic/cubit/cart_cubit.dart';
import 'package:burgger_application/features/cart/logic/cubit/cart_state.dart';
import 'package:burgger_application/features/home/logic/cubit/products/products_state.dart';
import 'package:burgger_application/features/product_details/logic/cubit/product_deatlies/product_deatlies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ToppingsAndSideOptionsUi extends StatelessWidget {
  final String name;
  final String image;
  final int id;

  ToppingsAndSideOptionsUi({
    super.key,
    required this.name,
    required this.image,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ProductDeatliesCubit>();

    final isSelected = context
        .read<ProductDeatliesCubit>()
        .selectedToppings
        .contains(id);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            width: 110,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.darkGreenColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(name, style: AppTextStyle.font14TextColorWhite),
                  Gap(5),
                  GestureDetector(
                    onTap: () {
                        print("clicked");

                      context.read<ProductDeatliesCubit>().toggleTopping(id);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.whitelightColor,
                      radius: 12,
                      child: isSelected
                          ? Icon(Icons.check, color: Colors.black)
                          : Icon(Icons.add, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            alignment: Alignment.center,
            height: 84,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Image.network(image, width: 80),
          ),
        ),
      ],
    );
  }
}
