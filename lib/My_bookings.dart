import 'package:flutter/material.dart';
import 'package:flutterapp/theme/colors.dart';

class My_bookings extends StatefulWidget {
  const My_bookings({Key? key});

  @override
  _My_bookingsState createState() => _My_bookingsState();
}

class _My_bookingsState extends State<My_bookings> {
  bool _isButton1Selected = false;
  bool _isButton2Selected = false;

  @override
  Widget _buildBookingDetails() {
    if (_isButton1Selected) {
      return Container(
        width: 342.0,
        height: 158.0,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2.0,
              blurRadius: 5.0,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 126.0,
                height: 171.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.blue,
                ),
                child: Image.asset('assets/Washing.png'),
              ),
              const SizedBox(width: 16.0),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(Icons.car_crash, size: 20.0, color: AppColors.blue),
                        SizedBox(width: 6.0),
                        Text(
                          'Tesla Model S',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 20.0, color: AppColors.blue),
                        SizedBox(width: 6.0),
                        Text(
                          'Home',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 20.0, color: AppColors.blue),
                        SizedBox(width: 6.0),
                        Text(
                          '06-Sep-2022',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(Icons.watch_later_outlined, size: 20.0, color: AppColors.grey),
                        SizedBox(width: 6.0),
                        Text(
                          '1PM - 2PM',
                          style: TextStyle(fontSize: 16.0, color: AppColors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else if (_isButton2Selected) {
      return Container(
        width: 342.0,
        height: 158.0,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.3),
              spreadRadius: 2.0,
              blurRadius: 5.0,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 126.0,
                height: 171.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.white,
                ),
                child: Image.asset('assets/Washing.png'),
              ),
              const SizedBox(width: 16.0),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(Icons.car_crash, size: 20.0, color: AppColors.blue),
                        SizedBox(width: 6.0),
                        Text(
                          'Lamborghini Urus',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 20.0, color: AppColors.blue),
                        SizedBox(width: 6.0),
                        Text(
                          'Home',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 20.0, color: AppColors.blue),
                        SizedBox(width: 6.0),
                        Text(
                          '02-Sep-2022',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(Icons.watch_later_outlined, size: 20.0, color: AppColors.blue),
                        SizedBox(width: 6.0),
                        Text(
                          '2PM - 3PM',
                          style: TextStyle(fontSize: 16.0, color: AppColors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      // Default case, when neither button is selected
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(30.0, 100.0, 20.0, 20.0),
              child: Center(
                child: Text(
                  'My Bookings',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 342.0,
              height: 48.0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white, // Use the #F1F1F1 color
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isButton1Selected = !_isButton1Selected;
                            _isButton2Selected = false;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            width: 164.0,
                            height: 32.0,
                            decoration: BoxDecoration(
                              color: _isButton1Selected ? AppColors.blue : Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: Text(
                                'Upcoming',
                                style: TextStyle(
                                  color: _isButton1Selected ? AppColors.white : AppColors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isButton1Selected = false;
                            _isButton2Selected = !_isButton2Selected;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            width: 164.0,
                            height: 32.0,
                            decoration: BoxDecoration(
                              color: _isButton2Selected ? AppColors.blue : Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: Text(
                                'Completed',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: _isButton2Selected ? AppColors.white : AppColors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
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
            ),
            const SizedBox(height: 30.0),
            _buildBookingDetails(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.white,
        child: Container(
          height: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 50.0, // Add a fixed height
                    child: IconButton(
                      icon: const Icon(Icons.home, color: AppColors.grey),
                      onPressed: () {},
                    ),
                  ),
                  const Text(
                    'Home',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 50.0, // Add a fixed height
                    child: IconButton(
                      icon: const Icon(Icons.bookmark, color: AppColors.grey),
                      onPressed: () {},
                    ),
                  ),
                  const Text(
                    'Bookings',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 50.0, // Add a fixed height
                    child: IconButton(
                      icon: const Icon(Icons.person, color: AppColors.grey),
                      onPressed: () {},
                    ),
                  ),
                  const Text(
                    'Profile',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  void main() {
  runApp(const MaterialApp(
    home: My_bookings(),
  ));
}
