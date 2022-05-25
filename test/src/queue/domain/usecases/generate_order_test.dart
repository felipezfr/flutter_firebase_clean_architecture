import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/usecases/generate_order.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deve gerar uma nova orders', () {
    final usecase = GenerateOrderUsecase();
    final queueEntity = QueueEntity(
      id: 'asdad',
      title: 'teste',
      abbr: 'ts',
      priority: 1,
      orders: [],
    );

    final result = usecase.call(queueEntity);

    expect(result.orders.length, 1);
    expect(result.orders.first.id, '0001');
    expect(result.orders.first.position, 1);
  });
}
