// Import necessary Flutter packages for UI, HTTP requests, and JSON processing.
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Define AddScreen as a StatefulWidget to manage state changes.
class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  // Define a global key for the form to manage form state.
  final _formKey = GlobalKey<FormState>();
  String nome = '';
  int idade = 0;
  String raca = '';
  String tipo = '';
  String observacoes = '';

  // Asynchronous function to send the animal data to the API.
  Future<void> adicionarAnimal() async {
    var url = Uri.parse('http://localhost:5001/adicionar_animal');
    var response = await http.post(url, body: jsonEncode({
      'nome': nome,
      'idade': idade,
      'raca': raca,
      'tipo': tipo,
      'observacoes': observacoes
    }), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ChAvEpEtVivE" // Example authorization header.
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Animal added successfully!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add animal. Error code: ${response.statusCode}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Animal'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              // Text field for the animal name.
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) => nome = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an age';
                  }
                  return null;
                },
                onSaved: (value) => idade = int.tryParse(value!) ?? 0,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Breed'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a breed';
                  }
                  return null;
                },
                onSaved: (value) => raca = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a type';
                  }
                  return null;
                },
                onSaved: (value) => tipo = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Observations'),
                onSaved: (value) => observacoes = value ?? '',
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    adicionarAnimal();
                  }
                },
                child: Text('Add Animal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
