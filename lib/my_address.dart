import 'package:flutter/material.dart';
import 'package:flutterapp/appointment.dart';
import 'package:flutterapp/theme/colors.dart';

class  MyAddress extends StatefulWidget {
  const MyAddress({super.key});

  @override
  _MyAddressState createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  bool isCheckboxSelected = false;
  bool isDeleteIconVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrollable Row of Boxes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 35, left: 10),
                  child: const Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Icons.arrow_back,
                          size: 32,
                          color: AppColors.blue,
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
                const Positioned(
                  top: 35,
                  child: Text(
                    'My Address',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35, right: 10),
                    child: Visibility(
                      visible: isDeleteIconVisible,
                      child: const Icon(
                        Icons.delete,
                        color: Color(0xffEA4335),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ScrollableRowOfBoxes(
                onCheckboxSelected: (isSelected) {
                  setState(() {
                    isCheckboxSelected = isSelected;
                    isDeleteIconVisible = isCheckboxSelected;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(),
            ), // Added expanded container to push the save button to the bottom
            Container(
              height: 1,
              color: Colors.grey.withOpacity(0.4), // Gray color line
            ),
            Container(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, right: 16),
              child: Align(
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
                        Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) =>  AppointmentPage(),
                            ));
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
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollableRowOfBoxes extends StatelessWidget {
  final Function(bool isSelected) onCheckboxSelected;

  ScrollableRowOfBoxes({super.key, required this.onCheckboxSelected});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        BoxItem(
          image: 'assets/Map_icon.png',
          text: 'Image 1',
          width: 350,
          height: 80,
          onCheckboxSelected: onCheckboxSelected,
        ),
        const SizedBox(height: 10),
        BoxItem(
          image: 'assets/Map_icon.png',
          text: 'Image 2',
          width: 350,
          height: 80,
          onCheckboxSelected: onCheckboxSelected,
        ),
      ],
    );
  }
}

class BoxItem extends StatefulWidget {
  final String image;
  final String text;
  final double width;
  final double height;
  final Function(bool isSelected) onCheckboxSelected;

  const BoxItem({super.key,
    required this.image,
    required this.text,
    required this.width,
    required this.height,
    required this.onCheckboxSelected,
  });

  @override
  _BoxItemState createState() => _BoxItemState();
}

class _BoxItemState extends State<BoxItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          widget.onCheckboxSelected(isChecked);
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.grey,
          border: Border.all(
            color: AppColors.lightGrey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                isChecked ? Icons.check_box : Icons.check_box_outline_blank,
                color: AppColors.blue,
                size: 24,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Image.asset(
              widget.image,
              width: 80,
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
