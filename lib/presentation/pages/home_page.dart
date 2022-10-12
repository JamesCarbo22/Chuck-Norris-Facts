import 'package:flutter/material.dart';

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
            width: double.infinity,
          ),
          const SizedBox(
            height: 70,
            width: 375,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Search Term',
                icon: Icon(Icons.search),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: SizedBox(
              height: 500,
              width: 375,
              child: TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
              )),
            ),
          ),
        ],
      )),
    );
  }
}
