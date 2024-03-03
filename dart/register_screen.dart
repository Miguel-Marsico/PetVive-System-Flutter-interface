// Import necessary packages for material design, HTTP requests, and JSON encoding.
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Define RegisterScreen as a StatefulWidget to manage state changes.
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Define an asynchronous function to handle the registration process.
  Future<void> _register() async {
    var url = Uri.parse('http://localhost:5001/registro');

    try {
      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "username": _usernameController.text,
            "password": _passwordController.text,
          }));

      if (response.statusCode == 200 || response.statusCode == 201) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Success'),
            content: Text('Registration successful.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text('Ok'),
              ),
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Error'),
            content: Text('Registration failed.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(); // Close the dialog on button press.
                },
                child: Text('Ok'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  // Build method to render the UI components.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register', style: TextStyle(fontFamily: 'Gabarito', color: Colors.white)),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            // Organize form fields vertically.
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('assets/assets/images/avatar.png', width: 80),
              Center(
                child: Text(
                  'Registration',
                  style: TextStyle(fontFamily: 'Gabarito', fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF606060)),
                ),
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF606060),
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: _register,
                child: Text(
                  'Register', // Button text.
                  style: TextStyle(fontFamily: 'Gabarito', color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
