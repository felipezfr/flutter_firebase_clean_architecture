import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_clean_architecture/src/configuration/blocs/conf_bloc.dart';

final configurationModule = [
  BlocProvider(create: (context) => ConfBloc(context.read()))
];
