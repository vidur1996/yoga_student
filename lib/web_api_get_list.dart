import 'dart:convert';
import 'package:http/http.dart' as http;

class MyClass {
  final int instanceId;
  final String date;
  final String teacher;
  final String classDay;
  final String classTime;

  MyClass({
    required this.instanceId,
    required this.date,
    required this.teacher,
    required this.classDay,
    required this.classTime,
  });

  factory MyClass.fromJson(Map<String, dynamic> json) {
    return MyClass(
      instanceId: json['instanceId'],
      date: json['date'],
      teacher: json['teacher'],
      classDay: json['classDay'],
      classTime: json['classTime'],
    );
  }
}

class ApiService {
  static Future<List<MyClass>> fetchData() async {
    final url = 'https://stuiis.cms.gre.ac.uk/COMP1424CoreWS/comp1424cw/GetInstances?userid=vtzzay';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<MyClass> myClassList = (json.decode(response.body) as List)
            .map((item) => MyClass.fromJson(item))
            .toList();

        return myClassList;
      } else {
        // Handle errors
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      // Handle exceptions
      throw Exception('Exception: $e');
    }
  }
}
