import 'package:flutter/material.dart';
import 'package:flutterapp/home_screen.dart';

void main() => runApp(const SignupApp());

class SignupApp extends StatelessWidget {
  const SignupApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signup App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'Poppins',
          ),
          bodyText2: TextStyle(
            fontFamily: 'Poppins',
          ),
          headline6: TextStyle(
            fontFamily: 'Poppins',
          ),
          button: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              Theme.of(context).textTheme.button!.copyWith(
                fontFamily: 'Poppins',
                fontSize: 16.0,
              ),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 70.0),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ),
      ),
      home: const SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  // Handle back arrow button tap
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0,),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.blue,
                    size: 35,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Sign Up',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 30.0),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF999999),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF999999),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        // Add additional email validation if needed
                        return null;
                      },
                    ),
                    const SizedBox(height: 30.0),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Phone',
                        labelStyle: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF999999),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        // Add additional phone number validation if needed
                        return null;
                      },
                    ),
                    const SizedBox(height: 30.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF999999),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          child: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        // Add additional password validation if needed
                        return null;
                      },
                    ),
                    const SizedBox(height: 30.0),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: _obscureConfirmPassword,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: const TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF999999),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureConfirmPassword = !_obscureConfirmPassword;
                            });
                          },
                          child: Icon(
                            _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30.0),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 70.0),
                              ),
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                Theme.of(context).textTheme.button!.copyWith(fontSize: 16.0),
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Create',
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
                                // Form is valid, perform signup
                                // Handle button press
                              }
                            },
                          ),
                          const SizedBox(height: 40.0),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account? ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
