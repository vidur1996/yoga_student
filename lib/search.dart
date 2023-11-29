import 'package:flutter/material.dart';
import 'package:yoga_student/web_api_get_list.dart';
import 'package:yoga_student/confirm_booking.dart';

class SearchResultsPage extends StatefulWidget {
  final String userEmail;

  SearchResultsPage({Key? key, required this.userEmail}) : super(key: key);

  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  late Future<List<MyClass>> classInstancesData;

  List<MyClass> classInstances = [];
  List<bool> selectedItems = [];

  @override
  void initState() {
    super.initState();
    classInstancesData = ApiService.fetchData();

    // Initialize selectedItems
    classInstancesData.then((data) {
      classInstances = data;
      selectedItems = List.generate(classInstances.length, (index) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
        backgroundColor: const Color(0xFF0061FF),
      ),
      body: FutureBuilder<List<MyClass>>(
        future: classInstancesData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            classInstances = snapshot.data!;
            selectedItems = List.generate(classInstances.length, (index) => false);

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: classInstances.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Teacher: ${classInstances[index].teacher}'),
                    subtitle: Text(
                      'Date: ${classInstances[index].date}\n'
                          'Class Day: ${classInstances[index].classDay}\n'
                          'Class Time: ${classInstances[index].classTime}',
                    ),
                    trailing: Checkbox(
                      value: selectedItems[index],
                      onChanged: (value) {
                        setState(() {
                          selectedItems[index] = value!;
                        });
                      },
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  logic for booking classes
          List<MyClass> selectedClasses = [];
          for (int i = 0; i < selectedItems.length; i++) {
            if (selectedItems[i]) {
              selectedClasses.add(classInstances[i]);
            }
          }
          print('Selected classes: $selectedClasses');
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
