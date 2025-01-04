import 'package:flutter/material.dart';
import 'package:hotelbookingapp/screens/booking_screen.dart';
import 'package:hotelbookingapp/screens/discover_screen.dart';
import 'package:hotelbookingapp/screens/favarite_screen.dart';
import 'package:hotelbookingapp/screens/message_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int screenNo = 0;
  List<Widget> screens = [
    const DiscoverScreen(),
    const FavariteScreen(),
    const BookingScreen(),
    const MessageScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[screenNo],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color.fromARGB(202, 0, 0, 0),
          ),
          width: double.infinity,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bottomNavaigationIcon(
                  icon: Icons.favorite, iconText: "Discover", index: 0),
              bottomNavaigationIcon(
                  icon: Icons.home, iconText: "Favorite", index: 1),
              bottomNavaigationIcon(
                  icon: Icons.shopping_bag, iconText: "Booking", index: 2),
              bottomNavaigationIcon(
                  icon: Icons.shopping_bag, iconText: "Messages", index: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavaigationIcon(
      {required IconData icon, required String iconText, required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          screenNo = index;
        });
        print(screenNo);
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: screenNo == index ? Colors.white : Colors.grey,
            size: screenNo == index ? 23 : 18,
          ),
          Text(
            iconText,
            style: TextStyle(
              color: screenNo == index ? Colors.white : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
