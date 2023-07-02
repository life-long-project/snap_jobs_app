import 'package:flutter/material.dart';
class RecentReview extends StatelessWidget {
  const RecentReview({super.key});

  @override
  Widget build(BuildContext context) {
     return const Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.person),
                SizedBox(width: 5),
                Text('John Smith'),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star_border, color: Colors.yellow),
                Icon(Icons.star_border, color: Colors.yellow),
              ],
            ),
            SizedBox(height: 5),
            Text(
              'Great service! Will definitely recommend.',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
  }
  