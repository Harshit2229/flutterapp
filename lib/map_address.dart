import 'package:flutter/material.dart';
import 'package:flutterapp/adding_address.dart';
import 'package:flutterapp/theme/colors.dart';
import 'package:flutterapp/wash_my_car.dart';

class MapAddress extends StatelessWidget {
  const MapAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 100.0, 20.0, 20.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const WashMyCar(),
                        ));// Handle icon button press
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.blue,
                    size: 35,
                  ),
                ),
                const SizedBox(width: 70.0),
                const Text(
                  'My Address',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/Map.png',
                  width: 300,
                  height: 300,
                ),
                const SizedBox(height: 40.0),
                const Text(
                  'You haven’t saved any address',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 05.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddingAddress(),
                        ));
                    // Handle arrow button tap
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        color: AppColors.blue,
                        size: 24,
                      ),
                      SizedBox(width: 05.0),
                      Text(
                        'Add Your Address',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
