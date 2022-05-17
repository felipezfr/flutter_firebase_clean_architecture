import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/repositories/queue_repository.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/infra/datasource/queue_datasource.dart';
import 'package:mocktail/mocktail.dart';

class GetAllQueuesMock extends Mock implements IQueueRepository {}

class QueueEntityMock extends Mock implements QueueEntity {}

class IQueueDatasourceMock extends Mock implements IQueueDatasource {}
