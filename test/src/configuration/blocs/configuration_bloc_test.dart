import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_firebase_clean_architecture/src/configuration/blocs/configuration_bloc.dart';
import 'package:flutter_firebase_clean_architecture/src/configuration/events/conf_event.dart';
import 'package:flutter_firebase_clean_architecture/src/configuration/states/conf_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks/mocks.dart';

void main() {
  blocTest<ConfigurationBloc, ConfigurationState>('conf bloc...',
      build: () {
        final getAllQueuesUsecase = IGetAllQueuesMock();
        final addNewQueuesUsecase = IAddNewQueuesMock();
        final removeQueuesUsecase = IRemoveQueuesMock();

        when(() => getAllQueuesUsecase.call())
            .thenAnswer((_) => Stream.value([]));
        return ConfigurationBloc(
            getAllQueuesUsecase, addNewQueuesUsecase, removeQueuesUsecase);
      },
      act: (bloc) => bloc.add(FetchQueues()),
      expect: () => [
            isA<LoadingConfigurationState>(),
            isA<LoadedConfigurationState>(),
          ]);
}
