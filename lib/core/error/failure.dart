import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  @override
  List<Object> get props => [];
}

class CacheFailure extends Failure {
  @override
  List<Object> get props => [];
}

class NetworkFailure extends Failure {
  @override
  List<Object> get props => [];
}

class CustomerFailure extends Failure {
  final String? message;

  CustomerFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

class PermissionDeniedFailure extends Failure {
  final String message;

  PermissionDeniedFailure({required this.message});

  @override
  List<Object> get props => [message];
}
