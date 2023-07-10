import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:snap_jobs/offers_feature/domain/entities/offer_entity.dart';
import 'package:snap_jobs/offers_feature/presentation/bloc/offer_bloc.dart';

class AddOfferDialog extends StatefulWidget {
  final JobEntity job;

  const AddOfferDialog({super.key, required this.job});

  static Route<void> route(JobEntity job) {
    return MaterialPageRoute<void>(builder: (_) => AddOfferDialog(job: job));
  }

  @override
  State<AddOfferDialog> createState() => _AddOfferDialogState();
}

class _AddOfferDialogState extends State<AddOfferDialog> {
  final priceFieldController = TextEditingController();
  final messageFieldController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    messageFieldController.dispose();
    priceFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OfferBloc, OfferState>(
      listener: (context, state) {
        if (state.status == OfferStatus.success) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Offer Added')),
            );
          Navigator.of(context).pop();
        }



        if (state.status == OfferStatus.error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Offer Failed, try again later')),
            );
        }
        if (state.status == OfferStatus.loading) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Loading')),
            );
        }

      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SimpleDialog(
            title: const Text('Add Offer'),
            contentPadding: const EdgeInsetsDirectional.all(15),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            final current = int.parse(priceFieldController.text);
                            priceFieldController.text = (current + 1).toString();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(20),
                          ),
                          child: const Icon(
                            Icons.plus_one,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final current = int.parse(priceFieldController.text);
                            priceFieldController.text = (current - 1).toString();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(20),
                          ),
                          child: const Icon(
                            Icons.exposure_minus_1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextField(
                    controller: priceFieldController
                      ..text = widget.job.salary.toString(),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'price ',
                    ),
                  ),
                  TextField(
                    controller: messageFieldController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Message',
                      helperText: 'Enter your message',
                    ),
                  ),
                  OutlinedButton(
                    child: const Text('Add Offer'),
                    onPressed: () {
                      final offer = OfferEntity(
                        isAccepted: false,
                          offerId: '',
                          jobId: widget.job.jobId,
                          salary: int.parse(priceFieldController.text),
                          message: messageFieldController.text);
                      BlocProvider.of<OfferBloc>(context)
                          .add(OfferApplyRequested(offer));
                    },
                  )
                ],
              )
            ]),
      ),
    );
  }
}
