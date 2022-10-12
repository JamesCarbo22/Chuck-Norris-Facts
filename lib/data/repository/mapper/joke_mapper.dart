import 'package:chuck_norris_facts/data/repository/data_sources/result/joke_json.dart';
import 'package:chuck_norris_facts/domain/entity/jokes.dart';

class JokeMapper {
  Joke toEntity(JokeJson joke) =>
      Joke(joke.iconUrl, joke.id, joke.url, joke.value);
}
