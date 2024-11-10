// ignore_for_file: body_might_complete_normally_nullable, unused_import

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'bssl_service.dart';

const String baseUrl = 'https://bsslapidemo.dcontroller.com';

Future<Map<String, dynamic>?> getDashBoard(token) async {
  // final url = Uri.https('bsslapidemo.dcontroller.com',
  //     '/api/SubMenu/GetSubMenu', {
  //       'staffid': '11110',
  //       'StaffCode': '11110',  // Add the required StaffCode parameter here
  //     });

  final url = Uri.https(
    'bsslapidemo.dcontroller.com',
    'api/Indexpage/GetSubMenuList',
    {
      'staffid': "11110",
      'subsystemcode': "SFS",
      'subsyselfcode': "SFSHRM",
      'subsystemreim': "SFSRIM", // Corrected spelling
      'subsystemsiwes': "SIWES",
      'subsystembudget': "SFSBUD",
    },
  );

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
    return jsonDecode(response.body);
  } else {
    print('Failed to load data. Status code: ${response.statusCode}');
    print('Response: ${response.body}');
  }
}
