// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:bssl_app/services/Dashboard_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'services/Hrm_services.dart';

class MyApiButton extends StatefulWidget {
  const MyApiButton({super.key});

  @override
  State<MyApiButton> createState() => _MyApiButtonState();
}

class _MyApiButtonState extends State<MyApiButton> {
  bool _isLoading = false;

  // Authenticate and get the Bearer token
  Future<Map<String, dynamic>> authenticate() async {
    final url =
        Uri.https('bsslapidemo.dcontroller.com', '/api/Account/Logindetails');

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

    final response = await http
        .post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    )
        .timeout(Duration(seconds: 10), onTimeout: () {
      throw Exception('Request timed out.');
    });

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
      throw Exception(
          'Failed to authenticate. Status code: ${response.statusCode}');
    }
  }

  // Store token in SharedPreferences
  Future<void> storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', token);
    print('Token saved to SharedPreferences');
  }

  Future<void> getNumber(String token, String year, String staffCode) async {
    final url = Uri.https(
        'bsslapidemo.dcontroller.com',
        '/api/StaffAdvanceRequests/GetStaffDefault',
        {'year': year, 'staffCode': staffCode, 'refno': ""});

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
      print('Getting test');
      // await GetStaffRefNo(token);
      // await GetStaff(token);
      // await GetStaffList(token);
      // GetLeaveRosterDetails(token);
      // GetRosterDateChange(token);
      // GetleaveRecord(token);
      // GetleaveNewRecord(token);
      // GetleaveType(token);
      // GetProcessType(token);
      // GetCountryList(token);
      // GetStateList(token);
      // GetCityList(token);
      // GetLeaveTypeBal(token);
      // GetLeaveChange(token);
    } catch (e) {
      print('Error occurred: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

//   9701
// 9354
// 11110
// 10634
// 10527
// 11035
// 12180
// 10604
// 10398

  // Future<dynamic> test(String token) async {
  //   final url = Uri.https(
  //     'bsslapidemo.dcontroller.com',
  //     '/api/StaffAdvanceRequests/GetStaffDefault',
  //     {
  //       'staffcode': "9701",
  //     },
  //   );

  //   print('Request URL: $url');

  //   try {
  //     final response = await http.get(
  //       url,
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //         'Content-Type': 'application/json',
  //       },
  //     );

  //     print('Response Status Code: ${response.statusCode}');

  //     if (response.statusCode == 200) {
  //       print('Response body: ${response.body}');
  //       final decoded = jsonDecode(response.body);

  //       if (decoded is Map<String, dynamic>) {
  //         return decoded;
  //       } else if (decoded is List) {
  //         return decoded;
  //       } else {
  //         print('Unexpected response format.');
  //         return null;
  //       }
  //     } else {
  //       print('Failed to load data. Status code: ${response.statusCode}');
  //       print('Response: ${response.body}');
  //       return null;
  //     }
  //   } catch (e) {
  //     print('An error occurred: $e');
  //     return null;
  //   }
  // }

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
