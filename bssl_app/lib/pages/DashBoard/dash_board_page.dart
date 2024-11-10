// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:convert';
import 'package:bssl_app/pages/HRM/hrm_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Budget/budget_dashboard.dart';
import '../Finiacial/financial_dashboard.dart';
import '../MainLayout.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

const String baseUrl = 'https://bsslapidemo.dcontroller.com';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  List<dynamic> menuItems = [];
  Map<String, List<dynamic>> groupedMenuItems = {};
  Map<String, bool> isExpanded = {};


  Set<String> hiddenCategories = {
    'HRM-Approval',
    'Financial-Approval',
    'Training-Contri-Reimbursement',
    'Siwes-Approval',
    'Procurement-Approval',
  };

  @override
  void initState() {
    super.initState();
    fetchMenuData();
  }

  Future<void> fetchMenuData() async {
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

    final response = await http.get(url, headers: {
      'Authorization': 'Bearer YOUR_TOKEN',
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        menuItems = data;
        groupMenuItems();
      });
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  }

  void groupMenuItems() {
    groupedMenuItems.clear();
    for (var item in menuItems) {
      String category = item['menuName'] ?? 'Other';

      if (hiddenCategories.contains(category)) {
        continue;
      }

      if (groupedMenuItems[category] == null) {
        groupedMenuItems[category] = [];
        isExpanded[category] = false;
      }
      groupedMenuItems[category]?.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Dashboard',
      body: groupedMenuItems.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns in the grid
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.0, // Adjust aspect ratio of each container
              ),
              itemCount: groupedMenuItems.keys.length,
              itemBuilder: (context, index) {
                String category = groupedMenuItems.keys.elementAt(index);
                return GestureDetector(
                  onTap: () {
                    if (category == 'HRM') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HrmDashboard(
                            category: category,
                            items: groupedMenuItems[category]!,
                          ),
                        ),
                      );
                    } else if (category == 'Financial') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FinancialDashboard(
                              category: category,
                              items: groupedMenuItems[category]!),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BudgetDashboard(
                              category: category,
                              items: groupedMenuItems[category]!),
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: Text(
                        category,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
