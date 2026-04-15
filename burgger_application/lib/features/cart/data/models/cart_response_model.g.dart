// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponseModel _$CartResponseModelFromJson(Map<String, dynamic> json) =>
    CartResponseModel(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CartData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartResponseModelToJson(CartResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

CartData _$CartDataFromJson(Map<String, dynamic> json) => CartData(
  id: (json['id'] as num?)?.toInt(),
  totalPrice: json['total_price'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CartDataToJson(CartData instance) => <String, dynamic>{
  'id': instance.id,
  'total_price': instance.totalPrice,
  'items': instance.items,
};

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
  itemId: (json['item_id'] as num?)?.toInt(),
  productId: (json['product_id'] as num?)?.toInt(),
  name: json['name'] as String?,
  image: json['image'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  price: json['price'] as String?,
  spicy: json['spicy'] as String?,
  toppings: (json['toppings'] as List<dynamic>?)
      ?.map((e) => CartOption.fromJson(e as Map<String, dynamic>))
      .toList(),
  sideOptions: (json['side_options'] as List<dynamic>?)
      ?.map((e) => CartOption.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
  'item_id': instance.itemId,
  'product_id': instance.productId,
  'name': instance.name,
  'image': instance.image,
  'quantity': instance.quantity,
  'price': instance.price,
  'spicy': instance.spicy,
  'toppings': instance.toppings,
  'side_options': instance.sideOptions,
};

CartOption _$CartOptionFromJson(Map<String, dynamic> json) => CartOption(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$CartOptionToJson(CartOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
