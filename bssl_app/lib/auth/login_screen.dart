import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  const LoginScreen({super.key, this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Icon(
                Icons.lock,
                size: 150,
                color: Theme.of(context).colorScheme.primary, // Uses primary color from theme
              ),
              Text(
                "Log In",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary, // Uses primary color from theme
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Please login to continue using our app",
                style: TextStyle(color: Theme.of(context).colorScheme.primary), // Uses onSecondary for subtle text
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              // Social Media Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.surface, // Uses surface color from theme
                    child: Icon(Icons.facebook, color: Colors.blue),
                  ),
                  SizedBox(width: 15),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.surface, // Uses surface color from theme
                    child: Icon(Icons.g_mobiledata, color: Colors.blue),
                  ),
                  SizedBox(width: 15),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.surface, // Uses surface color from theme
                    child: Icon(Icons.apple, color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "or login with email",
                style: TextStyle(color: Theme.of(context).colorScheme.primary), // Uses onSecondary
              ),
              SizedBox(height: 20),
              // Email Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Password Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Icon(Icons.visibility_off, color: Theme.of(context).colorScheme.onSecondary), // onSecondary for icon
                ),
                obscureText: true,
              ),
              SizedBox(height: 10),
              // Remember me and Forgot password row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text("Remember me", style: TextStyle(color: Theme.of(context).colorScheme.primary)), // Uses primary color
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Theme.of(context).colorScheme.primary), // Uses primary color
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Log In Button
              ElevatedButton(
                onPressed: () {
                  // Navigator.pushReplacement(
                  //     context, MaterialPageRoute(builder: (context) => MainScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary, // Uses primary color for button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("Log In", style: TextStyle(color: Theme.of(context).colorScheme.secondary)), // Uses secondary (white)
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary), // Uses primary color
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Sign Up",
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
    );
  }
}
