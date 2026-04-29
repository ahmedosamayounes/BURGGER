// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductOptionModel _$ProductOptionModelFromJson(Map<String, dynamic> json) =>
    ProductOptionModel(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OptionData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductOptionModelToJson(ProductOptionModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

OptionData _$OptionDataFromJson(Map<String, dynamic> json) => OptionData(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$OptionDataToJson(OptionData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
