import 'package:flutter/material.dart';
import 'package:flutterapp/theme/colors.dart';
import 'package:flutterapp/cars/wash_my_car.dart';
import 'package:flutterapp/widgets/bottom_navigation_bar.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Add the _selectedIndex variable here

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.white,
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
              const SizedBox(height: 10.0,),
              ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
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
              const SizedBox(height: 40.0),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WashMyCar()),
                  );
                },
              ),
              const SizedBox(height: 80.0),
              CustomBottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                    icon: RawMaterialButton(
                      onPressed: () {},
                      child: Image.asset(
                        'assets/icons/home.ico',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: RawMaterialButton(
                      onPressed: () {},
                      child:Image.asset(
                        'assets/icons/booking.ico',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: RawMaterialButton(
                      onPressed: () {},
                      child: Image.asset(
                        'assets/icons/user.ico',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    label: 'Profile',
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
