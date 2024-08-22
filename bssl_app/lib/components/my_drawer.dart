import 'package:flutter/material.dart';
import '../pages/Finiacial/StaffAdv&Retirment.dart';
import '../pages/Finiacial/StaffAdvRequest.dart'; // Import the StaffAdvanceRetirementPage

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Admin"),
            accountEmail: const Text("admin@example.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://via.placeholder.com/150",
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          ListTile(
            title: const Text('Dashboard'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Budget Preparation'),
            onTap: () {},
          ),
          ExpansionTile(
            title: const Text('Financial Workflow Process Setup'),
            initiallyExpanded: _expanded,
            onExpansionChanged: (bool expanded) {
              setState(() {
                _expanded = expanded;
              });
            },
            children: [
              ListTile(
                title: const Text('Staff Advance Request'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StaffAdvanceRequestPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Staff Advance Retirement and Reimbursement'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StaffAdvanceRetirementPage()),
                  );
                },
              ),
            ],
          ),
          ListTile(
            title: const Text('HRM Workflow Process Setup'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Create User Account'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
