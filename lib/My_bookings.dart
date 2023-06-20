import 'package:flutter/material.dart';

class My_bookings extends StatefulWidget {
  const My_bookings({Key? key});

  @override
  _My_bookingsState createState() => _My_bookingsState();
}

class _My_bookingsState extends State<My_bookings> {
  bool _isButton1Selected = false;
  bool _isButton2Selected = false;

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
                    color: Colors.black,
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
                  color: const Color(0xFFF1F1F1), // Use the #F1F1F1 color
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
                              color: _isButton1Selected ? Colors.blue : Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: Text(
                                'Upcoming',
                                style: TextStyle(
                                  color: _isButton1Selected ? Colors.white : Colors.black,
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
                              color: _isButton2Selected ? Colors.blue : Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: Text(
                                'Completed',
                                style: TextStyle(
                                  color: _isButton2Selected ? Colors.white : Colors.black,
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
            Container(
              width: 342.0,
              height: 158.0,
              decoration: BoxDecoration(
                color: Colors.white,
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
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.blue,
                      ),
                      child: Image.asset('assets/Washing.png'),
                    ),
                    const SizedBox(width: 16.0),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Booking Information',
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Icon(Icons.add_circle_outline, size: 20.0, color: Colors.black),
                              SizedBox(width: 4.0),
                              Text(
                                'Car',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.0),
                          Row(
                            children: [
                              Icon(Icons.fmd_good_outlined, size: 20.0, color: Colors.black),
                              SizedBox(width: 4.0),
                              Text(
                                'Map',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.0),
                          Row(
                            children: [
                              Icon(Icons.calendar_today, size: 20.0, color: Colors.black),
                              SizedBox(width: 4.0),
                              Text(
                                'Calendar',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 20.0,
                    ),
                  ],
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
