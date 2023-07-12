import 'package:snap_jobs/offers_feature/data/data_sources/offers_remote_data_source.dart';
import 'package:snap_jobs/offers_feature/data/models/offer_model.dart';
import 'package:snap_jobs/offers_feature/domain/entities/offer_entity.dart';
import 'package:snap_jobs/offers_feature/domain/repositories/offer_repository.dart';

class OfferRepositoryImpl extends OfferRepository {
  final OffersRemoteDataSource remoteDataSource;

  OfferRepositoryImpl(this.remoteDataSource);
  @override
  Future<void> acceptOffer(String offerId) async {
    try{

      final response = await remoteDataSource.acceptOffer(offerId);
    } catch (e) {
      rethrow;
    }


  }
  @override
  Future<String> applyOfferAndGetOfferId(OfferEntity offer) async {
    try {
      final offerModel = OfferModel(
        offerId: offer.offerId,
        message: offer.message,
        jobId: offer.jobId,
        salary: offer.salary,
      );

      final response = await remoteDataSource.applyOffer(offerModel);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteOffer(String offerId) {
    // TODO: implement deleteOffer
    throw UnimplementedError();
  }

  @override
  Future<List<OfferEntity>> getJobOffers(String jobId) {
    // TODO: implement getJobOffers
    throw UnimplementedError();
  }

  @override
  Future<OfferEntity> getOneOffer(String offerId) {
    // TODO: implement getOneOffer
    throw UnimplementedError();
  }


}
