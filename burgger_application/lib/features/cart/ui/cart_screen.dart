import 'package:burgger_application/core/helpers/extensions.dart';
import 'package:burgger_application/core/routing/routes_string.dart';
import 'package:burgger_application/core/shared/app_bar.dart';
import 'package:burgger_application/core/shared/app_button.dart';
import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/core/theming/styles.dart';
import 'package:burgger_application/features/cart/logic/cubit/cart_cubit.dart';
import 'package:burgger_application/features/cart/logic/cubit/cart_state.dart';
import 'package:burgger_application/features/product_details/logic/cubit/product_deatlies/product_deatlies_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CartCubit>().getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarr( leading: Icon(Icons.arrow_back, color: AppColors.primaryColor,)),
        
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return state.maybeWhen(
              cartSuccess: (data) {
                final items = data.data?.items ?? [];

                if (items.isEmpty) {
                  return  Center(child: Text("Cart is empty" ,style: AppTextStyle.font16PrimaryColorBold,));
                }

                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 30.h,
                      horizontal: 20.h,
                    ),
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),

                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];

                            return Card(
                              color: AppColors.backgroundColor2,
                              child: Container(
                                width: 370,
                                height: 450,
                                decoration: BoxDecoration(
                                  color: AppColors.backgroundColor2,

                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,

                                  children: [
                                    Center(
                                      child: Image.network(
                                        item.image ?? '',
                                        width: 160,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.name ?? '',
                                            style: AppTextStyle
                                                .font22WhiteColorBold,
                                          ),

                                          Gap(30),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Toppings : ",
                                                style: AppTextStyle
                                                    .font14TextColorBold,
                                              ),

                                              Wrap(
                                                children: (item.toppings ?? [])
                                                    .map(
                                                      (t) => Padding(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 8.h,
                                                            ),
                                                        child: Column(
                                                          children: [
                                                            CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.white,
                                                              child:
                                                                  Image.network(
                                                                    t.image ??
                                                                        '',
                                                                    width: 35,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                              ),
                                            ],
                                          ),
                                          Gap(20),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Side Optiops:",
                                                style: AppTextStyle
                                                    .font14TextColorBold,
                                              ),

                                              Wrap(
                                                children: (item.sideOptions ?? [])
                                                    .map(
                                                      (t) => Padding(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 5.h,
                                                            ),
                                                        child: Column(
                                                          children: [
                                                            CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.white,
                                                              child:
                                                                  Image.network(
                                                                    t.image ??
                                                                        '',
                                                                    width: 35,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                              ),
                                            ],
                                          ),

                                          Gap(30),
                                          Row(
                                            children: [
                                              Text(
                                                "\$${item.price ?? 0}",
                                                style: AppTextStyle
                                                    .font24PrimaryColorBold,
                                              ),
                                              Spacer(),
                                              AppButton(
                                                icon: Icon(
                                                  Icons.remove_circle_outline,
                                                  color:
                                                      AppColors.darkGreenColor,
                                                ),
                                                buttonHeight: 50,
                                                buttonWidth: 120,
                                                buttonText: "Remove",
                                                textStyle: AppTextStyle
                                                    .font14BalackColorBold,
                                                onPressed: () {
                                                  context
                                                      .read<CartCubit>()
                                                      .deleteFromCart(
                                                        item.itemId ?? 0,
                                                      );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        Gap(30),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Total Price",
                                  style: AppTextStyle.font24PrimaryColorBold,
                                ),
                                Gap(10),
                                Text(
                                  "\$${data.data?.totalPrice ?? 0}",
                                  style: AppTextStyle.font22WhiteColorBold,
                                ),
                              ],
                            ),
                            Spacer(),

                            AppButton(
                              buttonText: "Checkout",

                              icon: Icon(
                                Icons.shopping_cart_checkout_outlined,
                                color: Colors.black,
                                size: 23,
                              ),
                              buttonWidth: 200,
                              buttonHeight: 50,
                              textStyle: AppTextStyle.font17BalackColorBold,
                              onPressed: () {
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              cartLoading: () => const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ),
              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
