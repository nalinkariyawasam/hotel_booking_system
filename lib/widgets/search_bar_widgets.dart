import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hotelbookingapp/utils/app_colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
