import 'package:flutter/material.dart';
import 'package:flutter_firebase_clean_architecture/src/checkin/chekin_module.dart';
import 'package:flutter_firebase_clean_architecture/src/configuration/configuration_module.dart';
import 'package:flutter_firebase_clean_architecture/src/configuration/pages/configuration_page.dart';
import 'package:flutter_firebase_clean_architecture/src/home/home_page.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/queue_modules.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...queueModule,
        ...configurationModule,
        ...checkinModule,
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        routes: <String, WidgetBuilder>{
          '/': (_) => const HomePage(),
          '/config': (_) => const ConfigurationPage(),
        },
        // home: const ConfigurationPage(),
      ),
    );
  }
}
