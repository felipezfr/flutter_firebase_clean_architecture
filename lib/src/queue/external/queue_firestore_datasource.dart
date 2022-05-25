import 'package:flutter_firebase_clean_architecture/src/queue/infra/datasource/queue_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QueueFirestoreDatasource implements IQueueDatasource {
  final FirebaseFirestore firestore;

  QueueFirestoreDatasource(this.firestore);
  @override
  Stream<List<Map>> getAllQueues() {
    final ref = firestore.collection('queue');
    final snapshot = ref.orderBy('priority', descending: true).snapshots();

    return snapshot.map((event) => event.docs).map(_convert);
  }

  @override
  Future<void> addQueue(Map<String, dynamic> map) async {
    final ref = firestore.collection('queue');
    map.remove('id');
    ref.add(map);
  }

  List<Map> _convert(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    return docs
        .map((document) => {
              'id': document.id,
              ...document.data(),
            })
        .toList();
  }

  @override
  Future<void> removeQueue(String id) async {
    final ref = firestore.collection('queue');

    await ref.doc(id).delete();
  }

  @override
  Future<void> removeAllOrders() async {
    final ref = firestore.collection('queue');

    final snapshot = await ref.get();

    for (var doc in snapshot.docs) {
      final map = doc.data();
      map.remove('orders');
      doc.reference.set(map);
    }
  }

  @override
  Future<void> updateQueue(Map<String, dynamic> map) async {
    final ref = firestore.collection('queue');
    final doc = ref.doc(map['id']);

    await doc.set(map);
  }
}
