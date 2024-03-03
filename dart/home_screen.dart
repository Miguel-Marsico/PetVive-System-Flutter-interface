// Import the necessary packages for material design and the screens for navigation.
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';

// Define the HomeScreen widget as a stateless widget.
class HomeScreen extends StatelessWidget {
  @override
  // Build method returns the widget tree for the home screen.
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // Organizes widgets vertically.
          crossAxisAlignment: CrossAxisAlignment.start,
          // Aligns widgets to the start of the cross axis.
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
              child: Text(
                'PETVIVE: O SISTEMA DO VETERINÁRIO',
                // The main title text.
                style: TextStyle(
                  fontFamily: 'Gabarito',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
              child: Text(
                'Nosso sistema permite que veterinários registrem e gerenciem informações essenciais sobre os animais de estimação, proporcionando um atendimento mais eficiente e personalizado.',
                style: TextStyle(
                  fontFamily: 'Gabarito',
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Text(
                'Registre-se agora e comece a oferecer o melhor cuidado possível para os seus pacientes de quatro patas.',
                style: TextStyle(
                  fontFamily: 'Gabarito',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              // Centers the puppy image.
              child: Container(
                width: 280,
                height: 250,
                child: Image.asset('assets/assets/images/cãozinho.jpg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  // Organizes buttons vertically.
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      child: Text('Fazer Login', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF606060),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Navigates to the RegisterScreen when pressed.
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                      },
                      child: Text('Registrar', style: TextStyle(color: Colors.white)),
                      // Styles the register button.
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF606060),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
