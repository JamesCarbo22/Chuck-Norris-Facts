import 'package:chuck_norris_facts/domain/entity/jokes.dart';
import 'package:chuck_norris_facts/domain/use_case/get_chuck_norris_facts_use_case.dart';
import 'package:chuck_norris_facts/domain/use_case/get_specific_chuck_norris_facts_use_case.dart';
import 'package:flutter/material.dart';

class ChuckNorrisProvider extends ChangeNotifier {
  final List<Joke> jokes = [];
  String? error;
  String searchQuery = '';
  // Parameter for search

  final GetChuckNorrisFactsUseCase _getChuckNorrisFacts;

  final GetSpecificChuckNorrisFactsUseCase _getSpecificChuckNorrisFacts;

  ChuckNorrisProvider(
      this._getSpecificChuckNorrisFacts, this._getChuckNorrisFacts);

  /// Function to update search

  void updateSearchQuery(String value) {
    searchQuery = value;
    notifyListeners();
  }

  /// Get Chuck Norris fact
  /// Pass optional parameter if searching for a query
  Future<void> getChuckNorrisFacts() async {
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

  // ignore: body_might_complete_normally_nullable
  Future<List?> getSpecificChuckNorrisFacts() async {
    try {
      final joke =
          await _getSpecificChuckNorrisFacts.getSpecificJoke(searchQuery);
      jokes.addAll(joke);
      notifyListeners();
    } on Exception catch (_) {
      // Unable to retrieve joke
      error = 'Unable to retrieve Joke';
      notifyListeners();
    }
  }
}

/// Create a new use case and data source and add a new function to the repo
/// Use this new parameter searchQuery in the UI every time you enter something call a
/// function in the provider to update the searchQuery
/// When you press the search button call getSpecificChuckNorrisFacts to get the specific joke
