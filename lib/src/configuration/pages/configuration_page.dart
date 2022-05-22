import 'package:flutter/material.dart';
import 'package:flutter_firebase_clean_architecture/src/configuration/blocs/configuration_bloc.dart';
import 'package:flutter_firebase_clean_architecture/src/configuration/events/conf_event.dart';
import 'package:flutter_firebase_clean_architecture/src/configuration/mondels/queue_model.dart';
import 'package:flutter_firebase_clean_architecture/src/configuration/states/conf_state.dart';
import 'package:provider/provider.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage>
    with CompleteStateMixin {
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<ConfigurationBloc>().add(FetchQueues());
  //   WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
  //     context.read<ConfigurationBloc>().add(FetchQueues());
  //   });
  // }

  @override
  void completeState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read<ConfigurationBloc>().add(FetchQueues());
    });
  }

  void _addNewQueueDialog() {
    showDialog(
      context: context,
      builder: (context) {
        var queue = QueueModel.emty();

        return AlertDialog(
          title: const Text("Nova fila"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Titulo',
                ),
                onChanged: (value) {
                  queue = queue.copyWith(title: value);
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Abreviaçao',
                ),
                onChanged: (value) {
                  queue = queue.copyWith(abbr: value);
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Prioridade',
                ),
                onChanged: (value) {
                  queue = queue.copyWith(priority: int.tryParse(value));
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
                onPressed: () {
                  context
                      .read<ConfigurationBloc>()
                      .add(AddNewQueueEvent(queue));
                  Navigator.pop(context);
                },
                child: const Text("Adicionar"))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ConfigurationBloc>();
    final state = bloc.state;

    Widget list = Container();

    return Scaffold(
      appBar: AppBar(title: const Text("Configuracoes")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "FILAS",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.green,
                          size: 34,
                        ),
                        onPressed: _addNewQueueDialog,
                      ),
                    ],
                  ),
                ),
                if (state is LoadedConfigurationState)
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
                          trailing: IconButton(
                            onPressed: () {
                              bloc.add(RemoveQueueEvent(queue));
                            },
                            icon: const Icon(
                              Icons.delete_outline_outlined,
                              color: Colors.red,
                            ),
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
      ),
    );
  }
}

mixin CompleteStateMixin<T extends StatefulWidget> on State<T> {
  void completeState();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      completeState();
    });
  }
}
