import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                  image: DecorationImage(
                    image: const NetworkImage(
                        "https://images.unsplash.com/photo-1517840901100-8179e982acb7?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7),
                      BlendMode.darken,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColors.kPrimaryColor,
                            ),
                            Text(
                              "Norway",
                              style: TextStyle(
                                color: AppColors.kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.person,
                          color: AppColors.kPrimaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Hey, Martin Tell Us where you want to go",
                      style: TextStyle(
                        color: AppColors.kPrimaryColor,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isPressed = !isPressed;
                        });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade800.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: AppColors.kPrimaryColor,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                isPressed
                                    ? SizedBox(
                                        width: 250,
                                        height: 30,
                                        child: TextField(
                                          cursorColor: AppColors.kPrimaryColor,
                                        ),
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Search Places",
                                            style: TextStyle(
                                              color: AppColors.kPrimaryColor,
                                            ),
                                          ),
                                          Text(
                                            "Date Rang and Number of geusts",
                                            style: TextStyle(
                                              color: AppColors.kPrimaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Text("The Most Relevant"),
          SizedBox(
            height: 350,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: AppColors.kBackgroundColor,
                    ),
                    width: 300,
                    height: 300,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.network(
                                "https://images.unsplash.com/photo-1445019980597-93fa8acb246c?q=80&w=874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                              ),
                            ),
                            Positioned(
                              top: 20,
                              right: 30,
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color:
                                      const Color.fromARGB(255, 105, 102, 102),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.favorite,
                                    color: AppColors.kPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tiny home in Religon",
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                  ),
                                  Text("4.98(217)")
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FacilityItem(
                                facilityName: "4 gest",
                              ),
                              FacilityItem(
                                facilityName: "4 gest",
                              ),
                              FacilityItem(
                                facilityName: "4 gest",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FacilityItem extends StatelessWidget {
  const FacilityItem({
    super.key,
    required this.facilityName,
  });
  final String facilityName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(facilityName),
      ],
    );
  }
}
