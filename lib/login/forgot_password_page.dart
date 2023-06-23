import 'package:flutter/material.dart';
import 'package:flutterapp/login/login_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 54, 16, 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  // Handle arrow button tap
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Image.asset(
                    'assets/back.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 52, 16, 50),
              child: Image.asset(
                'assets/forgot.png',

              ),
            ),
            const SizedBox(height: 14),
            const Align(
              alignment: Alignment.center,
              child:Text ("Forgot Password? ",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24.0, // Set the desired font size here
                  fontWeight: FontWeight.w500,

                ),
              ),


            ),
            Container(height: 5,),
            const Align(
              alignment: Alignment.center,
              child:Text ("Enter your registered email to",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12.0, // Set the desired font size here
                  fontWeight: FontWeight.w200,

                ),
              ),


            ),
            const Align(
              alignment: Alignment.center,
              child:Text ("recieve password reset link.",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12.0, // Set the desired font size here
                  fontWeight: FontWeight.w200,

                ),
              ),


            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 16, 12, 80),
              child: SizedBox(
                width: 222,

                height: 56,

                child: Container(

                  child: ElevatedButton(

                    onPressed: () {
                      // Handle button tap
                    },

                    style: ButtonStyle(


                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0), // Set the desired border radius here
                        ),
                      ),
                    ),
                    child:const Text ("Send ",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xffFFFFFF),
                        fontSize: 16.0, // Set the desired font size here
                        fontWeight: FontWeight.w500,

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
