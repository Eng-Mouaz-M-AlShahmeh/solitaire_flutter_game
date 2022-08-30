/* Developed by: Eng. Mouaz M. AlShahmeh */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'board_info.dart';
import 'stack_widgets/card_stack.dart';
import 'stack_widgets/foundation_stack.dart';
import 'stack_widgets/stock_stack.dart';
import 'stack_widgets/tableau_stack.dart';
import 'stack_widgets/talon_stack.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solitaire Flutter Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Solitaire Flutter Game',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    initializeDeck();
  }

  @override
  Widget build(BuildContext context) {
    cardSpacing = (MediaQuery.of(context).size.width) > 750 ? 10.0 : 2.0;
    cardWidth = (MediaQuery.of(context).size.width - (7.0 * cardSpacing)) / 7.0;
    cardHeight = cardWidth * 1.42;
    itemScale = (MediaQuery.of(context).size.width / 375.0);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => foundationStack1),
          ChangeNotifierProvider(create: (_) => foundationStack2),
          ChangeNotifierProvider(create: (_) => foundationStack3),
          ChangeNotifierProvider(create: (_) => foundationStack4),
          ChangeNotifierProvider(create: (_) => stockStack),
          ChangeNotifierProvider(create: (_) => talonStack),
          ChangeNotifierProvider(create: (_) => tableauStack1),
          ChangeNotifierProvider(create: (_) => tableauStack2),
          ChangeNotifierProvider(create: (_) => tableauStack3),
          ChangeNotifierProvider(create: (_) => tableauStack4),
          ChangeNotifierProvider(create: (_) => tableauStack5),
          ChangeNotifierProvider(create: (_) => tableauStack6),
          ChangeNotifierProvider(create: (_) => tableauStack7),
        ],
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: const Color(0xFF004D2C),
          ),
          backgroundColor: const Color(0xFF004D2C),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: const Color(0xFF004D2C),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          dealCards();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: scaled(2)),
                          child: Text(
                            "New Game",
                            style: TextStyle(
                              fontSize: scaled(16),
                              fontFamily: gameFontFamily,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.0,
                    height: 24.0 * itemScale,
                  ),
                  SizedBox(
                    width: 10.0,
                    height: scaled(18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: scaled(2), right: scaled(2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.58,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: scaled(2)),
                                child: Consumer<FoundationStack1>(
                                    builder: (context, stack, _) =>
                                        FoundationStackWidget(
                                            foundationStack: stack)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: scaled(2)),
                                child: Consumer<FoundationStack2>(
                                    builder: (context, stack, _) =>
                                        FoundationStackWidget(
                                            foundationStack: stack)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: scaled(2)),
                                child: Consumer<FoundationStack3>(
                                    builder: (context, stack, _) =>
                                        FoundationStackWidget(
                                            foundationStack: stack)),
                              ),
                              Consumer<FoundationStack4>(
                                  builder: (context, stack, _) =>
                                      FoundationStackWidget(
                                          foundationStack: stack)),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Consumer<TalonStack>(
                                builder: (context, stack, _) =>
                                    TalonStackWidget(talonStack: stack)),
                            Consumer<StockStack>(
                                builder: (context, stack, _) =>
                                    StockStackWidget(stockStack: stack)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                    height: scaled(16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: scaled(2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Consumer<TableauStack1>(
                              builder: (context, stack, _) =>
                                  TableauStackWidget(tableauStack: stack)),
                        ),
                        Expanded(
                          child: Consumer<TableauStack2>(
                              builder: (context, stack, _) =>
                                  TableauStackWidget(tableauStack: stack)),
                        ),
                        Expanded(
                          child: Consumer<TableauStack3>(
                              builder: (context, stack, _) =>
                                  TableauStackWidget(tableauStack: stack)),
                        ),
                        Expanded(
                          child: Consumer<TableauStack4>(
                              builder: (context, stack, _) =>
                                  TableauStackWidget(tableauStack: stack)),
                        ),
                        Expanded(
                          child: Consumer<TableauStack5>(
                              builder: (context, stack, _) =>
                                  TableauStackWidget(tableauStack: stack)),
                        ),
                        Expanded(
                          child: Consumer<TableauStack6>(
                              builder: (context, stack, _) =>
                                  TableauStackWidget(tableauStack: stack)),
                        ),
                        Expanded(
                          child: Consumer<TableauStack7>(
                              builder: (context, stack, _) =>
                                  TableauStackWidget(tableauStack: stack)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
