import 'package:json_annotation/json_annotation.dart';

part 'cart_request_model.g.dart'; 

@JsonSerializable()
class CartRequestModel {
  final List<CartItem>? items;

  CartRequestModel({this.items});

  factory CartRequestModel.fromJson(Map<String, dynamic> json) => 
      _$CartRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartRequestModelToJson(this);
}

@JsonSerializable()
class CartItem {
  @JsonKey(name: 'product_id')
  final int? productId;
  
  final int? quantity;
  
  // استخدمنا double لأنك باعت في المثال 0.1
  final double? spicy;
  
  final List<int>? toppings;
  
  @JsonKey(name: 'side_options')
  final List<int>? sideOptions;

  CartItem({
    this.productId,
    this.quantity,
    this.spicy,
    this.toppings,
    this.sideOptions,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => 
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}