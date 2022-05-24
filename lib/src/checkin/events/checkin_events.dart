import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';

abstract class CheckinEvent {}

class FetAllQueues implements CheckinEvent {}

class GenerateOrder implements CheckinEvent {
  final QueueEntity queue;

  GenerateOrder(this.queue);
}

class PrintOrder implements CheckinEvent {}
