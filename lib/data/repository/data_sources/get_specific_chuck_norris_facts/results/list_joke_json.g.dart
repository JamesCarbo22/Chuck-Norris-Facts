// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_joke_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListJokeJson _$ListJokeJsonFromJson(Map<String, dynamic> json) => ListJokeJson(
      json['total'] as int,
      (json['result'] as List<dynamic>)
          .map((e) => JokeJson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListJokeJsonToJson(ListJokeJson instance) =>
    <String, dynamic>{
      'total': instance.total,
      'result': instance.result.map((e) => e.toJson()).toList(),
    };
