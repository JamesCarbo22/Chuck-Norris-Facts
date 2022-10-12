import 'package:chuck_norris_facts/domain/entity/jokes.dart';
import 'package:chuck_norris_facts/domain/interface/get_chuck_norris_facts_repository.dart';
import 'package:chuck_norris_facts/domain/use_case/get_chuck_norris_facts_use_case.dart';
import 'package:flutter/material.dart';

class ChuckNorrisProvider extends ChangeNotifier {
  final List<Joke> jokes = [];
  String? error;
  final GetChuckNorrisFactsUseCase _getChuckNorrisFacts;

  ChuckNorrisProvider(this._getChuckNorrisFacts);

  /// Get Chuck Norris fact
  /// Pass optional parameter if searching for a query
  Future<void> getChuckNorrisFacts({String? query}) async {
    try {
      // Make request to use case to get fact
      final joke = await _getChuckNorrisFacts.getJoke();
      jokes.add(joke);
      notifyListeners();
    } on Exception catch (_) {
      // Unable to retrieve joke
      error = 'Unable to retrieve Joke';
      notifyListeners();
    }
  }
}

/// Notifier to call Use Case - Done
/// Use Case to call Repository - Done
/// Repository to call data source (in repository section)
/// Data source to call Network
