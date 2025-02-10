import 'package:flutter/material.dart';

class CategoryViewall extends StatelessWidget {
  const CategoryViewall({super.key});

  @override
  Widget build(BuildContext context) {
    double homescreenWidth = MediaQuery.of(context).size.width;
    //double homescreenHeight = MediaQuery.of(context).size.height;
    final List<Map<String, String>> filterplaces = [
      {"name": "Mountain", "icon": "assets/images/mountain.jpg"},
      {"name": "Waterfall", "icon": "assets/images/waterfall.jpeg"},
      {"name": "River", "icon": "assets/images/river.jpg"},
      {"name": "Forest", "icon": "assets/images/forest.jpeg"},
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Category",
            style: TextStyle(fontSize: homescreenWidth * 0.04),
          ),
        ),
        body: ListView.builder(
          itemCount: filterplaces.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(filterplaces[index]["icon"]!),
                radius: homescreenWidth * 0.075,
              ),
              title: Text(
                filterplaces[index]["name"]!,
                style: TextStyle(fontSize: homescreenWidth * 0.04),
              ),
            );
          },
        ));
  }
}
