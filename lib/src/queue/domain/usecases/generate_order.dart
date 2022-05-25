import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/value_objects/order.dart';

abstract class IGenerateOrderUsecase {
  QueueEntity call(QueueEntity queueEntity);
}

class GenerateOrderUsecase implements IGenerateOrderUsecase {
  @override
  QueueEntity call(QueueEntity queueEntity) {
    final orders = List<Order>.from(queueEntity.orders);
    final totalOrders = orders.length;

    final order = Order(
      id: _generateId(totalOrders + 1),
      position: totalOrders + 1,
      timestamp: DateTime.now(),
      status: OrderStatus.waiting,
    );

    orders.add(order);

    final newQueueEntity = QueueEntity(
      id: queueEntity.id,
      title: queueEntity.title,
      abbr: queueEntity.abbr,
      priority: queueEntity.priority,
      orders: orders,
    );

    return newQueueEntity;
  }

  String _generateId(int id) {
    return '$id'.padLeft(4, '0');
  }
}
