import 'dart:convert';
import 'dart:io';

import 'package:snap_jobs/offers_feature/data/models/offer_model.dart';
import 'package:snap_jobs/offers_feature/domain/entities/offer_entity.dart';
import 'package:snap_jobs/core/error/exceptions.dart';
import 'package:snap_jobs/core/network/api_constants.dart';
import 'package:snap_jobs/core/network/base_http_client.dart';

abstract class OffersRemoteDataSource {
  Future<List<OfferEntity>> getJobOffers(String jobId);
  Future<OfferEntity> getOneOffer(String offerId);
  Future<void> deleteOffer(String offerId);
  Future<void> acceptOffer(String offerId);
  Future<String> applyOffer(OfferModel offer);
}

class OffersRemoteDataSourceImpl extends OffersRemoteDataSource {
  final BaseHttpClient client;

  OffersRemoteDataSourceImpl(this.client);

  @override
  Future<String> applyOffer(OfferModel offer) async {
    try {
      final Uri url =
          Uri.parse("${ApiConstants.applyOfferPath}${offer.jobId}/");

      final body = offer.toJson();

      final response = await client.post(url, body: body);
      final String offerId = jsonDecode(response.body)["offer"]["_id"];
      return offerId;
    } catch (e) {
      stderr.writeln(e);
//it gives me suggestion to replace with rethrow but doing so will not work
      e is! ServerException ? {} : throw OfflineException();

      //
      rethrow;
    }
  }

  @override
  Future<void> acceptOffer(String offerId) async {
    try {
      final Uri url = Uri.parse("${ApiConstants.acceptOfferPath}$offerId/");
     await client.post(
        url,
        body: {"offer_id": offerId},
      );
    } catch (e) {
      stderr.writeln(e);
//it gives me suggestion to replace with rethrow but doing so will not work
      e is! ServerException ? {} : throw OfflineException();

      //
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
