import 'package:burgger_application/core/theming/app_colors.dart';
import 'package:burgger_application/features/cart/logic/cubit/cart_cubit.dart';
import 'package:burgger_application/features/cart/logic/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCart();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return state.maybeWhen(
              cartSuccess: (data) {
                final items = data.data?.items ?? [];

                if (items.isEmpty) {
                  return const Center(child: Text("Cart is empty"));
                }

                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(item.image ?? '' ),
                          Text(item.name ?? ''),
                          Text("Qty: ${item.quantity ?? 0}"),
                          Text("Price: ${item.price ?? 0}"),

                          Wrap(
                            children: (item.toppings ?? [])
                                .map(
                                  (t) => Column(
                                    children: [
                                      Text(t.name ?? ''),
                                      Image.network(t.image ?? '', width: 40),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),

                          Wrap(
                            children: (item.sideOptions ?? [])
                                .map((s) => Text(s.name ?? ''))
                                .toList(),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              cartLoading: () =>
                  const Center(child: CircularProgressIndicator()),
              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
