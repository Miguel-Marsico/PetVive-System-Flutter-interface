import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';
import 'list_screen.dart';

class PrincipalScreen extends StatefulWidget {
  @override
  _PrincipalScreenState createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  String username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 190.0),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Bem-vindo $username !',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 40), // Space between text and image
          Container(
            width: 280,
            height: 250,
            child: Image.asset('assets/assets/images/cachorrinho.jpg', fit: BoxFit.cover),
          ),
          SizedBox(height: 20), // Space between image and button
          ElevatedButton(
            onPressed: () {
              Future.delayed(Duration(seconds: 2), () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListScreen()));
              });
            },
            child: Text('Sua lista de pacientes', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF606060), // Botão da cor #606060
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Implement navigation to login screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Text('Sair', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF606060), // Botão da cor #606060
            ),
          ),
        ],
      ),
    );
  }
}
