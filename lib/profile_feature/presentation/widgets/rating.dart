import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:snap_jobs/profile_feature/presentation/controlers/bloc/get_profile_bloc/getbrofile_bloc.dart';

class Rating extends StatefulWidget {
  Rating({
    Key? key,
    required this.currentRating,
    required this.rateStar,
    required this.textColor,
  }) : super(key: key);
  final double currentRating;
  final Color textColor;
  Widget rateStar;

  ///TODO:USE bloc to get rate and may need edit ui
  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    final currentRating = widget.currentRating;
    final rateStar = widget.rateStar;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ' Rating: ${currentRating.toStringAsPrecision(2)}   ',
          style: TextStyle(fontSize: 16, color: widget.textColor),
        ),
        const SizedBox(height: 8),
        RatingBarIndicator(
          rating: currentRating,
          itemBuilder: (context, index) => rateStar,
          itemSize: 15.0,
          direction: Axis.horizontal,
          itemCount: 5,
        ),
      ],
    );
  }
}
