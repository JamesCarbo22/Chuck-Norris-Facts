import 'package:chuck_norris_facts/data/network/api_network.dart';
import 'package:chuck_norris_facts/data/repository/data_sources/get_chuck_norris_facts/result/joke_json.dart';
import 'package:chuck_norris_facts/data/repository/data_sources/get_specific_chuck_norris_facts/results/list_joke_json.dart';

class GetSpecificChuckNorrisFactsDataSource {
  final ApiService _apiService;

  GetSpecificChuckNorrisFactsDataSource(this._apiService);

  Future<List<JokeJson>> getQueryJoke({String? query}) async {
    Map<String, dynamic> jokeJson = (await _apiService.get(
      path: 'jokes/search?query=$query',
      expected: [Status.ok],
    ));

    final jokes = ListJokeJson.fromJson(jokeJson);
    return jokes.result;
  }
}
