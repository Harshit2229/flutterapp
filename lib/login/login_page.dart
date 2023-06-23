import 'package:flutter/material.dart';
import 'package:flutterapp/login/sign_up.dart';
import 'package:flutterapp/login/forgot_password_page.dart';
import 'package:flutterapp/app_large_text.dart';
import 'package:flutterapp/home_screen.dart';
import 'package:flutterapp/theme/colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 90,
              width: 100,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/Logo.png', // Replace with your image path
                  width: 168,
                  height: 44,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(height: 30),
             const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Log In ',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 0.0),
            Container(height: 0.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.white,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscureText,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.white,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: _togglePasswordVisibility,
                          child: Icon(
                            _obscureText ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(AppColors.blue),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 70.0),
                      // Adjust the padding value as needed
                    ),
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 18.0),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Login ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  // Perform the action when the text is clicked
                  // For example, show a password recovery dialog or navigate to a password recovery screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                  );
                },
                child: const Text(
                   'Forgot Password?',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Container(height: 50),
            Align(
              alignment: Alignment.center,
              child: AppText(text: "Or continue with ", color: Colors.black38),
            ),
            Container(
              height: 30,
            ),
            Container(
              child: Row(
                children: [
                  const SizedBox(width: 85.0),
                  Image.asset('assets/Google.png'),
                  const SizedBox(width: 50.0),
                  Image.asset('assets/g10.png'),
                  const SizedBox(width: 50.0),
                  Image.asset('assets/white_background.png'),
                ],
              ),
            ),
            Container(
              height: 40,
            ),
            Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(text: "Are you here for the first time? ", color: Colors.black87),
                        GestureDetector(
                          onTap: () {
                            // Perform the action when the text is clicked
                            // For example, show a password recovery dialog or navigate to a password recovery screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SignupApp()),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.blue,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
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
//login_page.dart