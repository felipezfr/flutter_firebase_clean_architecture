import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/infra/adapters/json_to_order.dart';

class JsonToQueue {
  static QueueEntity fromMap(dynamic json) {
    return QueueEntity(
      id: json['id'],
      title: json['title'],
      abbr: json['abbr'],
      priority: json['priority'],
      orders: [
        if (json.containsKey('orders'))
          ...(json['orders'] as List).map(JsonToOrder.fromMap).toList()
      ],
    );
  }
}
