// ignore_for_file: prefer_const_constructors, unnecessary_to_list_in_spreads

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'services/bssl_service.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  static Future<List<dynamic>>? _menuDataFuture; // Cache the Future
  static List<dynamic>? _cachedMenuItems; // Cache the fetched menu data
  Map<String, List<dynamic>> groupedMenuItems = {};
  Map<String, bool> isExpanded = {};

  Set<String> hiddenCategories = {
    'HRM-Approval',
    'Financial-Approval',
    'Training-Contri-Reimbursement',
    'Siwes-Approval',
    'Procurement-Approval'
  };

  @override
  void initState() {
    super.initState();
    _menuDataFuture ??= fetchMenuData(); // Only initialize if it's null
  }

  // Fetch the menu data from the API only once
  Future<List<dynamic>> fetchMenuData() async {
    if (_cachedMenuItems != null) {
      return _cachedMenuItems!; // Return cached data if already fetched
    }

    final url = Uri.https(
      'bsslapidemo.dcontroller.com',
      'api/Indexpage/GetSubMenuList',
      {
        'staffid': "11110",
        'subsystemcode': "SFS",
        'subsyselfcode': "SFSHRM",
        'subsystemreim': "SFSRIM",
        'subsystemsiwes': "SIWES",
        'subsystembudget': "SFSBUD",
      },
    );

    String token = await getAuthToken();

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      _cachedMenuItems = jsonDecode(response.body); // Cache the data
      groupMenuItems();
      return _cachedMenuItems!;
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      return [];
    }
  }

  // Group menu items by category and hide the hidden categories
  void groupMenuItems() {
    groupedMenuItems.clear();
    for (var item in _cachedMenuItems ?? []) {
      String category = item['menuName'] ?? 'Other';

      // Skip hidden categories
      if (hiddenCategories.contains(category)) {
        continue;
      }

      // If category is not already present, initialize it
      if (groupedMenuItems[category] == null) {
        groupedMenuItems[category] = [];
        isExpanded[category] = false;
      }

      // Add the item to the respective category
      groupedMenuItems[category]?.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<List<dynamic>>(
        future: _menuDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading menu data'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No menu data available'));
          }

          _cachedMenuItems = snapshot.data; // Cache the data after loading
          groupMenuItems(); // Organize the items by category

          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // Drawer Header
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              // List of grouped menu items
              ...groupedMenuItems.keys.map((category) {
                return ExpansionTile(
                  // ExpansionTile for each category
                  title: Text(
                    category,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  initiallyExpanded: isExpanded[category]!,
                  children: groupedMenuItems[category]!.map((item) {
                    return Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                      child: ListTile(
                        title: Text(item['subMenuName'] ?? 'No Name'),
                        subtitle: Text(item['menuName'] ?? 'No Category'),
                        onTap: () {
                          // Handle menu item selection (navigation or action)
                          print('Selected: ${item['subMenuName']}');
                        },
                      ),
                    );
                  }).toList(),
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }
}
