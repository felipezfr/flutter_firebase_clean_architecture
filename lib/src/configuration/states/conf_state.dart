import 'package:flutter_firebase_clean_architecture/src/queue/domain/entities/queue_entity.dart';

abstract class ConfState {}

class EmptyConfState implements ConfState {}

class LoadingConfState implements ConfState {}

class LoadedConfState implements ConfState {
  final List<QueueEntity> queue;

  LoadedConfState(this.queue);
}

class ExceptionConfState implements ConfState {
  final String message;

  ExceptionConfState(this.message);
}