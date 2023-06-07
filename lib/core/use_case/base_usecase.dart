import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract class BaseUseCase<T, Parameters> {
  
  Future<T> call(Parameters parameters);
}




class NoParameters extends Equatable {
  const NoParameters();
  @override
  List<Object> get props => [];
}
