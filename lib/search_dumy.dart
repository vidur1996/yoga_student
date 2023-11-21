import 'package:flutter/material.dart';
import 'package:yoga_student/confirm_booking.dart';
class SearchResultsPage extends StatefulWidget {
  final String userEmail;

  SearchResultsPage({Key? key, required this.userEmail}) : super(key: key);

  // Method to fetch or generate class instances data
  List<Map<String, dynamic>> getClassInstancesData() {
    return [
      {"instanceId": 1, "date": "05/12/2023", "teacher": "vidu", "classDay": "Tuesday", "classTime": "15:00"},
      {"instanceId": 2, "date": "12/12/2023", "teacher": "zeeshan", "classDay": "Tuesday", "classTime": "15:00"},
      {"instanceId": 3, "date": "09/12/2023", "teacher": "ali", "classDay": "Tuesday", "classTime": "12:00"},
      {"instanceId": 4, "date": "16/12/2023", "teacher": "yaseer", "classDay": "Tuesday", "classTime": "12:00"},
    ];
  }

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  List<Map<String, dynamic>> classInstances = [];

  List<bool> selectedItems = [];

  @override
  void initState() {
    super.initState();
    classInstances = widget.getClassInstancesData();
    selectedItems = List.generate(classInstances.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
        backgroundColor: const Color(0xFF0061FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: classInstances.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Teacher: ${classInstances[index]['teacher']}'),
              subtitle: Text(
                'Date: ${classInstances[index]['date']}\n'
                    'Class Day: ${classInstances[index]['classDay']}\n'
                    'Class Time: ${classInstances[index]['classTime']}',
              ),
              trailing: Checkbox(
                value: selectedItems[index],
                onChanged: (value) {
                  setState(() {
                    selectedItems[index] = value!;
                  });
                },
              ),
              // Add additional information as needed
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the logic for booking classes using selectedItems
          List<Map<String, dynamic>> selectedClasses = [];
          for (int i = 0; i < selectedItems.length; i++) {
            if (selectedItems[i]) {
              selectedClasses.add(classInstances[i]);
            }
          }
          print('Selected classes: $selectedClasses');
          // Navigate to ConfirmBookingPage with selected data
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ConfirmBookingPage(
                userEmail: widget.userEmail,
                selectedClasses: selectedClasses,
              ),
            ),
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}