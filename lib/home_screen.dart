import 'package:flutter/material.dart';
import 'package:flutterapp/theme/colors.dart';
import 'package:flutterapp/wash_my_car.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.white, // Set the background color here
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 20.0),
                child: Image.asset(
                  'assets/Logo.png',
                  width: 162.77,
                  height: 39.75,
                ),
              ),
              ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  AppColors.white, // Set the desired color here
                  BlendMode.modulate,
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    'assets/Rectangle.png',
                    width: 390,
                    height: 390,
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 18.0, horizontal: 120.0),
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16.0),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Wash My Car',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(
                  builder: (context) =>  WashMyCar(),
                   ));
                },
              ),
              const SizedBox(height: 80.0),
              BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/Frame.png',
                      width: 30,
                      height: 30,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/book.png',
                      width: 50,
                      height: 50,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/profile.png',
                      width: 30,
                      height: 30,
                    ),
                    label: '',
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
