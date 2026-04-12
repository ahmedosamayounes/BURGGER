// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartRequestModel _$CartRequestModelFromJson(Map<String, dynamic> json) =>
    CartRequestModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartRequestModelToJson(CartRequestModel instance) =>
    <String, dynamic>{'items': instance.items};

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
  productId: (json['product_id'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  spicy: (json['spicy'] as num?)?.toDouble(),
  toppings: (json['toppings'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  sideOptions: (json['side_options'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
  'product_id': instance.productId,
  'quantity': instance.quantity,
  'spicy': instance.spicy,
  'toppings': instance.toppings,
  'side_options': instance.sideOptions,
};
