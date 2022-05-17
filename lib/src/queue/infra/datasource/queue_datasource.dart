import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';

abstract class IQueueDatasource {
  Stream<List<Map>> getAllQueues();
}
