class CartRequestEntity {
  final List<CartRequestItemEntity> items;

  CartRequestEntity({required this.items});
}

class CartRequestItemEntity {
  final int productId;
  final int quantity;
  final double spicy;
  final List<int> toppings;
  final List<int> sideOptions;

  CartRequestItemEntity({
    required this.productId,
    required this.quantity,
    required this.spicy,
    required this.toppings,
    required this.sideOptions,
  });
}