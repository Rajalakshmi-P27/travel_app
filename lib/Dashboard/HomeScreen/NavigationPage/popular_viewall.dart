import 'package:flutter/material.dart';
import 'package:travel_app/Dashboard/HomeScreen/card_details.dart';
import 'package:travel_app/Dashboard/category_variable.dart';

class PopularViewall extends StatelessWidget {
  const PopularViewall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Popular Destination"),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: detail.length,
          itemBuilder: (context, index) {
            final card = detail[index];
            return CardDetails(
              image: card["image"]!,
              heading: card["heading"]!,
              cardlocation: card["cardlocation"]!,
              content: card["content"]!,
              cardprice: card["cardprice"] is int
                  ? (card["cardprice"] as int).toDouble()
                  : card["cardprice"] as double,
              cardunit: card["cardunit"]!,
            );
          },
        ));
  }
}
