import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:snap_jobs/offers_feature/domain/entities/offer_entity.dart';
import 'package:snap_jobs/offers_feature/domain/usecases/accept_offer_use_case.dart';

import '../../../profile_feature/presentation/Screens/profile_page.dart';

Card offerCard(OfferEntity offer, BuildContext context) {
  return Card(
    elevation: 5,
    child: ListTile(
      isThreeLine: true,
      //* salary
      title: Text(
        " ${offer.salary} \$",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      leading: const Icon(Icons.money),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: "Posted by:  ",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.black,
                  ),
              children: [
                TextSpan(
                  text: (offer.applicantName ?? "mohamed ahmed"),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      offer.applicantId == null
                          ? ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "sorry, error happend",
                                ),
                              ),
                            )
                          : Navigator.of(context)
                              .push(ProfileScreen.route(offer.applicantId!));
                    },
                ),
              ],
            ),
          ),
          Text(
            //* Applicant Name

            " ${offer.message ?? ""}",
            maxLines: 3,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          // RichText(
          //   text: TextSpan(
          //     text: "Rating : ",
          //     style: Theme.of(context).textTheme.bodySmall,
          //     children: [
          //       TextSpan(
          //         text: "4",
          //         style: Theme.of(context).textTheme.bodySmall!.copyWith(
          //               color: Colors.black,
          //             ),
          //       ),
          //       const WidgetSpan(
          //         child: Icon(
          //           Icons.star,
          //           color: Colors.amber,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
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
  );
}
