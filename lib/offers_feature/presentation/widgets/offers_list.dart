import 'package:flutter/material.dart';
import 'package:snap_jobs/offers_feature/domain/entities/offer_entity.dart';
import 'package:snap_jobs/offers_feature/presentation/widgets/offer_card.dart';

class OffersListWidget extends StatefulWidget {
  const OffersListWidget({super.key, required this.offers});
  final List<OfferEntity> offers;

  @override
  State<OffersListWidget> createState() => _OffersListState();
}

class _OffersListState extends State<OffersListWidget> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.offers.length,
        itemBuilder: (context, index) {
          return offerCard((widget.offers)[index], context);
        },
      ),
    );
  }
}
