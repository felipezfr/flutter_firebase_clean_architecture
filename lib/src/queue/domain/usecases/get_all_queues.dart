import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/repositories/queue_repository.dart';

abstract class IGetAllQueues {
  Stream<List<QueueEntity>> call();
}

class getAllQueues implements IGetAllQueues {
  final IQueueRepository repository;

  getAllQueues(this.repository);

  @override
  Stream<List<QueueEntity>> call() {
    return repository.getAllQueues();
  }
}
