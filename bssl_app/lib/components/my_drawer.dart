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
                  "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.manutd.com%2Fen%2Fplayers-and-staff%2Fdetail%2Fkobbie-mainoo&psig="
                      "AOvVaw0zxiXy4cd-BorxDKkh4zyl&ust=1724459840761000&source=images&cd=vfe&opi=89978449&ved=2ahUKEwiCmJbT74mIAxVezQIHHWdS"
                      "IWcQjRx6BAgAEBg",
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
