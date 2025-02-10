import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
          ),
        ),
        body: Column(children: [
          Container(
            color: const Color.fromARGB(255, 227, 226, 226),
            width: MediaQuery.of(context).size.width * 0.85,
            // 85% width
            child: Padding(
              padding: EdgeInsets.only(
                  top: screenheight * 0.04,
                  left: screenwidth * 0.04,
                  right: screenwidth * 0.04,
                  bottom: screenheight * 0.04),
              child: Column(
                children: [
                  // Username
                  Row(
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: Colors.blueGrey,
                        size: screenwidth * 0.055,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "KK",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: screenwidth * 0.055),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // Booked items.

                  Row(
                    children: [
                      Icon(
                        Icons.push_pin,
                        color: Colors.redAccent,
                        size: screenwidth * 0.055,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "Booked Items",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: screenwidth * 0.055),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenheight * 0.48,
                  ),

                  Divider(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Logout"),
                                content:
                                    Text("Are you sure you want to logout"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Yes")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("No"))
                                ],
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize:
                              screenwidth < 50 ? Size(50, 36) : Size(200, 50),
                          //maximumSize: Size(200, 50),
                          //fixedSize: Size(140, 40),
                          backgroundColor: Colors.red),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.white,
                            size: screenwidth * 0.045,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(fontSize: screenwidth * 0.045),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
