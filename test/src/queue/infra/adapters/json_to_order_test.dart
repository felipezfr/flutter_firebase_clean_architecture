import 'package:flutter_firebase_clean_architecture/src/queue/domain/value_objects/order.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/infra/adapters/json_to_order.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'deve converter um map em um objeto do tipo Order',
    () {
      final order = JsonToOrder.fromMap({
        'id': '123123',
        'position': 1,
        'timestamp': '2022-05-16',
        'status': 'attending'
      });

      expect(order, isA<Order>());
      expect(order.status, OrderStatus.attending);
    },
  );

  test('deve converter um objeto do tipo Order em um Map', () {
    final order = Order(
      id: '12345',
      position: 1,
      timestamp: DateTime.now(),
      status: OrderStatus.waiting,
    );

    final map = JsonToOrder.toMap(order);

    expect(map, isA<Map<String, dynamic>>());
    expect(map['id'], '12345');
    expect(map['status'], 'waiting');
  });
}
