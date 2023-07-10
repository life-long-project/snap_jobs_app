import 'package:flutter/material.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:snap_jobs/offers_feature/domain/entities/offer_entity.dart';
import 'package:snap_jobs/offers_feature/domain/usecases/accept_offer_use_case.dart';

Card offerCard(OfferEntity offer, BuildContext context) {
  return Card(
    child: Expanded(
      child: ListTile(
        isThreeLine: true,
        title: Text(
          " ${offer.salary} \$",
        ),
        leading: const Icon(Icons.money),
        subtitle: Text(
          """ posted by :${(offer.applicantId ?? "user user").substring(0, 9)}
               ${offer.message ?? ""}""",
          maxLines: 2,
        ),
        trailing: !offer.isAccepted
            ? ElevatedButton(
                onPressed: () async {
                  try {
                    final response =
                        await sl<AcceptOfferUseCase>().call(offer.offerId!);

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
                        content: Text("Something went wrong ${e.toString()}"),
                      ),
                    );
                  }
                },
                child: const Text("Accept"),
              )
            : const SizedBox.shrink(),
      ),
    ),
  );
}
