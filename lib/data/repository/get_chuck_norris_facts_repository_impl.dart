import 'package:chuck_norris_facts/data/repository/data_sources/get_chuck_norris_facts/get_chuck_norris_facts_data_source.dart';
import 'package:chuck_norris_facts/data/repository/data_sources/get_specific_chuck_norris_facts/get_specific_chuck_norris_facts_data_source.dart';
import 'package:chuck_norris_facts/data/repository/mapper/joke_mapper.dart';
import 'package:chuck_norris_facts/domain/entity/jokes.dart';
import 'package:chuck_norris_facts/domain/interface/get_chuck_norris_facts_repository.dart';

class GetChuckNorrisFactsRepositoryImplementation
    extends GetChuckNorrisFactsRepository {
  GetChuckNorrisFactsDataSource getChuckNorrisFactsDataSource;
  GetSpecificChuckNorrisFactsDataSource getSpecificChuckNorrisFactsDataSource;
  GetChuckNorrisFactsRepositoryImplementation(
      this.getChuckNorrisFactsDataSource,
      this.getSpecificChuckNorrisFactsDataSource);

  // Take a query
  @override
  Future<Joke> getJoke() async {
    final joke = await getChuckNorrisFactsDataSource.getJoke();

    return JokeMapper().toEntity(joke);
  }

  @override
  Future<List<Joke>> getJokeQuery(String query) async {
    final joke = await getSpecificChuckNorrisFactsDataSource.getQueryJoke();
    final jokes =
        joke.map((jokeJson) => JokeMapper().toEntity(jokeJson)).toList();
    return jokes;
  }
}
