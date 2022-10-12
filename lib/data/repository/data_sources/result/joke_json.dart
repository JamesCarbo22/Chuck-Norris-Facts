import 'package:json_annotation/json_annotation.dart';

part 'joke_json.g.dart';

@JsonSerializable(explicitToJson: true)
class JokeJson {
  @JsonKey(name: 'icon_url')
  final String iconUrl;

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'url')
  final String url;

  @JsonKey(name: 'value')
  final String value;

  JokeJson(this.iconUrl, this.id, this.url, this.value);

  factory JokeJson.fromJson(Map<String, dynamic> json) =>
      _$JokeJsonFromJson(json);

  Map<String, dynamic> toJson() => _$JokeJsonToJson(this);
}
