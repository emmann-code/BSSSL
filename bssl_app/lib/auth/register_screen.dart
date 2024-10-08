import 'package:flutter/material.dart';
import '../components/My_textfield.dart';
import 'auth_service.dart';


class Registerscreen extends StatefulWidget {
  final Function()? onTap;
  const Registerscreen({super.key, this.onTap});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  final _formKey = GlobalKey<FormState>();
  final StaffidController = TextEditingController();

  final emailController = TextEditingController();

  final nameController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  // Initialize AuthService instance
  AuthService authService = AuthService();

  @override
  void dispose() {
    // Dispose of controllers when the widget is disposed
    emailController.dispose();
    nameController.dispose();
    StaffidController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // Function to create user
  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        final createUserResponse = await authService.createUser(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          name: nameController.text.trim(),
          zcopny: 'ZCopny123',
          copny: 'CopnyABC',
          staffCode:  StaffidController.text.trim(),
          pwdExpiry: true,
        );
        print(createUserResponse);
        // Navigate to the home page or show success message
      } catch (e) {
        print(e);
        // Show error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: Failed to create user.')),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15),
                Image.asset('assets/bssllogo-preview.png',scale: 1,height: 130,),
                Text(
                  "dController ERP SELF SERVICE",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, // Uses primary color
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Create account with email",
                  style: TextStyle(color: Theme.of(context).colorScheme.primary), // Uses onSecondary
                ),
                SizedBox(height: 20),
                // Full Name Field
                MyTextField(controller: StaffidController, text: 'StaffId', obscureText: false),
                SizedBox(height: 20),
                // Email Field
                MyTextField(controller: emailController, text: 'Email', obscureText: false),
                SizedBox(height: 20),
                // Phone number Field
                MyTextField(controller: nameController, text: 'Name', obscureText: false),
                SizedBox(height: 20),
                // Password Field
                MyTextField(controller: passwordController, text: 'Password', obscureText: true),
                SizedBox(height: 20),
                // Confirm Password Field
                MyTextField(controller: confirmPasswordController, text: 'Confirm Password', obscureText: true),
                SizedBox(height: 10),
                // Terms and Conditions
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    Expanded(
                      child: Text(
                        "I agree with the terms of service and privacy policy",
                        style: TextStyle(color: Theme.of(context).colorScheme.primary), // Uses onSecondary
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Sign Up Button
                ElevatedButton(
                  onPressed: _registerUser,  // Call the register function here
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary, // Uses primary color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text("Sign Up", style: TextStyle(color: Theme.of(context).colorScheme.secondary)), // Uses secondary (white)
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
                      onTap: widget.onTap,
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
