// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      title: json['title'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      body: json['body'] as String,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'title': instance.title,
      'user': instance.user,
      'body': instance.body,
    };
