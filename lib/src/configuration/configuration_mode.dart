import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_clean_architecture/src/configuration/blocs/configuration_bloc.dart';

final configurationModule = [
  BlocProvider(
    create: (context) => ConfigurationBloc(
      context.read(),
      context.read(),
      context.read(),
    ),
  )
];
