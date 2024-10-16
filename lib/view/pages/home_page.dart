import 'package:planning_poker/model/table_model.dart';
import 'package:planning_poker/view_model/show_cards_view_model.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:planning_poker/model/repository/card_repository.dart';
import 'package:planning_poker/model/user_model.dart';
import 'package:planning_poker/view/widgets/bottom_table_widget.dart';
import 'package:planning_poker/view/widgets/left_table_widget.dart';
import 'package:planning_poker/view/widgets/right_table_widget.dart';
import 'package:planning_poker/view/widgets/select_cards_widgets.dart';
import 'package:planning_poker/view/widgets/table_widget.dart';
import 'package:planning_poker/view/widgets/top_table_widget.dart';
import 'package:planning_poker/view_model/bottom_table_view_model.dart';
import 'package:planning_poker/view_model/left_table_view_model.dart';
import 'package:planning_poker/view_model/right_table_view_model.dart';
import 'package:planning_poker/view_model/top_table_view_model.dart';
import 'package:flutter/foundation.dart';

class HomePage extends StatefulWidget {
  final UserModel currentUser;
  final CardRepository cardRepository;

  const HomePage({
    super.key,
    required this.currentUser,
    required this.cardRepository,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ShowCardsViewModel showCardsViewModel;

  @override
  void initState() {
    showCardsViewModel = ShowCardsViewModel(
      tableModel: TableModel(id: widget.currentUser.tableId),
      repository: widget.cardRepository,
    );

    widget.cardRepository.addUserOnTable(
      user: widget.currentUser,
      tableId: widget.currentUser.tableId,
    );

    if (kIsWeb) {
      html.window.onBeforeUnload.listen((event) async {
        widget.cardRepository.deleteUserOnTable(user: widget.currentUser);
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    widget.cardRepository.deleteUserOnTable(user: widget.currentUser);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 112,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.currentUser.name),
                IconButton(
                  onPressed: () {
                    widget.currentUser.specter = !widget.currentUser.specter;
                    widget.currentUser.card.value = '';
                    widget.cardRepository.updateUser(user: widget.currentUser);
                    setState(() {});
                  },
                  icon: widget.currentUser.specter
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.remove_red_eye_outlined),
                ),
              ],
            ),
            Text(
              widget.currentUser.tableId,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.fill,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TopTableWidget(
                    showCardsViewModel: showCardsViewModel,
                    topTableViewModel: TopTableViewModel(
                      tableModel: showCardsViewModel.tableModel,
                      repository: widget.cardRepository,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LeftTableWidget(
                        showCardsViewModel: showCardsViewModel,
                        leftTableViewModel: LeftTableViewModel(
                          tableModel: showCardsViewModel.tableModel,
                          repository: widget.cardRepository,
                        ),
                      ),
                      TableWidget(
                        showCardsViewModel: showCardsViewModel,
                      ),
                      RightTableWidget(
                        showCardsViewModel: showCardsViewModel,
                        rightTableViewModel: RightTableViewModel(
                          tableModel: showCardsViewModel.tableModel,
                          repository: widget.cardRepository,
                        ),
                      ),
                    ],
                  ),
                  BottomTableWidget(
                    showCardsViewModel: showCardsViewModel,
                    bottomTableViewModel: BottomTableViewModel(
                      tableModel: showCardsViewModel.tableModel,
                      repository: widget.cardRepository,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            if (!widget.currentUser.specter)
              SelectCardWidget(
                user: widget.currentUser,
                cardRepository: widget.cardRepository,
                showCardsViewModel: showCardsViewModel,
              ),
          ],
        ),
      ),
    );
  }
}
