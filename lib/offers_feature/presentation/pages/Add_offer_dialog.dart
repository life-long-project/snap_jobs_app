import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
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
    final deviceWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.along(Axis.horizontal);
    final deviceHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.along(Axis.vertical) -
        kToolbarHeight -
        kBottomNavigationBarHeight);

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
              SizedBox(
                width: deviceWidth * 0.8,
                height: deviceHeight * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            final current =
                                int.parse(priceFieldController.text);
                            priceFieldController.text =
                                (current - 10).toString();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(4),
                          ),
                          child: const CircleAvatar(
                            child: Text("-10"),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: IntrinsicWidth(
                            child: TextField(
                              controller: priceFieldController
                                ..text = widget.job.salary.toString(),
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'price ',
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final current =
                                int.parse(priceFieldController.text);
                            priceFieldController.text =
                                (current + 10).toString();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(4),
                          ),
                          child: const CircleAvatar(
                            child: Text("+10"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Flexible(
                      flex: 3,
                      fit: FlexFit.loose,
                      child: TextField(
                        controller: messageFieldController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Message',
                          helperText: 'Enter your message',
                        ),
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
                ),
              )
            ]),
      ),
    );
  }
}
