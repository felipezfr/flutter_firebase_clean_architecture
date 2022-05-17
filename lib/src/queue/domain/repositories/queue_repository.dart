import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';

abstract class IQueueRepository {
  Stream<List<QueueEntity>> getAllQueues();
}
