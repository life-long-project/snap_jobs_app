import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import 'package:snap_jobs/profile_feature/presentation/wedgets/Recent_Review.dart';
import 'package:snap_jobs/profile_feature/presentation/wedgets/profile_img.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showMoreText = false;
  bool isLoading = true; // Simulating loading state

  @override
  void initState() {
    super.initState();
    // Simulating API request delay
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.black,
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_active),
              onPressed: () {},
              color: Colors.black,
            ),
          ]),
      body: isLoading
          ? _buildLoadingState()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  ProfileImg(),
                  SizedBox(height: 20),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  //rating
                  RatingBar(
                    initialRating: 3,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: Icon(Icons.point_of_sale, color: Colors.amber),
                      half: Icon(Icons.star_half, color: Colors.amber),
                      empty: Icon(Icons.star_border, color: Colors.amber),
                    ),
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      showMoreText
                          ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis aliquet fringilla turpis a finibus. Vivamus varius arcu ut quam accumsan, in blandit velit consectetur. Nulla vestibulum diam sed velit convallis tempus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed cursus pellentesque dignissim.'
                          : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      maxLines: showMoreText ? null : 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showMoreText = !showMoreText;
                      });
                    },
                    child: Text(showMoreText ? 'Show Less' : 'Show More'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Recent Reviews',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) => const RecentReview(),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildLoadingState() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 20),
            Container(
              height: 20,
              width: 120,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star_half, color: Colors.yellow),
                Icon(Icons.star_border, color: Colors.yellow),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 70,
              width: 200,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Container(
                height: 40,
                width: 120,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 20,
              width: 120,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Container(
              height: 20,
              width: 250,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Container(
              height: 20,
              width: 120,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Container(
              height: 20,
              width: 250,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Recent Reviews',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => _buildLoadingReviewCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingReviewCard() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20,
              width: 80,
              color: Colors.white,
            ),
            SizedBox(height: 5),
            Container(
              height: 20,
              width: 50,
              color: Colors.white,
            ),
            SizedBox(height: 5),
            Container(
              height: 30,
              width: 150,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
