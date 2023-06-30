import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/cars/my_garage.dart';
import 'package:flutterapp/theme/colors.dart';
import 'package:flutterapp/utils.dart';
import 'add_your_car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


void main() {
  runApp(const AddVehiclePage());
}

class AddVehiclePage extends StatelessWidget {
  const AddVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrollable Row of Boxes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScrollableRowOfBoxes(),
    );
  }
}

class ScrollableRowOfBoxes extends StatefulWidget {
  const ScrollableRowOfBoxes({super.key});

  @override
  _ScrollableRowOfBoxesState createState() => _ScrollableRowOfBoxesState();
}

class _ScrollableRowOfBoxesState extends State<ScrollableRowOfBoxes> {
  String vehicleName = '';
  String vehicleColor = '';

  bool isSaveButtonEnabled() {
    return vehicleName.isNotEmpty && vehicleColor.isNotEmpty;
  }

  bool isSaveButtonFilled() {
    return isSaveButtonEnabled();
  }
  final vehicleNameController =TextEditingController();
  final colorController =TextEditingController();
   bool loading = false;
   final databaseRef = FirebaseDatabase.instance.ref('Vehicle');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 70, left: 10),
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.blue,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Garage1(),
                      ));
                  // Add your onPressed logic here
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Add Vehicle',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Select your vehicle type',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BoxItem(
                      image: 'assets/Sedan.png',
                      text: 'Sedan',
                    ),
                    SizedBox(width: 10),
                    BoxItem(
                      image: 'assets/SUV.png',
                      text: 'SUV',
                    ),
                    SizedBox(width: 10),
                    BoxItem(
                      image: 'assets/Hatchback.png',
                      text: 'Hatchback',
                    ),
                    SizedBox(width: 10),
                    BoxItem(
                      image: 'assets/Pickup.png',
                      text: 'Pickup',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: vehicleNameController,
                decoration: const InputDecoration(
                  labelText: 'Vehicle Name',
                  labelStyle: TextStyle( fontFamily: 'Poppins',
                    color: AppColors.grey,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                ),
                onChanged: (value) {
                  setState(() {
                    vehicleName = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: colorController,
                decoration: const InputDecoration(
                  labelText: 'Color',
                  labelStyle: TextStyle( fontFamily: 'Poppins',
                    color: AppColors.grey,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                ),
                onChanged: (value) {
                  setState(() {
                    vehicleColor = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 190),
            Container(
              height: 1,
              color: AppColors.grey,
            ),
            const SizedBox(height: 20),
             Container(
                padding: const EdgeInsets.only(left: 20, right: 20,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (isSaveButtonFilled()) {
                              return AppColors.blue; // Filled button color
                            }
                            return Colors.transparent; // Transparent button color
                          },
                        ),
                        foregroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (isSaveButtonFilled()) {
                              return AppColors.white; // Filled button text color
                            }
                            return AppColors.blue; // Outline button text color
                          },
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: const BorderSide(
                              color: AppColors.blue, // Outline button border color
                              width: 2.0, // Outline button border width
                            ),
                          ),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
                        ),
                      ),
                      onPressed: isSaveButtonEnabled()
                          ? () {
                        loading:loading;
                        setState(() {
                          loading=true;
                        });
                        databaseRef.child(DateTime.now().microsecondsSinceEpoch.toString())
                            .set({
                          'id' :DateTime.now().microsecondsSinceEpoch.toString(),
                          'vehicle name' : vehicleNameController.text.toString(),
                          'color' : colorController.text.toString(),
                        })
                            .then((value){
                          Utils().toastMessage('Vehicle added');
                          setState(() {
                            loading=false;
                          });
                        }).onError((error, stackTrace){
                          Utils().toastMessage(error.toString());
                          setState(() {
                            loading=false;
                          });
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Garage(),
                          ));
                        // Form is valid, perform save operation
                      }
                          : null, // Disable the button if text fields are empty
                      child: const Text('Save',
                      style:TextStyle(fontFamily: 'Poppins',)
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class BoxItem extends StatefulWidget {
  final String image;
  final String text;

  const BoxItem({super.key,
    required this.image,
    required this.text,
  });

  @override
  _BoxItemState createState() => _BoxItemState();
}

class _BoxItemState extends State<BoxItem> {
  bool isTouched = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          isTouched = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          isTouched = false;
        });
      },
      child: Opacity(
        opacity: isTouched ? 0.5 : 1.0,
        child: Container(
          width: 150,
          height: 150,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                widget.image,
                width: 80,
                height: 80,
              ),
              const SizedBox(height: 10),
              Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
