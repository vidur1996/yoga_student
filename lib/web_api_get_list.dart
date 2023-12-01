import 'dart:convert';
import 'package:http/http.dart' as http;
import 'my_class.dart';



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
