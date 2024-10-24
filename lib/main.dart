import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:planning_poker/firebase_options.dart';
import 'package:planning_poker/model/card_model.dart';
import 'package:planning_poker/model/repository/card_repository.dart';
import 'package:planning_poker/model/user_model.dart';
import 'package:planning_poker/view/pages/home_page.dart';
import 'package:planning_poker/view/pages/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  sharedPreferences = await SharedPreferences.getInstance();

  setUrlStrategy(PathUrlStrategy());
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final currentUser = UserModel(
    id: '${DateTime.now().millisecondsSinceEpoch}',
    name: sharedPreferences.getString('userName') ?? '',
    card: CardModel(value: ''),
  );

  final CardRepository cardRepository = CardRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const RegisterPage(
              tableId: '',
            ),
      },
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final uri = Uri.parse(settings.name!);
        final queryParameters = uri.queryParametersAll;

        currentUser.tableId = queryParameters['id']?.first ?? '';
        if (currentUser.name.isEmpty) {
          return MaterialPageRoute(
            builder: (context) {
              return RegisterPage(
                tableId: currentUser.tableId,
              );
            },
          );
        }

        if (uri.path == '/table') {
          return MaterialPageRoute(
            builder: (context) {
              return HomePage(
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
