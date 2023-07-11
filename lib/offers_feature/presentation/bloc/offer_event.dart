part of 'offer_bloc.dart';

abstract class OfferEvent extends Equatable {
   OfferEvent( this.offer);
  OfferEntity offer;

  @override
  List<Object> get props => [offer];
}


class OfferApplyRequested extends OfferEvent {
  OfferApplyRequested(OfferEntity offer ) : super(offer);
}


class OfferDeleteRequested extends OfferEvent {
  OfferDeleteRequested(OfferEntity offer) : super(offer);
}

class OfferAcceptRequested extends OfferEvent {
  OfferAcceptRequested(OfferEntity offer) : super(offer);



}





