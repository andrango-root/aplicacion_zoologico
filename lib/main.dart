import 'package:flutter/material.dart';

void main() {
  runApp(MyZooApp());
}

class MyZooApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoológico Quito',
      theme: ThemeData(
        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.orangeAccent,
        ),
        scaffoldBackgroundColor: Colors.lightGreen[50],
        textTheme: TextTheme(
          headlineLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green[900]),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text('Zoológico Quito'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20), // Espacio superior
          // Agregamos el logo del zoológico en la parte superior
          Image.asset(
            'assets/images/zoo_logo.JPG', // Ruta corregida
            height: 100,
          ),
          SizedBox(height: 40), // Espacio entre el logo y el botón
          // Botón centrado
          Expanded(
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AnimalListScreen()),
                  );
                },
                child: Text('Nuestros animales'),
              ),
            ),
          ),
          // Ubicación y contacto en la parte inferior
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Colors.green[700]),
                    SizedBox(width: 8),
                    Text(
                      'Ubicación: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.green[800],
                      ),
                    ),
                    Text(
                      'Quito, Ecuador',
                      style: TextStyle(fontSize: 18, color: Colors.green[800]),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone, color: Colors.green[700]),
                    SizedBox(width: 8),
                    Text(
                      'Contacto: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.green[800],
                      ),
                    ),
                    Text(
                      '0999999999',
                      style: TextStyle(fontSize: 18, color: Colors.green[800]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Pantalla que muestra la lista de animales
class AnimalListScreen extends StatelessWidget {
  final List<Map<String, String>> animales = [
    {
      'nombre': 'León',
      'descripcion': 'El león es conocido como el rey de la selva.',
      'imagen': 'assets/images/leon.JPG' // Ruta corregida
    },
    {
      'nombre': 'Elefante',
      'descripcion': 'El elefante es el animal terrestre más grande.',
      'imagen': 'assets/images/elefante.JPG' // Ruta corregida
    },
    {
      'nombre': 'Jirafa',
      'descripcion': 'La jirafa es el animal más alto del mundo.',
      'imagen': 'assets/images/jirafa.JPG' // Ruta corregida
    },
    {
      'nombre': 'Tigre',
      'descripcion': 'El tigre es un feroz depredador con hermosas rayas.',
      'imagen': 'assets/images/tigre.JPG' // Ruta corregida
    },
    {
      'nombre': 'Cebra',
      'descripcion':
          'Las cebras tienen un pelaje único con rayas blancas y negras.',
      'imagen': 'assets/images/cebra.JPG' // Ruta corregida
    },
    {
      'nombre': 'Pingüino',
      'descripcion':
          'El pingüino es un ave que no vuela, pero nada muy bien en el agua.',
      'imagen': 'assets/images/pinguino.JPG' // Ruta corregida
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text('Zoológico Quito'),
      ),
      body: ListView.builder(
        itemCount: animales.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            color: Colors.lightGreen[100],
            elevation: 4,
            child: ListTile(
              leading: Image.asset(animales[index]['imagen']!,
                  width: 50, height: 50),
              title: Text(animales[index]['nombre']!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text(animales[index]['descripcion']!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimalDetailScreen(
                      nombre: animales[index]['nombre']!,
                      descripcion: animales[index]['descripcion']!,
                      imagen: animales[index]['imagen']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Pantalla de Detalles del Animal
class AnimalDetailScreen extends StatelessWidget {
  final String nombre;
  final String descripcion;
  final String imagen;

  AnimalDetailScreen(
      {required this.nombre, required this.descripcion, required this.imagen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text(nombre),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(imagen, height: 250, fit: BoxFit.cover), // Ruta corregida
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              descripcion,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Atrás'),
          ),
        ],
      ),
    );
  }
}
