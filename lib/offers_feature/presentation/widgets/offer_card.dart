import 'package:flutter/material.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:snap_jobs/offers_feature/domain/entities/offer_entity.dart';
import 'package:snap_jobs/offers_feature/domain/usecases/accept_offer_use_case.dart';

Card offerCard(OfferEntity offer, BuildContext context) {
  return Card(
    elevation: 5,
    child: Expanded(
      child: ListTile(
        isThreeLine: true,
        //* salary
        title: Text(
          " ${offer.salary} \$",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leading: const Icon(Icons.money),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              //* Applicant Name

              """ posted by :${(offer.applicantName ?? "mohamed ahmed")}
                   ${offer.message ?? ""}""",
              maxLines: 1,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            RichText(text: TextSpan(
              text: "rating ",
              style: Theme.of(context).textTheme.bodySmall,
              children: [
                TextSpan(
                  text: "4",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black,
                      ),
                ),
                const WidgetSpan(
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,),
                )
              ],
            ))
            ,

          ],
        ),

        trailing: !offer.isAccepted
            ? ElevatedButton(
                onPressed: () async {
                  try {
                    await sl<AcceptOfferUseCase>().call(offer.offerId!);

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "offer accepted ",
                          ),
                        ),
                      );
                      if (context.mounted) Navigator.pop(context);
                    }
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
