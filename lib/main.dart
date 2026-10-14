// app_tres_vistas/lib/main.dart
// Comentario de identificación - Nombre: Juan Pérez Pérez, Matrícula: 2023-1234
import 'package:flutter/material.dart';

void main() {
  runApp(const MiAppTresVistas());
}

class MiAppTresVistas extends StatelessWidget {
  const MiAppTresVistas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App 3 Vistas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PantallaPresentacion(),
    );
  }
}

// ================= VISTA 1: PRESENTACIÓN =================
class PantallaPresentacion extends StatelessWidget {
  const PantallaPresentacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Presentación')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Aquí debes poner tu foto real (cambia 'assets/foto.jpg' por la ruta)
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/foto.jpg'),
              // si no tienes asset, usa Icon(Icons.person) mientras
            ),
            const SizedBox(height: 20),
            const Text('Juan Pérez Pérez', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const PantallaTabla())),
              child: const Text('📊 Tabla de Multiplicar'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const PantallaCuadratica())),
              child: const Text('🧮 Fórmula Cuadrática'),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= VISTA 2: TABLA DEL 1 AL 14 =================
class PantallaTabla extends StatefulWidget {
  const PantallaTabla({super.key});

  @override
  State<PantallaTabla> createState() => _PantallaTablaState();
}

class _PantallaTablaState extends State<PantallaTabla> {
  final TextEditingController _controller = TextEditingController();
  String _resultado = '';

  // Segundo comentario con matrícula - Juan Pérez, Matrícula: 2023-1234
  void _calcularTabla() {
    int? numero = int.tryParse(_controller.text);
    if (numero == null) {
      setState(() {
        _resultado = 'Ingresa un número válido';
      });
      return;
    }
    String tabla = '';
    for (int i = 1; i <= 14; i++) {
      tabla += '$numero x $i = ${numero * i}\n';
    }
    setState(() {
      _resultado = tabla;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tabla de Multiplicar (1 al 14)')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Ingresa un número',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularTabla,
              child: const Text('Mostrar Tabla'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_resultado, style: const TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= VISTA 3: FÓRMULA CUADRÁTICA =================
class PantallaCuadratica extends StatefulWidget {
  const PantallaCuadratica({super.key});

  @override
  State<PantallaCuadratica> createState() => _PantallaCuadraticaState();
}

class _PantallaCuadraticaState extends State<PantallaCuadratica> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();
  String _resultado = '';

  void _calcularRaices() {
    double? a = double.tryParse(_aController.text);
    double? b = double.tryParse(_bController.text);
    double? c = double.tryParse(_cController.text);

    if (a == null || b == null || c == null) {
      setState(() {
        _resultado = 'Ingresa valores numéricos válidos';
      });
      return;
    }
    if (a == 0) {
      setState(() {
        _resultado = 'El coeficiente "a" no puede ser cero (no es cuadrática)';
      });
      return;
    }

    double discriminante = b * b - 4 * a * c;
    if (discriminante < 0) {
      setState(() {
        _resultado = 'No hay raíces reales (discriminante negativo)';
      });
      return;
    }

    double x1 = (-b + sqrt(discriminante)) / (2 * a);
    double x2 = (-b - sqrt(discriminante)) / (2 * a);
    setState(() {
      _resultado = 'x₁ = ${x1.toStringAsFixed(4)}\nx₂ = ${x2.toStringAsFixed(4)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ecuación Cuadrática: ax² + bx + c = 0')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _aController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Coeficiente A'),
            ),
            TextField(
              controller: _bController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Coeficiente B'),
            ),
            TextField(
              controller: _cController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Coeficiente C'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularRaices,
              child: const Text('Calcular raíces'),
            ),
            const SizedBox(height: 20),
            Text(_resultado, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}