import 'package:chuck_norris_facts/domain/entity/jokes.dart';

abstract class GetChuckNorrisFactsRepository {
  // Take a query
  Future<Joke> getJoke();

  Future<List<Joke>> getJokeQuery(String query);
}
