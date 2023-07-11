import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:snap_jobs/offers_feature/domain/entities/offer_entity.dart';
import "package:snap_jobs/offers_feature/domain/usecases/offer_use_cases.dart";
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/offers_feature/domain/entities/offer_entity.dart';

part 'offer_event.dart';
part 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  final ApplyOfferUseCase applyOfferUSerCase;

  OfferBloc(this.applyOfferUSerCase) : super(OfferState()) {
    on<OfferApplyRequested>(_onApplyOffer,
    transformer: droppable(),
    );
  }

  FutureOr<void> _onApplyOffer(
      OfferApplyRequested event, Emitter<OfferState> emit) async {
    emit(state.copyWith(status: OfferStatus.loading));
    try {
      final response = await applyOfferUSerCase.call(event.offer);

      emit(state.copyWith(
          status: OfferStatus.success,
          offer: state.offer.copyWith(offerId: response)));
    } catch (e) {
      emit(state.copyWith(status: OfferStatus.error));
      rethrow;
    }
  }
}
