import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:snap_jobs/profile_feature/presentation/controlers/bloc/get_profile_bloc/getbrofile_bloc.dart';

import '../controlers/bloc/get_profile_bloc/getbrofile_state.dart';

class Rating extends StatefulWidget {
  const Rating({Key? key}) : super(key: key);
///TODO:USE bloc to get rate and may need edit ui
  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(' Rating: $_rating', style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        RatingBar(
          initialRating: 3,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ratingWidget: RatingWidget(
            full: const Icon(
              Icons.circle_rounded,
              color: Colors.blue,
              size: 4,
            ),
            half: const Icon(
              Icons.circle_rounded,
              color: Colors.blue,
              size: 4,
            ),
            empty: const Icon(Icons.circle_rounded,
                color: Colors.blue, size: 4),
          ),
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          onRatingUpdate: (rating) {
            setState(() {
               _rating = rating;
            });
          },
        ),
      ],
    );
  }
}
