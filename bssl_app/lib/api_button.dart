// ignore_for_file: prefer_const_constructors

import 'dart:convert'; // for jsonEncode and jsonDecode
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
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

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    print('Authentication Response: ${response.body}');
    print('Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Data: $data');

      if (data.containsKey('token')) {
        print(data['token']);
        print(data['userCode']);
        print(data['loginYear']);
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
Future<void> getNumber(String token, String year, String staffCode) async {
  final url = Uri.https('bsslapidemo.dcontroller.com',
      '/api/StaffAdvanceRequests/GetStaffDefault', {
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
    try {
      print('Button Clicked');
      Map<String, dynamic> authData = await authenticate();
      String token = authData['token'];
      String userCode = authData['userCode'];
      String loginYear = authData['loginYear'];

      print('Token: $token');
      print('User Code: $userCode');
      print('Login Year: $loginYear');

      await getNumber(token, loginYear,userCode);
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed:
            handleButtonPress,
        child: const Icon(Icons.access_alarm),
      ),
    );
  }
}
