// Import necessary Flutter packages for UI, networking, and JSON processing.
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Import local Dart files for animal model and screens.
import 'animal.dart';
import 'add_screen.dart';
import 'delete_screen.dart';

// Define ListScreen as a StatefulWidget to handle dynamic content.
class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  int selectedIndex = 0;
  List<Animal> animals = [];

  @override
  void initState() {
    super.initState();
    fetchAnimals();
  }

  // Asynchronous function to fetch animal data from the API.
  Future<void> fetchAnimals() async {
    final response = await http.get(Uri.parse('http://localhost:5001/retornar_animais'));

    if (response.statusCode == 200) {
      List<dynamic> animalsJson = json.decode(response.body);
      setState(() {
        animals = animalsJson.map((json) => Animal.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load API data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your patients'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                height: 200,
                child: Scrollbar(
                  thumbVisibility: true,
                  thickness: 6.0,
                  radius: Radius.circular(20.0),
                  child: ListView.builder(
                    itemCount: animals.length,
                    itemBuilder: (context, index) {
                      // Display each animal in a ListTile.
                      return ListTile(
                        title: Text(
                          animals[index].nome ?? 'Unknown name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: animals.isNotEmpty ? Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Scrollbar(
                    thumbVisibility: true,
                    thickness: 6.0,
                    radius: Radius.circular(20.0),
                    child: ListView(
                      padding: EdgeInsets.all(16.0),
                      children: [
                        // Map each detail of the selected animal to a text widget.
                        Text('Animal Data:', style: TextStyle(fontSize: 26)),
                        Text('ID: ${animals[selectedIndex].id ?? 'Unknown ID'}', style: TextStyle(fontSize: 20)),
                        Text('Name: ${animals[selectedIndex].nome ?? 'Unknown name'}', style: TextStyle(fontSize: 20)),
                        Text('Age: ${animals[selectedIndex].idade?.toString() ?? 'Unknown age'}', style: TextStyle(fontSize: 20)),
                        Text('Breed: ${animals[selectedIndex].raca ?? 'Unknown breed'}', style: TextStyle(fontSize: 20)),
                        Text('Type: ${animals[selectedIndex].tipo ?? 'Unknown type'}', style: TextStyle(fontSize: 20)),
                        Text('Notes: ${animals[selectedIndex].observacao ?? 'No notes'}', style: TextStyle(fontSize: 20)),
                      ].map((e) => Align(alignment: Alignment.centerLeft, child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: e,
                      ))).toList(),
                    )

                ),
              ) : CircularProgressIndicator(),
            ),
            // Display buttons to add a new animal or modify/delete existing ones.
            Padding(
              padding: EdgeInsets.only(top: 25.0, bottom: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddScreen()));
                    },
                    child: Text('Add new', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF606060),
                      padding: EdgeInsets.all(16.0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DeleteScreen()));
                    },
                    child: Text('Modify or delete', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF606060),
                      padding: EdgeInsets.all(16.0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
