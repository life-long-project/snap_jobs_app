import '../entities/offer_entity.dart';
import '../repositories/offer_repository.dart';

class ApplyOfferUseCase {
  final OfferRepository _offerRepository;

  ApplyOfferUseCase(this._offerRepository);

  Future<String> call(OfferEntity offer) async {
    final response = await _offerRepository.applyOfferAndGetOfferId(offer);

    return response;
  }
}
