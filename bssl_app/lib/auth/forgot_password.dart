import 'package:bssl_app/pages/DashBoard/dash_board_page.dart';
import 'package:flutter/material.dart';

import 'login_or_register.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final Function()? onTap;
  const ForgotPasswordScreen({super.key, this.onTap});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final staffcodeController = TextEditingController();

  @override
  void dispose() {
    // Dispose of controllers when the widget is disposed
    staffcodeController.dispose();
    super.dispose();
  }

  String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Image.asset('assets/bssllogo-preview.png',scale: 1,height: 130,),
                Text(
                  "dController ERP SELF SERVICE",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(height: 20),
                Text(
                  "Reset Password",
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                SizedBox(height: 20),
                // Password Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Staff code",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: validateNotEmpty,
                  obscureText: true,
                ),
                SizedBox(height: 100),
                // Log In Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => DashBoardPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary, // Uses primary color for button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text("RESET", style: TextStyle(color: Theme.of(context).colorScheme.secondary)), // Uses secondary (white)
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Theme.of(context).colorScheme.primary), // Uses primary color
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) =>LoginOrRegister()));
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary, // Uses primary color
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
