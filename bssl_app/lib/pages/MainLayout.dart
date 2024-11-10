// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../drawer_test.dart';

class MainLayout extends StatelessWidget {
  final Widget body;
  final String title;

  const MainLayout({required this.body, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,overflow: TextOverflow.ellipsis,),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: PopupMenuButton<int>(
              child: CircleAvatar(
                radius: 20,
                child: ClipOval(
                  child: Image.network(
                    "https://img.freepik.com/free-photo/view-cartoon-male-chef-with-delicious-3d-pizza_23-2151017583.jpg?t=st=1724622710~exp=1724626310~hmac=d63d346b5e93d6979cd43609045fc96ab492693f6a81ab294226e5be6908b48d&w=740",
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              onSelected: (value) {
                if (value == 0) {
                  // Navigate to Profile page or perform action
                } else if (value == 1) {
                  // Log out the user or perform logout action
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: Row(
                    children: [
                      Icon(Icons.person, color: Colors.black54),
                      SizedBox(width: 10),
                      Text("Profile"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.black54),
                      SizedBox(width: 10),
                      Text("Logout"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: DrawerMenu(), // Ensure this is correct
      body: body,
    );
  }
}
