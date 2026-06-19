// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponseModel _$SignupResponseModelFromJson(Map<String, dynamic> json) =>
    SignupResponseModel(
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignupResponseModelToJson(
  SignupResponseModel instance,
) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  token: json['token'] as String?,
  name: json['name'] as String?,
  email: json['email'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'token': instance.token,
  'name': instance.name,
  'email': instance.email,
  'image': instance.image,
};
