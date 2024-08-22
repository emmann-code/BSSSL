import 'package:bssl_app/components/my_button.dart';
import 'package:bssl_app/pages/Finiacial/StaffAdv&Retirment.dart';
import 'package:flutter/material.dart';

import '../components/my_drawer.dart';
import 'Finiacial/StaffAdvRequest.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: CustomButton(text: 'Check Financial Service',
            onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyDrawer()));
    },
      ),
      ),
    );
  }
}
