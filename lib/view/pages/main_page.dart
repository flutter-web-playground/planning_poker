import 'package:flutter/material.dart';
import 'package:planning_poker/core/custom_theme_data.dart';
import 'package:planning_poker/main.dart';
import 'package:planning_poker/model/card_model.dart';
import 'package:planning_poker/model/repository/card_repository.dart';
import 'package:planning_poker/model/user_model.dart';
import 'package:planning_poker/view/pages/home_page.dart';
import 'package:planning_poker/view/pages/register_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final currentUser = UserModel(
    id: '${DateTime.now().millisecondsSinceEpoch}',
    name: sharedPreferences.getString('userName') ?? '',
    card: CardModel(value: ''),
  );

  final CardRepository cardRepository = CardRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
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
        currentUser.name = sharedPreferences.getString('userName') ?? '';

        if (uri.path == '/') {
          if (currentUser.name.isEmpty) {
            return MaterialPageRoute(
              builder: (context) {
                return RegisterPage(
                  tableId: currentUser.tableId,
                );
              },
            );
          }

          if (currentUser.tableId.isNotEmpty && currentUser.name.isNotEmpty) {
            return MaterialPageRoute(
              builder: (context) {
                return HomePage(
                  currentUser: currentUser,
                  cardRepository: cardRepository,
                );
              },
            );
          }
        }

        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
