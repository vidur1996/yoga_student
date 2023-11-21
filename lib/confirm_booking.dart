
import 'package:flutter/material.dart';

class ConfirmBookingPage extends StatelessWidget {
  final String userEmail;
  final List<Map<String, dynamic>> selectedClasses;

  ConfirmBookingPage({required this.userEmail, required this.selectedClasses});

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
              // Handle the logic for confirming booking
              // You can add your booking confirmation logic here
              print('Booking confirmed for classes: $selectedClasses');
              Navigator.pop(context); // Close the ConfirmBookingPage
            },
            child: Text('Yes, Confirm'),
          ),
        ],
      ),
    );
  }
}
