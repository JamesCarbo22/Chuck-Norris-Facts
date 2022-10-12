import 'package:chuck_norris_facts/data/repository/data_sources/get_chuck_norris_facts_data_source.dart';
import 'package:chuck_norris_facts/data/repository/mapper/joke_mapper.dart';
import 'package:chuck_norris_facts/domain/entity/jokes.dart';
import 'package:chuck_norris_facts/domain/interface/get_chuck_norris_facts_repository.dart';

class GetChuckNorrisFactsRepositoryImplementation
    extends GetChuckNorrisFactsRepository {
  GetChuckNorrisFactsDataSource getChuckNorrisFactsDataSource;

  GetChuckNorrisFactsRepositoryImplementation(
      this.getChuckNorrisFactsDataSource);

  @override
  Future<Joke> getJoke() async {
    final joke = await getChuckNorrisFactsDataSource.getJoke();

    return JokeMapper().toEntity(joke);
  }
}
