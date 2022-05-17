import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/value_objects/order.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/infra/adapters/json_to_queue.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'deve converter um map em um objeto do tipo QueueEntity',
    () {
      final queue = JsonToQueue.fromMap({
        'id': '123123',
        'title': 'Teste Queue',
        'abbr': 'Tst',
        'priority': 1,
        'orders': [
          {
            'id': '123123',
            'position': 1,
            'timestamp': '2022-05-16',
            'status': 'attending'
          }
        ]
      });

      expect(queue, isA<QueueEntity>());
      expect(queue.title, 'Teste Queue');
      expect(queue.priority, 1);
      expect(queue.orders.first.status, OrderStatus.attending);
    },
  );
}
