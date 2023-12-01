import 'dart:convert';
import 'package:http/http.dart' as http;
import 'my_class.dart';
class ApiRequests {
  static Future<String?> submitBookings( String userEmail, List<MyClass> selectedClasses ) async {
    final url = 'https://stuiis.cms.gre.ac.uk/COMP1424CoreWS/comp1424cw/SubmitBookings';

    // Create the JSON payload
    final jsonPayload = {
      "userId": userEmail,
      "bookingList": selectedClasses.map((selectedClass) {
        return {
          "instanceId": selectedClass.instanceId,

        };
      }).toList(),
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(jsonPayload),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        // Extract and return the message from the response
        return jsonResponse['message'];
      } else {
        // Handle errors
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      // Handle exceptions
      print('Exception: $e');
      return null;
    }
  }
}
