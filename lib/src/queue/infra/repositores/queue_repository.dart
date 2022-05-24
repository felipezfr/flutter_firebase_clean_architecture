import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/repositories/queue_repository.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/infra/adapters/json_to_queue.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/infra/datasource/queue_datasource.dart';

class QueueRepostory implements IQueueRepository {
  final IQueueDatasource datasource;
  QueueRepostory(
    this.datasource,
  );

  @override
  Stream<List<QueueEntity>> getAllQueues() {
    final stream = datasource.getAllQueues();

    return stream.map(_convert);
  }

  @override
  Future<void> addQueue(QueueEntity queue) async {
    final map = JsonToQueue.toMap(queue);
    await datasource.addQueue(map);
  }

  @override
  Future<void> removeQueue(String id) async {
    await datasource.removeQueue(id);
  }

  List<QueueEntity> _convert(List<Map> list) {
    return list.map(JsonToQueue.fromMap).toList();
  }

  @override
  Future<void> removeAllOrders() async {
    await datasource.removeAllOrders();
  }
}
