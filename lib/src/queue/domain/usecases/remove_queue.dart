import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/repositories/queue_repository.dart';

abstract class IRemoveQueue {
  Future<void> call(QueueEntity queue);
}

class RemoveQueue implements IRemoveQueue {
  final IQueueRepository repository;

  RemoveQueue(this.repository);
  @override
  Future<void> call(QueueEntity queue) async {
    return await repository.removeQueue(queue.id);
  }
}
