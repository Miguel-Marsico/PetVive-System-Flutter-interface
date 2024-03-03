// Import necessary Flutter and HTTP packages for UI rendering and making HTTP requests.
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Define DeleteScreen as a StatefulWidget to manage state changes.
class DeleteScreen extends StatefulWidget {
  @override
  _DeleteScreenState createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  final _formKey = GlobalKey<FormState>();

  // Initialize text editing controllers for each form field.
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _idadeController = TextEditingController();
  TextEditingController _racaController = TextEditingController();
  TextEditingController _tipoController = TextEditingController();
  TextEditingController _observacoesController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _updateIdController = TextEditingController();

  // Function to handle the update animal operation.
  Future<void> atualizarAnimal() async {
    if (!_formKey.currentState!.validate()) return;

    var url = Uri.parse('http://localhost:5001/atualizar_animal/${_updateIdController.text}');

    // Perform a PUT request to update the animal with the provided details.
    var response = await http.put(url, body: jsonEncode({
      'nome': _nomeController.text,
      'idade': _idadeController.text,
      'raca': _racaController.text,
      'tipo': _tipoController.text,
      'observacoes': _observacoesController.text,
    }), headers: {
      "Authorization": "Bearer ChAvEpEtVivE",
      "Content-Type": "application/json"
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Animal updated successfully')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update animal. Error code: ${response.statusCode}')));
    }
  }

  // Function to handle the delete animal operation.
  Future<void> deletarAnimal() async {
    var url = Uri.parse('http://localhost:5001/deletar_animal/${_idController.text}');

    var response = await http.delete(url, headers: {
      "Authorization": "Bearer ChAvEpEtVivE"
    });

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Animal deleted successfully')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to delete animal. Error code: ${response.statusCode}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modify or Delete Animal'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              // Form fields for updating animal details.
              TextFormField(
                controller: _updateIdController,
                decoration: InputDecoration(labelText: 'ID to Update'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(controller: _nomeController, decoration: InputDecoration(labelText: 'Name')),
              TextFormField(controller: _idadeController, decoration: InputDecoration(labelText: 'Age'), keyboardType: TextInputType.number),
              TextFormField(controller: _racaController, decoration: InputDecoration(labelText: 'Breed')),
              TextFormField(controller: _tipoController, decoration: InputDecoration(labelText: 'Type')),
              TextFormField(controller: _observacoesController, decoration: InputDecoration(labelText: 'Observations')),
              SizedBox(height: 15),
              ElevatedButton(onPressed: atualizarAnimal, child: Text('Update Animal', style: TextStyle(color: Colors.white)), style: ElevatedButton.styleFrom(primary: Color(0xFF606060), padding: EdgeInsets.all(16.0))),
              TextFormField(controller: _idController, decoration: InputDecoration(labelText: 'ID to Delete'), keyboardType: TextInputType.number),
              SizedBox(height: 15),
              ElevatedButton(onPressed: deletarAnimal, child: Text('Delete Animal', style: TextStyle(color: Colors.white)), style: ElevatedButton.styleFrom(primary: Color(0xFF606060), padding: EdgeInsets.all(16.0))),
            ],
          ),
        ),
      ),
    );
  }
}
