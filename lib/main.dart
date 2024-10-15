import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:planning_poker/firebase_options.dart';
import 'package:planning_poker/model/card_model.dart';
import 'package:planning_poker/model/repository/card_repository.dart';
import 'package:planning_poker/model/user_model.dart';
import 'package:planning_poker/view/pages/home_page.dart';
import 'package:planning_poker/view/pages/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setUrlStrategy(PathUrlStrategy());
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final currentUser = UserModel(
    id: '${DateTime.now().millisecondsSinceEpoch}',
    name: '',
    card: CardModel(value: ''),
  );

  @override
  Widget build(BuildContext context) {
    final CardRepository cardRepository = CardRepository();

    return MaterialApp(
      routes: {
        '/': (context) => const RegisterPage(),
      },
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/table') {
          final args = settings.arguments as List;
          final table = args[0] as String;
          currentUser.name = args[1] as String;

          return MaterialPageRoute(
            builder: (context) {
              return HomePage(
                tableId: table,
                currentUser: currentUser,
                cardRepository: cardRepository,
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
