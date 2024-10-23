import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planning_poker/main.dart';

class RegisterPage extends StatelessWidget {
  final String tableId;

  const RegisterPage({
    super.key,
    required this.tableId,
  });

  @override
  Widget build(BuildContext context) {
    final tableController = TextEditingController(text: tableId);
    final nameController = TextEditingController(text: sharedPreferences.getString('userName'));

    return Scaffold(
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Informe seu nome.',
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: tableId.isEmpty,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 250,
                    child: TextFormField(
                      controller: tableController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: 'Informe o código da mesa.',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilledButton(
                  onPressed: () {
                    sharedPreferences.setString('userName', nameController.text);
                    context.goNamed(
                      'table',
                      pathParameters: {
                        'id': tableController.text,
                      },
                      extra: {
                        'userName': nameController.text,
                      },
                    );
                  },
                  child: const Text('Entrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
