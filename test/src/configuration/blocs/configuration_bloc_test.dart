import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_firebase_clean_architecture/src/configuration/blocs/configuration_bloc.dart';
import 'package:flutter_firebase_clean_architecture/src/configuration/events/conf_event.dart';
import 'package:flutter_firebase_clean_architecture/src/configuration/states/conf_state.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';
import 'package:flutter_firebase_clean_architecture/src/queue/domain/usecases/remove_all_orders.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mocks.dart';

void main() {
  final entity = QueueEntityMock();

  late IGetAllQueuesMock getAllQueuesUsecase;
  late IAddNewQueuesMock addNewQueuesUsecase;
  late IRemoveQueuesMock removeQueuesUsecase;
  late IRemoveAllOrdersMock removeAllOrdersUsecase;
  late ConfigurationBloc bloc;

  setUp(
    () {
      getAllQueuesUsecase = IGetAllQueuesMock();
      addNewQueuesUsecase = IAddNewQueuesMock();
      removeQueuesUsecase = IRemoveQueuesMock();
      removeAllOrdersUsecase = IRemoveAllOrdersMock();

      bloc = ConfigurationBloc(getAllQueuesUsecase, addNewQueuesUsecase,
          removeQueuesUsecase, removeAllOrdersUsecase);
    },
  );

  blocTest<ConfigurationBloc, ConfigurationState>(
    'conf bloc FetchQueues',
    build: () {
      when(() => getAllQueuesUsecase.call())
          .thenAnswer((_) => Stream.value([]));
      return bloc;
    },
    act: (bloc) => bloc.add(FetchQueuesEvent()),
    expect: () => [
      isA<LoadingConfigurationState>(),
      isA<LoadedConfigurationState>(),
    ],
  );

  blocTest<ConfigurationBloc, ConfigurationState>(
    'conf bloc IAddNewQueuesMock',
    build: () {
      when(() => addNewQueuesUsecase.call(entity))
          .thenAnswer((_) => Future.value());

      return bloc;
    },
    act: (bloc) => bloc.add(AddNewQueueEvent(entity)),
    expect: () => [],
  );

  blocTest<ConfigurationBloc, ConfigurationState>(
    'conf bloc IRemoveQueuesMock',
    build: () {
      when(() => removeQueuesUsecase.call(entity))
          .thenAnswer((_) => Future.value());
      return bloc;
    },
    act: (bloc) => bloc.add(RemoveQueueEvent(entity)),
    expect: () => [],
  );

  blocTest<ConfigurationBloc, ConfigurationState>(
    'conf bloc FetchQueues whit error',
    build: () {
      when(() => getAllQueuesUsecase.call())
          .thenAnswer((_) => Stream.error(Exception('Erro')));
      return bloc;
    },
    act: (bloc) => bloc.add(FetchQueuesEvent()),
    expect: () => [
      isA<LoadingConfigurationState>(),
      isA<ExceptionConfigurationState>(),
    ],
  );
}
