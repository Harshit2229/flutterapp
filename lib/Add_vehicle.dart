import 'package:flutter/material.dart';
import 'package:flutterapp/My_bookings.dart';


void main() {
  runApp(AddVehiclePage());
}

class AddVehiclePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrollable Row of Boxes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScrollableRowOfBoxes(),
    );
  }
}

class ScrollableRowOfBoxes extends StatefulWidget {
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
                  color: Colors.blue,
                  size: 35,
                ),
                onPressed: () {
                  // Add your onPressed logic here
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Choose a vehicle type',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
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
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
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
                decoration: const InputDecoration(
                  labelText: 'Vehicle Name',
                  labelStyle: TextStyle(
                    color: Color(0xFF999999),
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
                decoration: const InputDecoration(
                  labelText: 'Color',
                  labelStyle: TextStyle(
                    color: Color(0xFF999999),
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
            const SizedBox(height: 200),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (isSaveButtonFilled()) {
                            return Colors.blue; // Filled button color
                          }
                          return Colors.transparent; // Transparent button color
                        },
                      ),
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (isSaveButtonFilled()) {
                            return Colors.white; // Filled button text color
                          }
                          return Colors.blue; // Outline button text color
                        },
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: const BorderSide(
                            color: Colors.blue, // Outline button border color
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => My_bookings(),
                        ));
                      // Form is valid, perform save operation
                    }
                        : null, // Disable the button if text fields are empty
                    child: const Text('Save'),
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

  const BoxItem({
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
            color: Colors.white,
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
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
