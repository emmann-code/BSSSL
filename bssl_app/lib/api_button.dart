// // ignore_for_file: prefer_const_constructors
//
// import 'dart:convert'; // for jsonEncode and jsonDecode
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class MyButton extends StatefulWidget {
//   const MyButton({super.key});
//
//   @override
//   State<MyButton> createState() => _MyButtonState();
// }
//
// class _MyButtonState extends State<MyButton> {
//
//   // Authenticate and get the Bearer token
//   Future<String> authenticate() async {
//     final url = Uri.https('bsslapidemo.dcontroller.com', '/api/Account/Logindetails');
//
//     // JSON payload as per the API documentation
//     final body = jsonEncode({
//       "userCode": "Admin",
//       "subsystem": "your_subsystem",
//       "loginModule": "your_login_module",
//       "loginYear": "your_login_year",
//       "areaOffice": "your_area_office",
//       "systemName": "your_system_name",
//       "systemtype": "your_system_type",
//       "systemOs": "your_system_os",
//       "locationState": "your_location_state",
//       "locationAddress": "your_location_address",
//       "locationCountry": "your_location_country",
//       "password": "BSSL@TRAINING"
//     });
//
//     // Send POST request to authenticate
//     final response = await http.post(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: body,
//     );
//
//     // Print the entire response for debugging
//     print('Authentication Response: ${response.body}');
//     print('Status Code: ${response.statusCode}');
//
//     // Check if the authentication is successful
//     if (response.statusCode == 200) {
//       // Extract the bearer token from the response
//       final data = jsonDecode(response.body);
//       // Print the data to see the structure of the response
//       print('Data: $data');
//
//       // Check what key contains the token
//       if (data.containsKey('token')) {
//         print(data['token']);
//         return data['token'];  // Adjust based on actual API response structure
//       } else {
//         throw Exception('Token not found in the response');
//       }
//     } else {
//       throw Exception('Failed to authenticate. Status code: ${response.statusCode}');
//     }
//   }
//
//   // Fetch data using the token
//   Future<void> getNumber(String token) async {
//     final url = Uri.https('bsslapidemo.dcontroller.com', '/api/StaffAdvanceRequests/GetStaffDefault');
//
//     final response = await http.get(
//       url,
//       headers: {
//         'Authorization': 'Bearer $token',  // Use the token here
//         'Content-Type': 'application/json',
//       },
//     );
//
//     // Check if the request is successful
//     if (response.statusCode == 200) {
//       print('Response body: ${response.body}');
//     } else {
//       print('Failed to load data. Status code: ${response.statusCode}');
//     }
//   }
//
//   // This function is triggered when the button is pressed
//   Future<void> handleButtonPress() async {
//     try {
//       print('Button Clicked');
//       // Authenticate to get the token
//       String token = await authenticate();
//       print('Token: $token');
//
//       // Fetch the data using the token
//       await getNumber(token);
//     } catch (e) {
//       print('Error occurred: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: handleButtonPress, // Trigger the authentication and data fetching
//         child: const Icon(Icons.access_alarm),
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class MyApiButton extends StatefulWidget {
//   const MyApiButton({super.key});

//   @override
//   State<MyApiButton> createState() => _MyApiButtonState();
// }

// class _MyButtonState extends State<MyButton> {
  
//   // Authenticate and get the Bearer token
//   Future<String> authenticate() async {
//     final url = Uri.https('bsslapidemo.dcontroller.com', '/api/Account/Logindetails');

//     final body = jsonEncode({
//       "userCode": "your_user_code",
//       "subsystem": "your_subsystem",
//       "loginModule": "your_login_module",
//       "loginYear": "your_login_year",
//       "areaOffice": "your_area_office",
//       "systemName": "your_system_name",
//       "systemtype": "your_system_type",
//       "systemOs": "your_system_os",
//       "locationState": "your_location_state",
//       "locationAddress": "your_location_address",
//       "locationCountry": "your_location_country",
//       "password": "your_password"
//     });

//     // Send POST request to authenticate
//     final response = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json'},
//       body: body,
//     );

//     print('Authentication Response: ${response.body}');
//     print('Status Code: ${response.statusCode}');
    
//     // Check if the authentication is successful
//     if (response.statusCode == 200) {
//       // Extract the bearer token from the response
//       final data = jsonDecode(response.body);
//       // Print the data to see the structure of the response
//       print('Data: $data');
      
//       // Check what key contains the token
//       if (data.containsKey('token')) {
//         print(data['token']);
//         return data['token'];  // Adjust based on actual API response structure
//       } else {
//         throw Exception('Token not found in the response');
//       }
//     } else {
//       throw Exception(
//           'Failed to authenticate. Status code: ${response.statusCode}');
//     }
//   }

//   // Fetch data using the token
//   Future<void> getNumber(String token) async {
//     final url = Uri.https('bsslapidemo.dcontroller.com', '/api/StaffAdvanceRequests/GetStaffDefault');

//     final response = await http.get(
//       url,
//       headers: {
//         'Authorization': 'Bearer $token',  // Use the token here
//         'Content-Type': 'application/json',
//       },
//     );

//     // Check if the request is successful
//     if (response.statusCode == 200) {
//       print('Response body: ${response.body}');
//     } else {
//       print('Failed to load data. Status code: ${response.statusCode}');
//     }
//   }

//   // This function is triggered when the button is pressed
//   Future<void> handleButtonPress() async {
//     try {
//       print('Button Clicked');
//       // Authenticate to get the token
//       String token = await authenticate();
//       print('Token: $token');

//       // Fetch the data using the token
//       await getNumber(token);
//     } catch (e) {
//       print('Error occurred: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: handleButtonPress, // Trigger the authentication and data fetching
//         child: const Icon(Icons.access_alarm),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:bssl_app/services/Dashboard_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyApiButton extends StatefulWidget {
  const MyApiButton({super.key});

  @override
  State<MyApiButton> createState() => _MyApiButtonState();
}

class _MyApiButtonState extends State<MyApiButton> {
  bool _isLoading = false;

  // Authenticate and get the Bearer token
  Future<Map<String, dynamic>> authenticate() async {
    final url = Uri.https('bsslapidemo.dcontroller.com', '/api/Account/Logindetails');

    final body = jsonEncode({
      "userCode": "Admin",
      "subsystem": "Unknown",
      "loginModule": "module001",
      "loginYear": "2024",
      "areaOffice": "Lekki",
      "systemName": "MSI",
      "systemtype": "c7vfkp",
      "systemOs": "windows_11",
      "locationState": "Lagos",
      "locationAddress": "Lekki",
      "locationCountry": "Nigeria",
      "password": "BSSL@TRAINING"
    });

    print('Request Body: $body');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    print('Authentication Response: ${response.body}');
    print('Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Data: $data');

      if (data.containsKey('token')) {
        await storeToken(data['token']);
        return {
          'token': data['token'],
          'userCode': data['userCode'],
          'loginYear': data['loginYear']
        };
      } else {
        throw Exception('Token not found in the response');
      }
    } else {
      throw Exception('Failed to authenticate. Status code: ${response.statusCode}');
    }
  }

  // Store token in SharedPreferences
  Future<void> storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', token);
    print('Token saved to SharedPreferences');
  }

  Future<void> getNumber(String token, String year, String staffCode) async {
    final url = Uri.https('bsslapidemo.dcontroller.com', '/api/StaffAdvanceRequests/GetStaffDefault', {
      'year': year,
      'staffCode': staffCode,
      'refno': ""
    });

    print('Request URL: $url');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  }

  Future<void> handleButtonPress() async {
    setState(() {
      _isLoading = true;
    });

    try {
      print('Button Clicked');
      Map<String, dynamic> authData = await authenticate();
      String token = authData['token'];
      String userCode = authData['userCode'];
      String loginYear = authData['loginYear'];

      print('Token: $token');
      print('User Code: $userCode');
      print('Login Year: $loginYear');

      // await getNumber(token, loginYear, userCode);
      print('Getting Dashboard');
      await getDashBoard(token);
    } catch (e) {
      print('Error occurred: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BSSL API TOKEN TEST'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: handleButtonPress,
                child: const Icon(Icons.access_alarm),
              ),
      ),
    );
  }
}
