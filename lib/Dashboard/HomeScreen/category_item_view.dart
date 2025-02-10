import 'package:flutter/material.dart';

class CategoryItemView extends StatelessWidget {
  final String imageurl;
  final String name;
  final double price;
  final String place;
  final String unit;

  const CategoryItemView(
      {super.key,
      required this.imageurl,
      required this.name,
      required this.price,
      required this.place,
      required this.unit});

  @override
  Widget build(BuildContext context) {
    double homescreenWidth = MediaQuery.of(context).size.width;
    double homescreenHeight = MediaQuery.of(context).size.height;

    TextStyle nameStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    TextStyle pricestyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    TextStyle placestyle = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    );
    TextStyle unitstyle = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    );

    // Determine a max width for larger screens like desktop (Chrome)
    double maxImageWidth =
        homescreenWidth > 800 ? homescreenWidth * 0.25 : homescreenWidth * 0.60;
    double maxImageHeight = homescreenHeight > 800
        ? homescreenHeight * 0.18
        : homescreenHeight * 0.20;
    return Padding(
      padding: EdgeInsets.all(homescreenWidth * 0.02),
      child: Stack(
        children: [
          ClipRRect(
            // to make roundedrect
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Image.asset(imageurl,
                width: maxImageWidth, height: maxImageHeight, fit: BoxFit.fill),
          ),
          Positioned(
              left: homescreenWidth * 0.05,
              right: homescreenWidth * 0.05,
              top: homescreenHeight * 0.13,
              child: Column(children: [
                //Col 1
                Row(
                  children: [
                    Text(name, style: nameStyle),
                    Spacer(),
                    Text('\$${price.toStringAsFixed(0)}', style: pricestyle),
                  ],
                ),

                //Col 2
                Row(
                  children: [
                    Row(children: [
                      Icon(
                        Icons.location_pin,
                        size: 15,
                        color: Colors.white,
                      ),
                      Text(place, style: placestyle),
                    ]),
                    Spacer(),
                    Text("/$unit", style: unitstyle),
                  ],
                )
              ])),
        ],
      ),
    );
  }
}
