import 'package:flutter/material.dart';

import '../../components/my_drawer.dart';
class CapitalrequistionPage extends StatefulWidget {
  const CapitalrequistionPage({super.key});

  @override
  State<CapitalrequistionPage> createState() => _CapitalrequistionPageState();
}

class _CapitalrequistionPageState extends State<CapitalrequistionPage> {

  Widget buildButton(String label, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(40, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Change Attachment'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  'Update/Change Attachment',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton('Create New Record(Online)', Colors.blue[300]!, () {
                      // Quarantine logic
                    }),
                    SizedBox(height: 10),
                    buildButton('Create New Record(Memo)', Colors.blueAccent, () {
                      // Refresh logic
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
