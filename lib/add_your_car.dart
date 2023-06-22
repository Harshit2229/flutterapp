import 'package:flutter/material.dart';
import 'package:flutterapp/wash_my_car.dart';

import 'add_vehicle.dart';

class Garage1 extends StatelessWidget {
  const Garage1({Key? key});

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
                  onTap: () { Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => const WashMyCar(),
                      ));
                    // Handle icon button press
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.blue,
                    size: 35,
                  ),
                ),
                const SizedBox(width: 70.0),
                const Text(
                  'My Garage',
                  style: TextStyle(
                    color: Colors.black,
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
                  'assets/Garage.png',
                  width: 300,
                  height: 300,
                ),
                const SizedBox(height: 40.0),
                const Text(
                  'There is no car in your garage',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 05.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => AddVehiclePage(),
                        ));
                    // Handle add car button press
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        color: Colors.blue,
                        size: 24,
                      ),
                      SizedBox(height: 05.0),
                      Text(
                        '  Add Your Car',
                        style: TextStyle(
                          color: Colors.blue,
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
