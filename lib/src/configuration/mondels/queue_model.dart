import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/value_objects/order.dart';

class QueueModel extends QueueEntity {
  QueueModel({
    required String id,
    required String title,
    required String abbr,
    required int priority,
    required List<Order> orders,
  }) : super(
          id: id,
          title: title,
          abbr: abbr,
          priority: priority,
          orders: orders,
        );

  factory QueueModel.emty() =>
      QueueModel(id: "", title: "", abbr: "", priority: 1, orders: []);

  QueueModel copyWith({
    String? id,
    String? title,
    String? abbr,
    int? priority,
    List<Order>? orders,
  }) {
    return QueueModel(
      id: id ?? this.id,
      title: title ?? this.title,
      abbr: abbr ?? this.abbr,
      priority: priority ?? this.priority,
      orders: orders ?? this.orders,
    );
  }
}
