import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';

abstract class CheckinState {}

class LoadingCheckinState implements CheckinState {}

class InitialCheckinState implements CheckinState {}

class SuccesCheckinState implements CheckinState {
  final List<QueueEntity> queues;

  SuccesCheckinState(this.queues);
}

class ExceptionCheckinState implements CheckinState {}
