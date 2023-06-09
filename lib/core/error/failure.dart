import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure() : super('');
}

class NoInternetFailure extends Failure {
  const NoInternetFailure(super.message);
}

class ImplementationFailure extends Failure {
  const ImplementationFailure(super.message);
}

class OfflineFailure extends Failure {
  const OfflineFailure() : super('');
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure() : super('');
}
