import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'rate_state.dart';

class RateCubit extends Cubit<RateState> {
  RateCubit() : super(RateInitial());
}
