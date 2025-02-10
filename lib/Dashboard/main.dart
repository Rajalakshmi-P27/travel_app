import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/Dashboard/Cart/cartproviders.dart';
import 'package:travel_app/Dashboard/Favourite/favouriteprovider.dart';
import 'package:travel_app/Dashboard/HomeScreen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Favourite Provider Creation.
        ChangeNotifierProvider(
          create: (context) => Favouriteprovider(),
        ),

        // Cart Provider Creation
        ChangeNotifierProvider(
          create: (context) => Cartproviders(),
        ),
      ],
      child: MaterialApp(
          // Remove the debug banner on top right corner.
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // To use defalut text theme
            textTheme: TextTheme(
                titleMedium: TextStyle(
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: Colors.blue),
                titleSmall: TextStyle(
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w400,
                  fontSize: 9,
                ),
                titleLarge: TextStyle(
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                )),
          ),
          home: HomeScreen()),
    );
  }
}
