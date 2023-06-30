import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/cars/my_garage.dart';
import 'package:flutterapp/login/login_page.dart';
import 'package:flutterapp/my_address.dart';
import 'package:flutterapp/theme/colors.dart';
import 'package:flutterapp/utils.dart';

import 'home_screen.dart';

class AddingAddress extends StatefulWidget {
  @override
  _AddingAddressState createState() => _AddingAddressState();
}

class _AddingAddressState extends State<AddingAddress> {
  String address = '';
  String landMark = '';
  String geolocation = '';

  bool isSaveButtonEnabled() {
    return address.isNotEmpty && landMark.isNotEmpty && geolocation.isNotEmpty;
  }

  bool isSaveButtonFilled() {
    return isSaveButtonEnabled();
  }

  bool _showOthersTextField = false; // Track the visibility of the text field
  final TextEditingController _othersController = TextEditingController();
  final addressController =TextEditingController();
  final landMarkController =TextEditingController();
  final geoLocationController =TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Address');

  @override
  void dispose() {
    _othersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 44, 16, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    ); // Handle arrow button tap
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: const Icon(Icons.arrow_back, size: 32, color: AppColors.blue),
                  ),
                ),
              ),
              Container(height: 15),
              const Text(
                "Add Address",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24.0,
                ),
              ),
              Container(height: 30),
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.lG,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                ),
                onChanged: (value) {
                  setState(() {
                    address = value;
                  });
                },
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: landMarkController,
                decoration: const InputDecoration(
                  labelText: 'Land Mark',
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.lG,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                ),
                onChanged: (value) {
                  setState(() {
                    landMark = value;
                  });
                },
              ),
              const SizedBox(height: 30.0),
              TextFormField(
                controller: geoLocationController,
                decoration: const InputDecoration(
                  labelText: 'Geolocation',
                  suffixIcon: Icon(Icons.location_on_outlined),
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.lG,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                ),
                onChanged: (value) {
                  setState(() {
                    geolocation = value;
                  });
                },
              ),
              const SizedBox(height: 15.0),
              const Text(
                'Save As',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 0.0),
              SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildRectangularBox(
                      AppColors.lG,
                      Icons.other_houses,
                      'Home',
                    ), // First box
                    _buildRectangularBox(
                      AppColors.lG,
                      Icons.work,
                      'Work',
                    ), // Second box
                    _buildRectangularBox(
                      AppColors.lG,
                      Icons.location_on_outlined,
                      'Others',
                    ), // Third box
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              Visibility(
                visible: _showOthersTextField,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
              ),
              const SizedBox(height: 190),
              Container(
                height: 1,
                color: AppColors.grey,
              ),
              const SizedBox(height: 20.0),
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
                          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 50.0),
                        ),
                      ),
                      onPressed: isSaveButtonEnabled()
                          ? () {
                        databaseRef.child(DateTime.now().microsecondsSinceEpoch.toString())
                            .set({
                          'Address' : addressController.text.toString(),
                          'Land Mark' : landMarkController.text.toString(),
                          'Geolocation' : geoLocationController.text.toString(),
                        }).then((value){
                          Utils().toastMessage('Address added');
                        }).onError((error, stackTrace){
                          Utils().toastMessage(error.toString());
                        }) as String;
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  const HomePage(),
                            ));
                        // Form is valid, perform save operation
                      }
                          : null, // Disable the button if text fields are empty
                      child: const Text(
                        'Save',
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRectangularBox(Color color, IconData icon, String text) {
    bool isSelected = false;
    return GestureDetector(
      onTap: () {
        if (text == 'Others') {
          setState(() {
            isSelected = !isSelected;
            _showOthersTextField = !_showOthersTextField; // Toggle visibility
            if (!_showOthersTextField) {
              isSelected = !isSelected;
              _othersController.clear(); // Clear the text field
            }
          });
        }
      },
      child: Container(
        height: 40,
        width: 101.0,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.blue : color,
          borderRadius: BorderRadius.circular(17.0),
          boxShadow: const [
            BoxShadow(
              color: AppColors.white,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 22.0,
              color: AppColors.black,
            ),
            const SizedBox(width: 9.0),
            Text(
              text,
              style: const TextStyle(
                color: Color(0xff2A2D37),
                fontSize: 12.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
