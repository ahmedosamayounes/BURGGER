// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cart_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCartResponseModel _$AddCartResponseModelFromJson(
  Map<String, dynamic> json,
) => AddCartResponseModel(
  code: (json['code'] as num?)?.toInt(),
  message: json['message'] as String?,
  data: json['data'],
);

Map<String, dynamic> _$AddCartResponseModelToJson(
  AddCartResponseModel instance,
) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};
