
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yoga_student/web_api_save_bking.dart';
import 'package:yoga_student/home.dart';

class ConfirmBookingPage extends StatelessWidget {

  final String userEmail;
  final List<Map<String, dynamic>> selectedClasses;

  ConfirmBookingPage({

    required this.userEmail,
    required this.selectedClasses,
  });
  String? errorMessage;

  Future<void> submitBookings(BuildContext context) async {
    // Call the submitBookings method from the ApiRequests class
    final String? message = await ApiRequests.submitBookings( userEmail, selectedClasses);

    if (message != null) {
      // Print the message
      print('Booking Confirmation Message: $message');

      // Navigate to the home page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(email:userEmail ),
        ),
      );
    } else {

      // show an error message to the user
      errorMessage = 'An error occurred while confirming booking.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Booking'),
        backgroundColor: const Color(0xFF0061FF),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text('Selected Classes:'),
          for (var selectedClass in selectedClasses)
            ListTile(
              title: Text('Teacher: ${selectedClass['teacher']}'),
              subtitle: Text(
                'Date: ${selectedClass['date']}\n'
                    'Class Day: ${selectedClass['classDay']}\n'
                    'Class Time: ${selectedClass['classTime']}',
              ),
            ),
          SizedBox(height: 16.0), // Add some spacing
          ElevatedButton(
            onPressed: () {
              //  logic for confirming booking and submitting HTTP request
              submitBookings(context);
            },
            child: Text('Yes, Confirm'),
          ),
          if (errorMessage != null)
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }
}

