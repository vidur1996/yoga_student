import 'package:flutter/material.dart';
import 'package:yoga_student/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  final RegExp emailRegExp =
  RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  bool isEmailValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: const Color(0xFF0061FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image above TextField
            Image.asset(
              'assets/images/yoga.png',
              height: 100,
              width: 100,
            ),
            SizedBox(height: 20),
            // TextField below Image
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: isEmailValid ? null : 'Enter a valid email',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validate the email before proceeding
                if (emailRegExp.hasMatch(emailController.text)) {
                  setState(() {
                    isEmailValid = true;
                  });

                  // Navigate to the HomePage and pass the email
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(email: emailController.text),
                    ),
                  );
                } else {
                  setState(() {
                    isEmailValid = false;
                  });
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
