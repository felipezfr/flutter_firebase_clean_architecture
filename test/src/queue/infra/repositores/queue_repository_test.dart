import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/infra/repositores/queue_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('queue repostiry', () {
    final datasource = IQueueDatasourceMock();

    when(() => datasource.getAllQueues()).thenAnswer(
      (_) => Stream.value([
        {
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
        }
      ]),
    );

    final repostory = QueueRepostory(datasource: datasource);
    final result = repostory.getAllQueues();

    expect(result, emits(isA<List<QueueEntity>>()));
  });
}
