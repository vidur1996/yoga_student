// home_page.dart
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  final String email;

  const HomePage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: const Color(0xFF0061FF),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello, $email!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for "Search Classes" button
                  print('Search Classes button pressed');
                },
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Search Classes'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for "Confirm Class Booking" button
                  print('Confirm Class Booking button pressed');
                },
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Confirm Class Booking'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
