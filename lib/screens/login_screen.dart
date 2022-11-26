import 'package:certificate_generator/screens/dashboard_screen.dart';
import 'package:certificate_generator/screens/forgot_password.dart';
import 'package:certificate_generator/screens/signup_screen.dart';
import 'package:certificate_generator/utils/constants.dart';
import 'package:certificate_generator/widget/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Lightorange,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              // Illustration Image
              Container(
                  height: 300,
                  child: Image.asset(
                    'assets/images/welcome.jpg',
                    fit: BoxFit.contain,
                  )),
              SizedBox(height: 10),
              // Email
              textfield(
                  controller: _email,
                  label: 'Email',
                  hint: 'Enter your email',
                  icon: Icon(Icons.email)),
              SizedBox(height: 20),
              // password
              textfield(
                  controller: _password,
                  label: 'Password',
                  hint: 'Enter your password',
                  icon: Icon(Icons.lock)),
              // Login button
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                        side: MaterialStateProperty.all(BorderSide.none)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DashBoard()));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
              // forgot password
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()));
                },
                child: Text(
                  'Forgot password ?',
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),

              // signup page
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account ? "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                    },
                    child: Text(
                      "Sign up here !",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
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
