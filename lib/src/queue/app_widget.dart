import 'package:flutter/material.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/queue_modules.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...queueModule,
      ],
      child: MaterialApp(),
    );
  }
}
