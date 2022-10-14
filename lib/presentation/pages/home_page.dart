import 'package:chuck_norris_facts/data/repository/data_sources/get_specific_chuck_norris_facts/results/list_joke_json.dart';
import 'package:chuck_norris_facts/domain/entity/jokes.dart';
import 'package:chuck_norris_facts/presentation/chuck_norris_facts/chuck_norris_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chuck Norris Jokes'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA580IMFRLwiyHePkE4x7AM0hTahrBIfD3lA&usqp=CAU',
              width: 300,
              height: 300,
            ),

            // ListView.builder

            // itemCount = 5

            /// Every time the text field updates
            /// Call the function in the provider to update the value
            SizedBox(
              height: 70,
              width: 375,
              child: TextField(
                onChanged: (value) {
                  context.read<ChuckNorrisProvider>().updateSearchQuery(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Search Term',
                  // icon: Icon(Icons.search),
                ),
              ),
            ),

            // On press call the provider to start the search
            TextButton(
                onPressed: () {
                  final jokes = context
                      .read<ChuckNorrisProvider>()
                      .getSpecificChuckNorrisFacts();

                  ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const ListTile(
                          title: Text('{jokes}'),
                        );
                      });
                },
                child: const Text('Search')),

            TextButton(
              onPressed: () {
                context.read<ChuckNorrisProvider>().getChuckNorrisFacts();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  minimumSize: MaterialStateProperty.all(const Size(300, 70))),
              child: const Text(
                'Get Joke',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(context.watch<ChuckNorrisProvider>().jokes.isNotEmpty
                ? context.watch<ChuckNorrisProvider>().jokes.last.value
                : ''),
          ],
        )));
  }
}
