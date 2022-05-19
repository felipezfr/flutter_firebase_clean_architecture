import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/repositories/queue_repository.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/usecases/get_all_queues.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/external/queue_firestore_datasource.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/infra/datasource/queue_datasource.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/infra/repositores/queue_repository.dart';
import 'package:provider/provider.dart';

final queueModule = [
  Provider.value(value: FirebaseFirestore.instance),
  Provider<IQueueDatasource>(
      create: (context) => QueueFirestoreDatasource(context.read())),
  Provider<IQueueRepository>(
      create: (context) => QueueRepostory(context.read())),
  Provider<IGetAllQueues>(create: (context) => GetAllQueues(context.read())),
];
