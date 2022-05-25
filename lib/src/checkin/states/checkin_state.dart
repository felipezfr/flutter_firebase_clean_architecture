import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/value_objects/order.dart';

abstract class CheckinState {}

class LoadingCheckinState implements CheckinState {}

class InitialCheckinState implements CheckinState {}

class SuccesCheckinState implements CheckinState {
  final List<QueueEntity> queues;

  SuccesCheckinState(this.queues);
}

class GeneratedOrderCheckinState implements CheckinState {
  final Order order;

  GeneratedOrderCheckinState(this.order);
}

class ExceptionCheckinState implements CheckinState {}
