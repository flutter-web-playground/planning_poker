import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:planning_poker/firebase_options.dart';
import 'package:planning_poker/model/card_model.dart';
import 'package:planning_poker/model/user_model.dart';
import 'package:planning_poker/view/pages/home_page.dart';
import 'package:planning_poker/view/pages/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final loginInstance = FirebaseAuth.instanceFor(
    app: Firebase.app(),
  );

  await loginInstance.createUserWithEmailAndPassword(
      email: '${loginInstance.hashCode}@email.com', password: '123456');

  setUrlStrategy(PathUrlStrategy());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const RegisterPage(),
      },
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/table') {
          final args = settings.arguments as List;
          final table = args[0] as String;
          final name = args[1] as String;

          final currentUser = UserModel(
            id: '${DateTime.now().millisecondsSinceEpoch}',
            name: name,
            card: CardModel(value: ''),
          );

          return MaterialPageRoute(
            builder: (context) {
              return HomePage(
                tableId: table,
                currentUser: currentUser,
              );
            },
          );
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
