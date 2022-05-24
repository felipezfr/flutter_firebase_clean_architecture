import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_firebase_clean_architecture/src/configuration/events/conf_event.dart';
import 'package:flutter_firebase_clean_architecture/src/configuration/states/conf_state.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/usecases/add_new_queue.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/usecases/get_all_queues.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/usecases/remove_all_orders.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/usecases/remove_queue.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final IGetAllQueues getAllqueuesUsecase;
  final IAddNewQueue addNewQueueUsecase;
  final IRemoveQueue removeQueueUsecase;
  final IRemoveAllOrders removeAllOrdersUsecase;

  ConfigurationBloc(
    this.getAllqueuesUsecase,
    this.addNewQueueUsecase,
    this.removeQueueUsecase,
    this.removeAllOrdersUsecase,
  ) : super(EmptyConfigurationState()) {
    on<FetchQueuesEvent>(_fetchQueue, transformer: restartable());
    on<AddNewQueueEvent>(_addNewQueue, transformer: droppable());
    on<RemoveQueueEvent>(_removeQueue, transformer: sequential());
    on<RemoveAllOrdersEvent>(_removeAllOrders, transformer: droppable());
  }

  Future<void> _fetchQueue(event, Emitter emit) async {
    emit(LoadingConfigurationState());

    await emit.onEach<List<QueueEntity>>(getAllqueuesUsecase.call(),
        onData: (queues) {
      emit(LoadedConfigurationState(queues));
    }, onError: (error, stackTrace) {
      emit(
        ExceptionConfigurationState(error.toString()),
      );
    });
  }

  Future<void> _addNewQueue(
      AddNewQueueEvent event, Emitter<ConfigurationState> emit) async {
    await addNewQueueUsecase.call(event.queue);
  }

  FutureOr<void> _removeQueue(
      RemoveQueueEvent event, Emitter<ConfigurationState> emit) async {
    await removeQueueUsecase.call(event.queue);
  }

  FutureOr<void> _removeAllOrders(
      event, Emitter<ConfigurationState> emit) async {
    await removeAllOrdersUsecase.call();
  }
}
