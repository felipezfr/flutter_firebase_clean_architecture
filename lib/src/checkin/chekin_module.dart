import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_clean_architecture/src/checkin/blocs/checkin_bloc.dart';
import 'package:flutter_firebase_clean_architecture/src/configuration/blocs/configuration_bloc.dart';

final checkinModule = [
  BlocProvider(
    create: (context) => CheckinBloc(
      context.read(),
    ),
  )
];
