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
            Padding(
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
              width: 300.0,
              height: 48.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
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
                        child: Container(
                          width: 100.0, // Adjust the width as desired
                          height: 32.0, // Adjust the height as desired
                          decoration: BoxDecoration(
                            color: _isButton1Selected ? Colors.blue : Colors.transparent,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text(
                              'Button 1',
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

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isButton1Selected = false;
                            _isButton2Selected = !_isButton2Selected;
                          });
                        },
                        child: Container(
                          width: 100.0, // Adjust the width as desired
                          height: 32.0,
                          decoration: BoxDecoration(
                            color: _isButton2Selected ? Colors.blue : Colors.transparent,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text(
                              'Button 2',
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
