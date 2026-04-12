import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ToppingsAndSideOptionsUi extends StatelessWidget {
  final String name;
  final String image;

  const ToppingsAndSideOptionsUi({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            width: 110,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.backgroundColor2,
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(name, style: AppTextStyle.font14TextColorWhite),
                  Gap(5),
                  CircleAvatar(
                    backgroundColor: AppColors.whitelightColor,
                    radius: 12,
                    child: Icon(Icons.add, color: Colors.black),
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
