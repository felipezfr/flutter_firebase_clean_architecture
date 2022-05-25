import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/repositories/queue_repository.dart';

abstract class IUpdateQueue {
  Future<void> call(QueueEntity queue);
}

class UpdateQueue implements IUpdateQueue {
  final IQueueRepository repository;

  UpdateQueue(this.repository);
  @override
  Future<void> call(QueueEntity queue) async {
    return await repository.updateQueue(queue);
  }
}
