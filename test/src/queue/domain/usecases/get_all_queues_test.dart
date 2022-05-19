import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/usecases/get_all_queues.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('deve retornar uma lista de QueuesEntity', () {
    final repository = GetAllQueuesMock();
    final entity = QueueEntityMock();

    when(() => repository.getAllQueues())
        .thenAnswer((_) => Stream.value([entity]));

    final usecase = GetAllQueues(repository);

    final result = usecase.call();

    expect(result, emits(isA<List<QueueEntity>>()));
  });
}
