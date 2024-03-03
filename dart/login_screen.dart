// Import necessary packages for building the UI, making HTTP requests, encoding/decoding JSON, and managing preferences.
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// Define the LoginScreen widget as a stateless widget.
class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Define an asynchronous function to handle user login.
  Future<void> _login(BuildContext context) async {
    // Make a POST request to the login endpoint with username and password.
    var response = await http.post(
      Uri.parse('http://localhost:5001/login'),
      body: {
        'username': _usernameController.text,
        'password': _passwordController.text,
      },
    );

    // Check if the request was successful (HTTP status code 200).
    if (response.statusCode == 200) {
      // Decode the JSON response to access the data.
      var data = json.decode(response.body);
      // Get an instance of SharedPreferences to store data locally.
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // Store the username and access token in SharedPreferences.
      await prefs.setString('username', _usernameController.text);
      await prefs.setString('token', data['access_token']);

      // Navigate to the PrincipalScreen if the login is successful.
      Navigator.pushReplacementNamed(context, '/PrincipalScreen');
    } else {
      // Show a snackbar with an error message if login fails.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Credenciais inválidas')),
      );
    }
  }

  @override
  // Build method returns the widget tree for the login screen.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' '),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // Use a column to organize widgets vertically.
            children: <Widget>[
              Image.asset('assets/assets/images/avatar.png', width: 80),
              // Display an avatar image.
              Center(
                child: Text(
                  'Login',
                  style: TextStyle( fontFamily: 'Gabarito', fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF606060)),
                ),
              ),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF606060),
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () => _login(context),
                child: Text('Login', style: TextStyle(fontFamily: 'Gabarito', color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
