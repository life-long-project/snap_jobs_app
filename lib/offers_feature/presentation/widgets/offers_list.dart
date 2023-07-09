import 'package:flutter/material.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:snap_jobs/offers_feature/domain/entities/offer_entity.dart';
import 'package:snap_jobs/offers_feature/domain/usecases/accept_offer_use_case.dart';

class OffersListWidget extends StatefulWidget {
  const OffersListWidget({super.key, required this.offers});
  final List<OfferEntity> offers;

  @override
  State<OffersListWidget> createState() => _OffersListState();
}

class _OffersListState extends State<OffersListWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.offers.length,
        itemBuilder: (context, index) {
          return Card(
            child: Expanded(
              child: ListTile(
                  isThreeLine: true,
                  title: Text(
                    " ${widget.offers[index].salary} \$",
                  ),
                  leading: const Icon(Icons.money),
                  subtitle: Text(
                    """ posted by :${widget.offers[index].applicantId}
                 ${widget.offers[index].message ?? ""}""",
                  ),
                  trailing: ElevatedButton(
                    onPressed: () async {
                      try {
                     final  response = await  sl<AcceptOfferUseCase>()
                            .call(widget.offers[index].offerId!);

                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("offer accepted "),
                            ),
                          );
                        }
                        if (context.mounted) Navigator.pop(context);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text("Something went wrong ${e.toString()}"),
                          ),
                        );
                      }
                    },
                    child: const Text("Accept"),
                  )),
            ),
          );
        },
      ),
    );
  }
}
