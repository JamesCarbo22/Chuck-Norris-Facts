import 'package:chuck_norris_facts/domain/entity/jokes.dart';
import 'package:chuck_norris_facts/domain/interface/get_chuck_norris_facts_repository.dart';

class GetSpecificChuckNorrisFactsUseCase {
  final GetChuckNorrisFactsRepository _getSpecificChuckNorrisFactsRepository;

  GetSpecificChuckNorrisFactsUseCase(
      this._getSpecificChuckNorrisFactsRepository);

  Future<List<Joke>> getSpecificJoke(String query) async =>
      await _getSpecificChuckNorrisFactsRepository.getJokeQuery(query);
}
