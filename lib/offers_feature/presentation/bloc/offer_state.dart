part of 'offer_bloc.dart';

enum OfferStatus {
  initial,
  loading,
  success,
  error,
}

class OfferState extends Equatable {
  OfferState(
      {this.offer = const OfferEntity.empty(),
      this.status = OfferStatus.initial});

  OfferEntity offer;
  OfferStatus status;

  OfferState copyWith({
    OfferStatus? status,
    OfferEntity? offer,
  }) {
    return OfferState(
      status: status ?? this.status,
      offer: offer ?? this.offer,
    );
  }

  @override
  List<Object> get props => [offer, status];
}
