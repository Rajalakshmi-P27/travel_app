import 'package:flutter/material.dart';

class CardDetails extends StatelessWidget {
  final String image;
  final String heading;
  final String cardlocation;
  final String content;
  final double cardprice;
  final String cardunit;

  const CardDetails(
      {super.key,
      required this.image,
      required this.heading,
      required this.cardlocation,
      required this.content,
      required this.cardprice,
      required this.cardunit});

  @override
  Widget build(BuildContext context) {
    double homescreenWidth = MediaQuery.of(context).size.width;
    double homescreenHeight = MediaQuery.of(context).size.height;
    // Determine a max width for larger screens like desktop (Chrome)
    double maxImageWidth =
        homescreenWidth > 800 ? homescreenWidth * 0.15 : homescreenWidth * 0.30;
    double maxImageHeight = homescreenHeight > 800
        ? homescreenHeight * 0.40
        : homescreenHeight * 0.16;

    return SizedBox(
      width: homescreenWidth * 0.80,
      height: homescreenHeight * 0.18,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(homescreenWidth * 0.02),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              Padding(
                padding: EdgeInsets.only(
                    left: homescreenWidth * 0.02,
                    right: homescreenWidth * 0.03,
                    top: homescreenWidth * 0.02,
                    bottom: homescreenWidth * 0.02),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image.asset(
                    image,
                    width: maxImageWidth,
                    height: maxImageHeight,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Content Section
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: homescreenWidth * 0.02,
                      right: homescreenWidth * 0.03,
                      top: homescreenWidth * 0.03,
                      bottom: homescreenWidth * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Heading
                      Text(
                        heading,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: homescreenHeight * 0.01),
                      // Location
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            size: 15,
                            color: Colors.blue,
                          ),
                          Text(
                            cardlocation,
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                      SizedBox(height: homescreenHeight * 0.01),
                      // Content
                      Expanded(
                        child: Text(content,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.justify,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.titleSmall),
                      ),

                      // Price Section
                      Row(children: [
                        Row(children: [
                          // price
                          Text("\$ ${cardprice.toStringAsFixed(0)}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontSize: 12,
                                  )),

                          SizedBox(width: 5),
                          Text("/ $cardunit",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.black)),
                        ]),
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
