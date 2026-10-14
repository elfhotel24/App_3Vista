import 'package:flutter/material.dart';

void main() {
  runApp(const MiAppPresentacion());
}

class MiAppPresentacion extends StatelessWidget {
  const MiAppPresentacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Presentación',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Presentación Flutter'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Aquí irán la foto, nombre y hora
          ],
        ),
      ),
    );
  }
}

// Dentro de la Column
CircleAvatar(
  radius: 80,
  backgroundImage: const AssetImage('assets/mi_foto.jpg'),
),
const SizedBox(height: 20),

Text(
  'Nombre: [Tu Nombre Completo]',
  style: const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  ),
),
const SizedBox(height: 10),


// Al inicio de _HomeScreenState
String _currentTime = '';

@override
void initState() {
  super.initState();
  _updateTime();
  Timer.periodic(const Duration(seconds: 1), (timer) {
    _updateTime();
  });
}

void _updateTime() {
  setState(() {
    _currentTime = DateTime.now().toString().substring(0, 19).replaceAll('T', ' ');
  });
} 
Text(
  'Fecha y Hora: $_currentTime',
  style: const TextStyle(fontSize: 22),
),