import 'package:chuck_norris_facts/domain/entity/jokes.dart';

abstract class GetChuckNorrisFactsRepository {
  Future<Joke> getJoke();
}
