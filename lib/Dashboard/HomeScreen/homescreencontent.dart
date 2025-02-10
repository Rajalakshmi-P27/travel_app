import 'package:flutter/material.dart';
import 'package:travel_app/Dashboard/HomeScreen/NavigationPage/category_viewall.dart';
import 'package:travel_app/Dashboard/HomeScreen/NavigationPage/new_page.dart';
import 'package:travel_app/Dashboard/HomeScreen/NavigationPage/popular_viewall.dart';
import 'package:travel_app/Dashboard/HomeScreen/card_details.dart';
import 'package:travel_app/Dashboard/HomeScreen/category_item_view.dart';
import 'package:travel_app/Dashboard/Profile/profile_page.dart';
import 'package:travel_app/Dashboard/category_variable.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  Widget build(BuildContext context) {
    double homescreenWidth = MediaQuery.of(context).size.width;
    double homescreenHeight = MediaQuery.of(context).size.height;
    TextStyle currentlocation = TextStyle(
      fontWeight: FontWeight.normal,
      fontFamily: "Gilroy",
      fontSize: homescreenWidth * 0.032,
      color: Colors.grey,
    );
    TextStyle bali = TextStyle(
      fontFamily: "Gilroy",
      fontWeight: FontWeight.w600,
      fontSize: homescreenWidth * 0.03,
    );

    TextStyle category = TextStyle(
      fontFamily: "Gilroy",
      fontWeight: FontWeight.w700,
      fontSize: homescreenWidth * 0.045,
    );
    TextStyle viewall = TextStyle(
      fontFamily: "Gilroy",
      fontWeight: FontWeight.w500,
      fontSize: homescreenWidth * 0.03,
      color: Colors.blue,
    );
    TextStyle populardestination = TextStyle(
      fontFamily: "Gilroy",
      fontWeight: FontWeight.w700,
      fontSize: homescreenWidth * 0.045,
    );

    TextStyle popularviewall = TextStyle(
      fontFamily: "Gilroy",
      fontWeight: FontWeight.w500,
      fontSize: homescreenWidth * 0.03,
      color: Colors.blue,
    );
    return Scaffold(
      // Part 1 - AppBar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 20),
          child: AppBar(
            leading: Image.asset(
              "assets/images/list.png",
              height: homescreenHeight * 0.10,
              width: homescreenWidth * 0.10,
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Current Location",
                  style: currentlocation,
                ),
                SizedBox(height: homescreenHeight * 0.005),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center the row horizontally
                  children: [
                    Icon(Icons.location_pin, size: 20, color: Colors.blue),
                    Text(
                      "Denpasar, Bali",
                      style: bali,
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                child: Image.asset(
                  "assets/images/man.png",
                  height: homescreenHeight * 0.08,
                  width: homescreenWidth * 0.08,
                ),
              ),
            ],
          ),
        ),
      ),

      // Part 2 -> Body content
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Category Section
            Padding(
              padding: EdgeInsets.only(
                left: homescreenWidth * 0.07,
                right: homescreenWidth * 0.01,
              ),
              child: Padding(
                padding: EdgeInsets.only(top: homescreenHeight * 0.03),
                child: Row(
                  children: [
                    Text("Category", style: category),
                    Spacer(),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryViewall()));
                          },
                          child: Text("View all", style: viewall),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: homescreenWidth * 0.03,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: homescreenHeight * 0.03),

            // Filter Section
            Padding(
              padding: EdgeInsets.only(left: homescreenWidth * 0.06),
              child: SizedBox(
                height: homescreenHeight * 0.07,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filterplaces.length,
                  itemBuilder: (context, index) {
                    final filters = filterplaces[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: homescreenWidth * 0.01),
                      child: Chip(
                        avatar: CircleAvatar(
                          backgroundImage: AssetImage(filters["icon"]!),
                          radius: homescreenWidth * 0.075,
                        ),
                        label: Text(
                          filters["name"]!,
                          style: TextStyle(fontSize: homescreenWidth * 0.04),
                        ),
                        backgroundColor: Color.fromARGB(255, 240, 242, 242),
                        side: BorderSide(
                            color: Color.fromARGB(255, 240, 242, 242)),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Category Cards Section
            Padding(
              padding: EdgeInsets.only(
                left: homescreenWidth * 0.06,
                top: homescreenHeight * 0.02,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var categories in categoryList)
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NewPage(
                                    detail: categories,
                                  )));
                        },
                        child: CategoryItemView(
                          imageurl: categories['imageurl'],
                          name: categories['name'],
                          price: categories['price'].toDouble(),
                          place: categories['place'],
                          unit: categories['unit'],
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // Popular Destinations Section
            Padding(
              padding: EdgeInsets.only(
                left: homescreenWidth * 0.07,
                top: homescreenHeight * 0.03,
                right: homescreenWidth * 0.07,
              ),
              child: Row(
                children: [
                  Text(
                    "Popular Destination",
                    style: populardestination,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PopularViewall()));
                        },
                        child: Text(
                          "View all",
                          style: popularviewall,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: homescreenWidth * 0.03,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: homescreenHeight * 0.03),

            // Popular Cards Section
            Padding(
              padding: EdgeInsets.only(
                left: homescreenWidth * 0.07,
                right: homescreenWidth * 0.07,
              ),
              child: ListView.builder(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
