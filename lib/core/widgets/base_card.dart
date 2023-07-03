import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  const BaseCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.description,
      required this.color})
      : super(key: key);

  final String title;
  final String subTitle;
  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 239,
        height: 119,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 239,
              height: 119,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: color,
              ),
              padding: const EdgeInsets.only(
                left: 11,
                right: 12,
                top: 20,
                bottom: 7,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 205,
                    height: 12.78,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.64),
                  SizedBox(
                    width: 104,
                    height: 8.79,
                    child: Text(
                      subTitle,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.64),
                  SizedBox(
                    width: 164,
                    height: 29.55,
                    child: Text(
                      description,
                      style: const TextStyle(
                        color: Color(0xff5dfdcb),
                        fontSize: 10,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.64),
                  const SizedBox(
                    width: 48,
                    height: 8.79,
                    child: Text(
                      "more info",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
