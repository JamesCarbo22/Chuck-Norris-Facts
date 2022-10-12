import 'package:chuck_norris_facts/app/locator.dart';
import 'package:chuck_norris_facts/presentation/chuck_norris_facts/chuck_norris_provider.dart';
import 'package:chuck_norris_facts/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator('https://api.chucknorris.io/');
  runApp(const ChuckNorrisApp());
}

class ChuckNorrisApp extends StatelessWidget {
  const ChuckNorrisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: ChangeNotifierProvider<ChuckNorrisProvider>(
        create: (context) =>
            GetIt.I<ChuckNorrisProvider>()..getChuckNorrisFacts(),
        child: const HomePage(),
      ),
    );
  }
}
