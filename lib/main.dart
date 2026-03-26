import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

void main() => runApp(const AlaBurgerApp());

class AlaBurgerTheme {
  static const Color carbon = Color(0xFF121212);
  static const Color acero = Color(0xFF333333);
  static const Color fuegoPuro = Color(0xFFFF5722);
  static const Color llamaAmarilla = Color(0xFFFFC107);

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: carbon,
    colorScheme: const ColorScheme.dark(
      primary: fuegoPuro,
      secondary: llamaAmarilla,
      surface: acero,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: acero,
      labelStyle: const TextStyle(color: Colors.grey),
      prefixIconColor: fuegoPuro,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: fuegoPuro, width: 2),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: fuegoPuro,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        elevation: 5,
      ),
    ),
  );
}

class AlaBurgerApp extends StatelessWidget {
  const AlaBurgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ALABURGER al Carbon',
      theme: AlaBurgerTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const BienvenidosScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}

// --- PANTALLA BIENVENIDOS ---
class BienvenidosScreen extends StatelessWidget {
  const BienvenidosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://raw.githubusercontent.com/cbtis122-santiago/IAMoviles-UII-Act-5-GridView-2-X-7-Firebase-studio-FSCC-/refs/heads/main/logo.jfif',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [AlaBurgerTheme.carbon, AlaBurgerTheme.carbon, Colors.transparent],
                  stops: const [0.0, 0.4, 1.0],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FadeInDown(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AlaBurgerTheme.fuegoPuro, width: 3), color: AlaBurgerTheme.carbon),
                      child: const Icon(Icons.local_fire_department_rounded, size: 80, color: AlaBurgerTheme.llamaAmarilla),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeInLeft(child: const Text("ALABURGER", style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900, color: Colors.white))),
                  FadeInRight(child: const Text("al Carbón", style: TextStyle(fontSize: 22, color: AlaBurgerTheme.llamaAmarilla, fontStyle: FontStyle.italic))),
                  const SizedBox(height: 50),
                  FadeInUp(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AlaBurgerTheme.carbon),
                      child: const Text("INICIAR SESIÓN"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeInUp(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pushNamed(context, '/signup'),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 55),
                        side: const BorderSide(color: AlaBurgerTheme.fuegoPuro, width: 2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("REGISTRARSE"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- PANTALLA LOGIN ---
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Container(color: AlaBurgerTheme.carbon)),
          Positioned(top: -50, right: -50, child: FadeInDown(child: Icon(Icons.local_fire_department_rounded, size: 200, color: AlaBurgerTheme.fuegoPuro))),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BackButton(color: Colors.white),
                  FadeInDown(child: const Text("Bienvenido\nde vuelta", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: Colors.white))),
                  const SizedBox(height: 50),
                  FadeInLeft(child: const TextField(decoration: InputDecoration(labelText: "Email Master", prefixIcon: Icon(Icons.email_outlined)))),
                  const SizedBox(height: 20),
                  FadeInLeft(child: const TextField(obscureText: true, decoration: InputDecoration(labelText: "Password", prefixIcon: Icon(Icons.lock_outline)))),
                  const SizedBox(height: 30),
                  Pulse(
                    infinite: true,
                    child: ElevatedButton(onPressed: () {}, child: const Text("¡A COMER!")),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- PANTALLA SIGNUP ---
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const BackButton(color: Colors.white),
            FadeInDown(child: const Text("Nueva Cuenta", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: Colors.white))),
            const SizedBox(height: 30),
            _buildInput("Nombre", Icons.person_outline),
            _buildInput("Email", Icons.email_outlined),
            _buildInput("Password", Icons.lock_outline, isPass: true),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: () {}, child: const Text("REGISTRARME")),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(String label, IconData icon, {bool isPass = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: FadeInUp(
        child: TextField(
          obscureText: isPass,
          decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon)),
        ),
      ),
    );
  }
}