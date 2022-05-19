import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';

abstract class ConfEvent {}

class AddQueues implements ConfEvent {
  final List<QueueEntity> queues;

  AddQueues(this.queues);
}
