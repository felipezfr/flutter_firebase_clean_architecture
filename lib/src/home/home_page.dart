import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: ListView(
              shrinkWrap: true,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("Entrada")),
                ElevatedButton(onPressed: () {}, child: const Text("Salão")),
                ElevatedButton(onPressed: () {}, child: const Text("Guichê")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/config');
                    },
                    child: const Text("Configurações")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
