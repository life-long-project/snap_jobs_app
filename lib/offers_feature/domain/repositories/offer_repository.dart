import 'package:snap_jobs/offers_feature/domain/entities/offer_entity.dart';

abstract class OfferRepository {
  Future<List<OfferEntity>> getJobOffers(String jobId);
  Future<OfferEntity> getOneOffer(String offerId);
  Future<void> acceptOffer(String offerId);
  Future<void> deleteOffer(String offerId);
  Future<String> applyOfferAndGetOfferId(OfferEntity offer);
}
