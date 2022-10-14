import 'package:chuck_norris_facts/domain/entity/jokes.dart';
import 'package:chuck_norris_facts/domain/interface/get_chuck_norris_facts_repository.dart';

class GetChuckNorrisFactsUseCase {
  final GetChuckNorrisFactsRepository _getChuckNorrisFactsRepository;

  GetChuckNorrisFactsUseCase(this._getChuckNorrisFactsRepository);

  // Take a query
  Future<Joke> getJoke() async =>
      await _getChuckNorrisFactsRepository.getJoke();
}
