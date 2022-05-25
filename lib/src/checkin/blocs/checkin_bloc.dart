import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_firebase_clean_architecture/src/checkin/events/checkin_events.dart';
import 'package:flutter_firebase_clean_architecture/src/checkin/states/checkin_state.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/usecases/generate_order.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/usecases/get_all_queues.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/usecases/update_queue.dart';

class CheckinBloc extends Bloc<CheckinEvent, CheckinState> {
  final IGetAllQueues getAllQueues;
  final IGenerateOrderUsecase generateOrders;
  final IUpdateQueue updateQueue;
  CheckinBloc(
    this.getAllQueues,
    this.generateOrders,
    this.updateQueue,
  ) : super(InitialCheckinState()) {
    on<FetAllQueues>(_fetAllQueues, transformer: restartable());
    on<GenerateOrder>(_generateOrder, transformer: restartable());
    on<PrintOrder>(_printOrder, transformer: restartable());
  }

  FutureOr<void> _fetAllQueues(
      FetAllQueues event, Emitter<CheckinState> emit) async {
    // emit(LoadingCheckinState());
    await emit.onEach<List<QueueEntity>>(
      getAllQueues.call(),
      onData: (queues) {
        emit(SuccesCheckinState(queues));
      },
    );
  }

  FutureOr<void> _generateOrder(GenerateOrder event, emit) async {
    final queue = generateOrders.call(event.queue);
    final order = queue.orders.last;

    await updateQueue.call(queue);

    emit(GeneratedOrderCheckinState(order));
  }

  FutureOr<void> _printOrder(PrintOrder event, Emitter<CheckinState> emit) {}
}
