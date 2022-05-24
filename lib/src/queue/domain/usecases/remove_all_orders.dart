import 'package:flutter_firebase_clean_architecture/src/queue/domain/repositories/queue_repository.dart';

abstract class IRemoveAllOrders {
  Future<void> call();
}

class RemoveAllOrders implements IRemoveAllOrders {
  final IQueueRepository repository;

  RemoveAllOrders(this.repository);
  @override
  Future<void> call() async {
    return await repository.removeAllOrders();
  }
}
