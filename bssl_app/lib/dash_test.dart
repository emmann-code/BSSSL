// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

// import 'dart:convert';
// import 'package:bssl_app/pages/MainLayout.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../../components/my_drawer.dart';
// import 'drawer_test.dart';

// const String baseUrl = 'https://bsslapidemo.dcontroller.com';

// class DashboardApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Dashboard App',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: DashboardScreen(),
//     );
//   }
// }

// class DashboardScreen extends StatefulWidget {
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   List<dynamic> menuItems = [];
//   Map<String, List<dynamic>> groupedMenuItems = {};
//   Map<String, bool> isExpanded = {};

//   Set<String> hiddenCategories = {
//     'HRM-Approval',
//     'Financial-Approval',
//     'Training-Contri-Reimbursement',
//     'Siwes-Approval',
//     'Procurement-Approval',
//   };

//   @override
//   void initState() {
//     super.initState();
//     fetchMenuData();
//   }

//   Future<void> fetchMenuData() async {
//     final url = Uri.https(
//       'bsslapidemo.dcontroller.com',
//       'api/Indexpage/GetSubMenuList',
//       {
//         'staffid': "11110",
//         'subsystemcode': "SFS",
//         'subsyselfcode': "SFSHRM",
//         'subsystemreim': "SFSRIM",
//         'subsystemsiwes': "SIWES",
//         'subsystembudget': "SFSBUD",
//       },
//     );

//     final response = await http.get(url, headers: {
//       'Authorization': 'Bearer YOUR_TOKEN',
//       'Content-Type': 'application/json',
//     });

//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       setState(() {
//         menuItems = data;
//         groupMenuItems();
//       });
//     } else {
//       print('Failed to load data. Status code: ${response.statusCode}');
//       print('Response: ${response.body}');
//     }
//   }

//   void groupMenuItems() {
//     groupedMenuItems.clear();
//     for (var item in menuItems) {
//       String category = item['menuName'] ?? 'Other';

//       if (hiddenCategories.contains(category)) {
//         continue;
//       }

//       if (groupedMenuItems[category] == null) {
//         groupedMenuItems[category] = [];
//         isExpanded[category] = false;
//       }
//       groupedMenuItems[category]?.add(item);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MainLayout(
//       title: 'Dashboard',
//       body: groupedMenuItems.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : GridView.builder(
//               padding: EdgeInsets.all(8.0),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, // 2 columns in the grid
//                 crossAxisSpacing: 8.0,
//                 mainAxisSpacing: 8.0,
//                 childAspectRatio: 1.0, // Adjust aspect ratio of each container
//               ),
//               itemCount: groupedMenuItems.keys.length,
//               itemBuilder: (context, index) {
//                 String category = groupedMenuItems.keys.elementAt(index);
//                 return GestureDetector(
//                   onTap: () {
//                     // Navigate to a new page with the ExpansionTiles for this category
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => CategoryDetailsScreen(
//                             category: category,
//                             items: groupedMenuItems[category]!),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(16.0),
//                     decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       borderRadius: BorderRadius.circular(12.0),
//                     ),
//                     child: Center(
//                       child: Text(
//                         category,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }

// class CategoryDetailsScreen extends StatelessWidget {
//   final String category;
//   final List<dynamic> items;

//   CategoryDetailsScreen({required this.category, required this.items});

//   @override
//   Widget build(BuildContext context) {
//     return MainLayout(
//       title: category,
//       body: items.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : GridView.builder(
//               padding: EdgeInsets.all(8.0),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, // Number of columns in the grid
//                 crossAxisSpacing: 8.0,
//                 mainAxisSpacing: 8.0,
//                 childAspectRatio:
//                     1.0, // Adjust the aspect ratio of each container
//               ),
//               itemCount: items.length,
//               itemBuilder: (context, index) {
//                 var item = items[index];
//                 return GestureDetector(
//                   onTap: () {
//                     // Handle item tap (e.g., show details)
//                     print('Selected: ${item['subMenuName']}');
//                   },
//                   child: Card(
//                     margin:
//                         EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12.0),
//                     ),
//                     elevation: 4.0,
//                     child: Container(
//                       padding: EdgeInsets.all(8.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             item['subMenuName'] ?? 'No Name',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           SizedBox(height: 8.0),
//                           Text(
//                             item['menuName'] ?? 'No Category',
//                             style: TextStyle(fontSize: 14),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
