import 'package:flutter/material.dart';
import 'package:snap_jobs/core/util/colors_list.dart';
import 'package:snap_jobs/profile_feature/presentation/widgets/rating.dart';
import 'package:snap_jobs/rate/data/models/rate_model.dart';

class RecentReview extends StatelessWidget {
  final RateModel _rate;
  const RecentReview(this._rate, int index, {super.key})
      : _colorIndex = index % 3;
  final int _colorIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: ColorsLists.backgroundColors[_colorIndex],

      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: ColorsLists.textColors[_colorIndex],
                ),
                SizedBox(width: 5),
                Text(_rate.rate.toString() ,
                    style: TextStyle(
                      color: ColorsLists.titleColors[_colorIndex],
                    )),
              ],
            ),
            SizedBox(height: 5),
            Rating(
              currentRating: _rate.rate,
              rateStar: Icon(Icons.circle,
                  color: ColorsLists.titleColors[_colorIndex],
                                  ),
                                  textColor : ColorsLists.textColors[_colorIndex],
            ),
            SizedBox(height: 5),
            Text(_rate.message.isEmpty ? 'No messagefadfadfadfafdafadf' : _rate.message ,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ColorsLists.textColors[_colorIndex],
                )),
          ],
        ),
      ),
    );
  }
}
