import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/external/queue_firestore_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('queue firestore datasource ', () async {
    final firestore = FakeFirebaseFirestore();
    await firestore.collection('queue').add({
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

    final datasource = QueueFirestoreDatasource(firestore);
    final result = datasource.getAllQueues();

    expect(result, emits(isA<List<Map>>()));
  });
}