

import '../entities/offer_entity.dart';
import '../repositories/offer_repository.dart';

class AcceptOfferUseCase {
  final OfferRepository _offerRepository;

  AcceptOfferUseCase(this._offerRepository);

  Future<void> call(String offerId) async {
    final response = await _offerRepository.acceptOffer(offerId);

    return response;
  }
}
