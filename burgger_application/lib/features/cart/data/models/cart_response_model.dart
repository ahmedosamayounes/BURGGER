import 'package:json_annotation/json_annotation.dart';

part 'cart_response_model.g.dart';

@JsonSerializable()
class CartResponseModel {
  final int? code;
  final String? message;
  final CartData? data;

  CartResponseModel({this.code, this.message, this.data});

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseModelToJson(this);
}

@JsonSerializable()
class CartData {
  final int? id;
  @JsonKey(name: 'total_price')
  final String? totalPrice;
  final List<CartItem>? items;

  CartData({this.id, this.totalPrice, this.items});

  factory CartData.fromJson(Map<String, dynamic> json) =>
      _$CartDataFromJson(json);

  Map<String, dynamic> toJson() => _$CartDataToJson(this);
}

@JsonSerializable()
class CartItem {
  @JsonKey(name: 'item_id')
  final int? itemId;
  @JsonKey(name: 'product_id')
  final int? productId;
  final String? name;
  final String? image;
  final int? quantity;
  final String? price;
  final String? spicy;
  final List<CartOption>? toppings;
  @JsonKey(name: 'side_options')
  final List<CartOption>? sideOptions;

  CartItem({
    this.itemId,
    this.productId,
    this.name,
    this.image,
    this.quantity,
    this.price,
    this.spicy,
    this.toppings,
    this.sideOptions,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}

@JsonSerializable()
class CartOption {
  final int? id;
  final String? name;
  final String? image;

  CartOption({this.id, this.name, this.image});

  factory CartOption.fromJson(Map<String, dynamic> json) =>
      _$CartOptionFromJson(json);

  Map<String, dynamic> toJson() => _$CartOptionToJson(this);
}
