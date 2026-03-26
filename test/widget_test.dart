import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart'; // ASEGÚRATE QUE ESTO COINCIDA CON EL NOMBRE DE TU PROYECTO

void main() {
  testWidgets('Verificar carga de Bienvenidos', (WidgetTester tester) async {
    // Carga la app
    await tester.pumpWidget(const AlaBurgerApp());

    // Verifica que el texto principal de tu negocio aparezca
    expect(find.text('ALABURGER'), findsOneWidget);
    
    // Verifica que existan los botones principales
    expect(find.text('INICIAR SESIÓN'), findsOneWidget);
    expect(find.text('REGISTRARSE'), findsOneWidget);
  });
}