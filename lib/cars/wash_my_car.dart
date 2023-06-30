import 'package:flutter/material.dart';
import 'package:flutterapp/add_package.dart';
import 'package:flutterapp/cars/add_vehicle.dart';
import 'package:flutterapp/cars/rdb.dart';
import 'package:flutterapp/home_screen.dart';
import 'package:flutterapp/map_address.dart';
import 'package:flutterapp/theme/colors.dart';
import 'my_garage.dart';

class WashMyCar extends StatefulWidget {
  const WashMyCar({super.key});

  @override
  _WashMyCarState createState() => _WashMyCarState();
}

class _WashMyCarState extends State<WashMyCar> {
  void _navigateToNextPage(BuildContext context) {
    //Navigator.push(
    //context,
    //MaterialPageRoute(builder: (context) => Garage1()),
    //);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Rest of the build method code...
      // That's it! Now the WashMyCar page is a StatefulWidget, and when the "Next" button is pressed, it will navigate to the Garage1 page.

      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) =>  const HomePage(),
                        )); // Navigate back to the previous screen
                  },
                  child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8.0),
                          child: const Icon(Icons.arrow_back,color: AppColors.blue,size: 34,)
                      ),
                      const Padding(padding: EdgeInsets.all(32.0)),
                      const Text(
                        'Wash My Car',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xff2A2D37),
                          wordSpacing: 0.3,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Location",
                  style: TextStyle(fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: AppColors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: SizedBox(
                    width: 342,
                    height: 48,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapAddress(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.transparent,
                        ),
                        padding: MaterialStateProperty.resolveWith(
                              (states) => EdgeInsets.zero,
                        ),
                        alignment: Alignment.center,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: MaterialStateProperty.all(Size.zero),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Select Your Location',
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),


                const SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.zero,
                  child: Container(
                    height: 1.0,
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  width: double.infinity, // Full width
                  height: 220.0, // Adjust the height as needed
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: AppColors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15.0),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Vehicle',
                          style: TextStyle(fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: AppColors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: SizedBox(
                          width: 310,
                          height: 56,
                          child: TextButton(
                            onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AddVehiclePage(),
                                  ),
                                );// Handle button tap
                            },
                            style: ButtonStyle(
                              overlayColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.transparent,
                              ),
                              padding: MaterialStateProperty.resolveWith(
                                    (states) => EdgeInsets.zero,
                              ),
                              minimumSize: MaterialStateProperty.all(Size.zero),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Select Your Vehicle',
                                      style: TextStyle(
                                        color: AppColors.grey,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios_rounded,
                                    color: AppColors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20.0),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Package & Add Ones ',
                          style: TextStyle(fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: AppColors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: SizedBox(
                          width: 310,
                          height: 56,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  PackagePage(),
                              ),
                            );// Handle button tap
                          },
                          style: ButtonStyle(
                            overlayColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.transparent,
                            ),
                            padding: MaterialStateProperty.resolveWith(
                                  (states) => EdgeInsets.zero,
                            ),
                            minimumSize: MaterialStateProperty.all(Size.zero),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Select Your Package',
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios_rounded,
                                color: AppColors.grey,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const PostScreen(),
                      ),
                    );
                  },

                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        color: AppColors.blue,


                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'Add Another Vehicle (Max 4) ',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 210,),
                Container(
                  height: 1,
                  color: Colors.grey.withOpacity(0.4), // Gray color line
                ),
                const SizedBox(height: 13.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 160.0, // Set desired width for the button
                    height: 55.0, // Set desired height for the button
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15.0),
                        color: AppColors.white,
                        border: Border.all(
                          color: AppColors.blue, // Replace "Colors.blue" with your desired border color
                          width: 2.0, // Set desired border width
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Garage()),
                          );
                          // Add signup logic here
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            color: AppColors.blue,
                            fontFamily: 'Poppins',
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
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
//wash my car