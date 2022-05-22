import 'package:flutter_firebase_clean_architecture/src/queue/domain/usecases/add_new_queue.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../mocks/mocks.dart';

void main() {
  test('deve adicionar uma nova QueuesEntity', () {
    final repository = QueueRepositoryMock();
    final queue = QueueEntityMock();

    when(() => repository.addQueue(queue)).thenAnswer((_) => Future.value());

    final usecase = AddNewQueue(repository);

    // final result = usecase.call(queue);

    //testar Future
    expect(usecase.call(queue), completes);

    // expect(result, emits(isA<List<QueueEntity>>()));
  });
}
