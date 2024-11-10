// import 'dart:convert';
// import 'package:http/http.dart' as http;

// Future<void> getDashBoard(String token) async {
//   final url =
//       Uri.https('bsslapidemo.dcontroller.com', 'api/Indexpage/GetSubMenuList', {
//     'staffid': "123bj",
//     'subsystemcode': "123bj",
//     'subsyselfcode': "123bj",
//     'subsytemreim': "123bj",
//     'subsystemsiwes': "123bj",
//     'subsystembudget': "123bj"
//   });

//   print('Request URL: $url');
//   final response = await http.get(
//     url,
//     headers: {
//       'Authorization': 'Bearer $token',
//       'Content-Type': 'application/json',
//     },
//   );

//    if (response.statusCode == 200) {
//       print('Response body: ${response.body}');
//     } else {
//       print('Failed to load data. Status code: ${response.statusCode}');
//       print('Response: ${response.body}');
//     }
// }
