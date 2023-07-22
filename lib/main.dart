import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:planning_poker/table_controller.dart';
import 'package:planning_poker/widgets/card_widget.dart';
import 'package:planning_poker/widgets/table_widget.dart';
import 'package:planning_poker/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUrlStrategy(PathUrlStrategy());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TableController controller = TableController(false);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                height: 50,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      1,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CardWidget(
                          width: 50,
                          height: 90,
                          value: index,
                          controller: controller,
                          rotationX: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 50,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Column(
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CardWidget(
                              width: 90,
                              height: 60,
                              value: index,
                              controller: controller,
                              rotationX: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TableWidget(
                    controller: controller,
                  ),
                  SizedBox(
                    height: 200,
                    width: 50,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Column(
                        children: List.generate(
                          1,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CardWidget(
                              width: 90,
                              height: 60,
                              value: index,
                              controller: controller,
                              rotationX: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 400,
                height: 50,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      10,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CardWidget(
                          width: 60,
                          height: 90,
                          value: index,
                          controller: controller,
                          rotationX: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
