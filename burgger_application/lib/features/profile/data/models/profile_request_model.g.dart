// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileRequestModel _$ProfileRequestModelFromJson(Map<String, dynamic> json) =>
    ProfileRequestModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      image: json['image'] as String?,
      visa: json['visa'],
      phone: (json['phone'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProfileRequestModelToJson(
  ProfileRequestModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'address': instance.address,
  'image': instance.image,
  'visa': instance.visa,
  'phone': instance.phone,
};
