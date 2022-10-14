import 'package:chuck_norris_facts/data/network/api_network.dart';
import 'package:chuck_norris_facts/data/repository/data_sources/get_chuck_norris_facts/result/joke_json.dart';

class GetChuckNorrisFactsDataSource {
  final ApiService _apiService;

  GetChuckNorrisFactsDataSource(this._apiService);
  Future<JokeJson> getJoke() async {
    final Map<String, dynamic> jokeJson = (await _apiService.get(
      path: 'jokes/random',
      expected: [Status.ok],
    ));

    return JokeJson.fromJson(jokeJson);
  }
}

// {
// "icon_url" : "https://assets.chucknorris.host/img/avatar/chuck-norris.png",
// "id" : "qWaLbn79RaKSITJjpfb54g",
// "url" : "",
// "value" : "The truth can't handle Chuck Norris."
// }
