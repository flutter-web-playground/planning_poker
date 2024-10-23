import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:go_router/go_router.dart';
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

  final CardRepository cardRepository = CardRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) {
              return const RegisterPage(
                tableId: '',
              );
            },
            routes: <RouteBase>[
              GoRoute(
                path: '/table/:id',
                name: 'table',
                builder: (BuildContext context, GoRouterState state) {
                  String userName = '';
                  currentUser.tableId = state.pathParameters['id'] ?? '';

                  if (state.extra != null) {
                    Map<String, dynamic> extra =
                        state.extra as Map<String, dynamic>;

                    if (extra['userName'].isEmpty) {
                      return RegisterPage(tableId: currentUser.tableId);
                    }
                    userName = extra['userName'];
                  } else {
                    return RegisterPage(tableId: currentUser.tableId);
                  }

                  currentUser.name = userName;
                  return HomePage(
                    currentUser: currentUser,
                    cardRepository: cardRepository,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
