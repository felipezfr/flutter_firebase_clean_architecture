import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';

abstract class ConfigurationEvent {}

class FetchQueuesEvent implements ConfigurationEvent {}

class AddNewQueueEvent implements ConfigurationEvent {
  final QueueEntity queue;

  AddNewQueueEvent(this.queue);
}

class RemoveQueueEvent implements ConfigurationEvent {
  final QueueEntity queue;

  RemoveQueueEvent(this.queue);
}

class RemoveAllOrdersEvent implements ConfigurationEvent {}
