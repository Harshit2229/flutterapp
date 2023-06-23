import 'package:flutter/material.dart';
import 'package:flutterapp/my_bookings.dart';
import 'package:flutterapp/login/sign_up.dart';
import 'package:flutterapp/theme/colors.dart';

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final List<String> textFieldText = [
    'Mon 1', // Monday 1
    'Tue 2', // Tuesday 2
    'Wed 3', // Wednesday 3
    'Thu 4', // Thursday 4
    'Fri 5', // Friday 5
    'Sat 6', // Saturday 6
    'Sun 7', // Sunday 7
    'Mon 8',
    'Tue 9',
    'Wed 10',
    'Thu 11',
    'Fri 12',
    'Sat 13',
    'Sun 14',
    'Mon 15',
    'Tue 16',
    'Wed 17',
    'Thu 18',
    'Fri 19',
    'Sat 20',
    'Sun 21',
    'Mon 22',
    'Tue 23',
    'Wed 24',
    'Thu 25',
    'Fri 26',
    'Sat 27',
    'Sun 28',
    'Mon 29',
    'Tue 30',
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
                    color: AppColors.blue,
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
                      color: AppColors.grey,
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
                      color: AppColors.black,
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
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: buttonStates[i] ? Colors.blue : const Color(0xffF1F1F1),
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
                              fontSize: 10,
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
              color: AppColors.grey,
            ),
            Container(height: 15),
            Container(
              margin: const EdgeInsets.only(left: 13),
              child: const Text(
                "Select Time",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
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
                                      color: buttonStates[i * 3 + j] ? const Color(0xff277FC1) : const Color(0xff277FC1),
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
                                  side: const BorderSide(
                                    color: AppColors.blue,
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
                    color: AppColors.grey,
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
                            color: AppColors.blue,
                            border: Border.all(
                              color: AppColors.white,
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
                                color: AppColors.white,
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
