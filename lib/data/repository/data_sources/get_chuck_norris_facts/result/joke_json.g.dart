// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JokeJson _$JokeJsonFromJson(Map<String, dynamic> json) => JokeJson(
      json['icon_url'] as String,
      json['id'] as String,
      json['url'] as String,
      json['value'] as String,
    );

Map<String, dynamic> _$JokeJsonToJson(JokeJson instance) => <String, dynamic>{
      'icon_url': instance.iconUrl,
      'id': instance.id,
      'url': instance.url,
      'value': instance.value,
    };
