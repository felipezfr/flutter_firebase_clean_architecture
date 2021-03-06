import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/external/queue_firestore_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('queue firestore datasource ', () async {
    final firestore = FakeFirebaseFirestore();
    await firestore.collection('queue').add(
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
      },
    );

    final datasource = QueueFirestoreDatasource(firestore);
    final result = datasource.getAllQueues();

    expect(result, emits(isA<List<Map>>()));
  });

  test('deve adcionar um novo queue a collection queue', () async {
    final firestore = FakeFirebaseFirestore();
    final datasource = QueueFirestoreDatasource(firestore);

    final queue = {
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
    };

    datasource.addQueue(queue);

    final ref = firestore.collection('queue');
    final queues = await ref.get();

    expect(queues.docs.length, 1);
    expect(queues.docs.first['title'], 'Teste Queue');
    expect(queues.docs.first.data().containsKey('id'), false);
  });

  test('deve remover a propriedade orders de todos os docs', () async {
    final firestore = FakeFirebaseFirestore();
    final datasource = QueueFirestoreDatasource(firestore);

    final queue1 = {
      'id': 'abcder',
      'title': 'Teste Queue 1',
      'abbr': 'Tst 1',
      'priority': 1,
      'orders': [
        {
          'id': 'abcd123',
          'position': 2,
          'timestamp': '2022-05-23',
          'status': 'waiting'
        }
      ]
    };

    final queue2 = {
      'id': '123123',
      'title': 'Teste 2',
      'abbr': 'Tst 2',
      'priority': 2,
      'orders': [
        {
          'id': '543123',
          'position': 1,
          'timestamp': '2022-05-22',
          'status': 'attending'
        }
      ]
    };

    await datasource.addQueue(queue1);
    await datasource.addQueue(queue2);
    await datasource.removeAllOrders();

    final ref = firestore.collection('queue');
    final queues = await ref.get();

    expect(queues.docs.first.data().containsKey('orders'), false);
    expect(queues.docs.last.data().containsKey('orders'), false);
  });

  test('deve atualizar a queue', () async {
    final firestore = FakeFirebaseFirestore();
    final datasource = QueueFirestoreDatasource(firestore);

    final queue1 = {
      'id': 'abcder',
      'title': 'Teste Queue 1',
      'abbr': 'Tst 1',
      'priority': 1,
      'orders': []
    };

    final queue2 = {
      'id': 'abcder',
      'title': 'Teste Queue 2',
      'abbr': 'Tst 2',
      'priority': 5,
      'orders': [
        {
          'id': '0001',
          'position': 1,
          'timestamp': '2022-05-22',
          'status': 'attending'
        }
      ]
    };

    await datasource.addQueue(queue1);
    await datasource.updateQueue(queue2);

    final ref = firestore.collection('queue');
    final queue = await ref.doc('abcder').get();

    expect(queue.data()?.containsKey('orders'), true);
    expect((queue.data()?['orders'] as List).length, 1);
    expect(queue.data()?['priority'], 5);
  });
}
