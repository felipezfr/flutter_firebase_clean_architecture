import 'package:flutter/material.dart';
import 'package:flutter_firebase_clean_architecture/src/configuration/blocs/conf_bloc.dart';
import 'package:flutter_firebase_clean_architecture/src/configuration/states/conf_state.dart';
import 'package:provider/provider.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ConfBloc>();
    final state = bloc.state;

    Widget list = Container();

    return Scaffold(
      appBar: AppBar(title: const Text("Configuracoes")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 19, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "FILAS",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    Icon(
                      Icons.add_circle_outline,
                      color: Colors.green,
                      size: 34,
                    ),
                  ],
                ),
              ),
              if (state is LoadedConfState)
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.queues.length,
                  itemBuilder: (context, index) {
                    final queue = state.queues[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          '${queue.title} - ${queue.abbr}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        subtitle: Text('${queue.priority} de prioridade'),
                        trailing: const Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 19, vertical: 8),
                child: Text(
                  "CONTROLE",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 19, vertical: 0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Reiniciar filas"),
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
