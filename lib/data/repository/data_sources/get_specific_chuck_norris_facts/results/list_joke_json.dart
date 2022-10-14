import 'package:chuck_norris_facts/data/repository/data_sources/get_chuck_norris_facts/result/joke_json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_joke_json.g.dart';

@JsonSerializable(explicitToJson: true)
class ListJokeJson {
  final int total;
  final List<JokeJson> result;

  ListJokeJson(this.total, this.result);

  factory ListJokeJson.fromJson(Map<String, dynamic> json) =>
      _$ListJokeJsonFromJson(json);

  Map<String, dynamic> toJson() => _$ListJokeJsonToJson(this);
}
