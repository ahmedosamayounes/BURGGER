class CartEntity {
  final int id;
  final double totalPrice;
  final List<CartItemEntity> items;

  CartEntity({
    required this.id,
    required this.totalPrice,
    required this.items,
  });
}

class CartItemEntity {
  final int itemId;
  final int productId;
  final String name;
  final String image;
  final int quantity;
  final double price;
  final String spicy;
  final List<CartOptionEntity> toppings;
  final List<CartOptionEntity> sideOptions;

  CartItemEntity({
    required this.itemId,
    required this.productId,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    required this.spicy,
    required this.toppings,
    required this.sideOptions,
  });
}

class CartOptionEntity {
  final int id;
  final String name;
  final String image;

  CartOptionEntity({
    required this.id,
    required this.name,
    required this.image,
  });
}