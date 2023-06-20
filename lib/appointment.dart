import 'package:flutter/material.dart';
import 'package:flutterapp/My_bookings.dart';
import 'package:flutterapp/Sign_Up.dart';

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final List<String> textFieldText = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30 ',
  ];
  final List<String> textFieldTexts = [
    '08:00 AM',
    '09:00 AM',
    '10:30 AM',
    '12:00 PM',
    '01:30 PM',
    '03:00 PM',
    '04:30 PM',
    '06:00 PM',
    '07:30 PM',
    '08:30 AM',
    '09:30 AM',
    '11:00 AM',
    '12:30 PM',
    '02:00 PM',
    '03:30 PM',
    '05:00 PM',
    '06:30 PM',
    '08:00 PM',
    '09:00 AM',
    '10:00 AM',
    '01:00 AM',
    '02:30 PM',
    '04:00 PM',
    '05:30 PM',
    '07:00 PM',
  ];
  final List<String> textScroll = [
    '07:30 PM',
    '08:00 PM',
  ];

  List<bool> buttonStates = List<bool>.filled(30, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 3.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xff277FC1),
                    size: 35,
                  ),
                  onPressed: () {
                    // Handle back button press
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                "Appointment Date",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 14),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 20, 0),
                  child: Text(
                    "Select Date",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                      color: Color(0xff999999),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text(
                    "Sep",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < textFieldText.length; i++)
                      Container(
                        margin: const EdgeInsets.only(left: 13),
                        width: 39,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: buttonStates[i] ? Colors.blue : Color(0xffF1F1F1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              buttonStates[i] = !buttonStates[i];
                            });
                          },
                          child: Text(
                            textFieldText[i],
                            style: TextStyle(
                              color: buttonStates[i] ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Container(height: 20),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            Container(height: 15),
            Container(
              margin: const EdgeInsets.only(left: 13),
              child: const Text(
                "Select Time",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  color: Color(0xff999999),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (int i = 0; i < 8; i++)
                    Row(
                      children: [
                        for (int j = 0; j < 3; j++)
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(4.0),
                              width: 100,
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: buttonStates[i * 3 + j] ? Colors.blue : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13),
                                    side: BorderSide(
                                      color: buttonStates[i * 3 + j] ? Color(0xff277FC1) : Color(0xff277FC1),
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    buttonStates[i * 3 + j] = !buttonStates[i * 3 + j];
                                  });
                                },
                                child: Text(
                                  textFieldTexts[i * 3 + j],
                                  style: TextStyle(
                                    color: buttonStates[i * 3 + j] ? Colors.white : Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  Row(
                    children: [
                      for (int j = 0; j < 2; j++)
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(3.0),
                            width: 100,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: buttonStates[24 + j] ? Colors.blue : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  side: BorderSide(
                                    color:  Color(0xff277FC1)
                                  ),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  buttonStates[24 + j] = !buttonStates[24 + j];
                                });
                              },
                              child: Text(
                                textScroll[j],
                                style: TextStyle(
                                  color: buttonStates[24 + j] ? Colors.white : Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(height: 20),
                  Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: SizedBox(
                        width: 160.0,
                        height: 45.0,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.blue,
                            border: Border.all(
                              color: const Color(0xFFFEFEFF),
                              width: 2.0,
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const My_bookings(),
                                ),
                              );
                            },
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
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
          ],
        ),
      ),
    );
  }
}
