import 'package:flutter/material.dart';
import 'package:yoga_student/confirm_booking.dart';
class SearchResultsPage extends StatefulWidget {
  final String userEmail;

  SearchResultsPage({Key? key, required this.userEmail}) : super(key: key);

  // Method to fetch or generate class instances data
  List<Map<String, dynamic>> getClassInstancesData() {
    return [{"instanceId":1411,"date":"04/12/2023","teacher":"roy","classDay":"Monday","classTime":"02:30 PM"},
            {"instanceId":1412,"date":"11/12/2023","teacher":"anna","classDay":"Monday","classTime":"02:30 PM"},
            {"instanceId":1413,"date":"18/12/2023","teacher":"mason","classDay":"Monday","classTime":"02:30 PM"},
            {"instanceId":1414,"date":"29/12/2023","teacher":"sam","classDay":"Friday","classTime":"10:30 PM"}];
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