import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/Dashboard/Cart/cartproviders.dart';
import 'package:travel_app/Dashboard/Favourite/favouriteprovider.dart';
import 'package:travel_app/Dashboard/category_variable.dart';

class NewPage extends StatefulWidget {
  final Map<String, Object> detail;

  const NewPage({super.key, required this.detail});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  void onTap() {
    Provider.of<Favouriteprovider>(context, listen: false).addProduct({
      "imageurl": widget.detail['imageurl'],
      "name": widget.detail['name'],
      "price": widget.detail['price'],
    });
  }

  void onTapcart() {
    Provider.of<Cartproviders>(context, listen: false).addProduct({
      "imageurl": widget.detail['imageurl'],
      "name": widget.detail['name'],
      "price": widget.detail['price'],
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Stack(
        children: [
          // Background Image
          ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: Image.asset(
              widget.detail['imageurl'] as String,
              width: double.infinity,
              height: screenHeight * 0.45,
              fit: BoxFit.cover,
            ),
          ),

          // Back Icon
          Positioned(
            top: screenHeight * 0.05,
            left: screenWidth * 0.05,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_outlined, size: 18)),
            ),
          ),

          // Favorite Icon
          Positioned(
            top: screenHeight * 0.05,
            right: screenWidth * 0.05,
            child: Container(
              width: 34, // Same as back arrow's container
              height: 34,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: () {
                  onTap();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Added to favourite list"),
                    ),
                  );
                },
                icon: Icon(Icons.favorite_border, color: Colors.red, size: 18),
                padding: EdgeInsets.zero, // Remove extra padding
                constraints: BoxConstraints(), // Ensure size consistency
              ),
            ),
          ),
          // Content Container
          Positioned(
            top: screenHeight * 0.35,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // creating one more column to store name and location and another row to store prices and unit.
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                // Only take the necessary vertical space
                                children: [
                                  // col 1 -> name
                                  Text(
                                    widget.detail['name'] as String,
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),

                                  // col 2 -> create row for loc icon and loc
                                  Row(
                                    children: [
                                      //Loc icon
                                      Icon(
                                        Icons.location_pin,
                                        size: 14,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(height: 4),

                                      // Loc name
                                      Text(
                                        widget.detail['place'] as String,
                                        textAlign: TextAlign.start,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ]),

                            //creating row inside col to have price and unit

                            // Created another row to have row 1-> price and row 2-> unit
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '\$${widget.detail['price']?.toString() ?? "0"}',
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 24),
                                ),
                                SizedBox(
                                  width: 4,
                                  height: 6,
                                ),
                                // row2-> unit
                                Text(
                                  "/${widget.detail['unit']}",
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontSize: 12, color: Colors.grey),
                                )
                              ],
                            ),
                          ]),

                      SizedBox(height: screenHeight * 0.03),

                      // Description
                      Text(
                        "The mighty Rinjani mountain of Gunung Rinjani is a massive volcano which towers over the island of Lombok. A climb to the top is one of the most exhilarating experiences you can have in Indonesia. At 3,726 meters tall, Gunung Rinjani is the second highest mountain in Indonesia...",
                        textAlign: TextAlign.justify,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 14, color: Colors.grey),
                      ),

                      SizedBox(height: screenHeight * 0.03),

                      // Preview Row
                      Row(
                        children: [
                          Text(
                            "Preview",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 18),
                          ),
                          Spacer(),
                          SizedBox(
                            height: 30,
                            width: 50,
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.amberAccent, size: 14),
                                    Text(
                                      "4.8",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      SizedBox(
                        height: screenHeight *
                            0.11, // Adjust height for the scroll view
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: previewdetails.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  previewdetails[index]["imageurl"]!,
                                  width: screenWidth *
                                      0.20, // Set width to 24% of screen width
                                  height: screenHeight *
                                      0.11, // Set height to 24% of screen height
                                  fit: BoxFit
                                      .cover, // Use BoxFit to ensure proper scaling
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.05),

                      // Book Now Button
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Added to cart"),
                              ),
                            );
                            onTapcart();
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                                screenWidth * 0.9,
                                screenHeight *
                                    0.05), // Adjusting button width and height

                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Book Now",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
