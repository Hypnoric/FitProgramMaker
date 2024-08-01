import 'package:flutter/material.dart';
import 'package:program_maker/widget/big_card.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    
    return Builder(
      builder: (context) {
        return Scaffold(
          body: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigCard(text: "Monday"),
                    SizedBox(height: 10),
                    BigCard(text: "1"),
                    BigCard(text: "2"),
                    BigCard(text: "3"),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigCard(text: "Monday"),
                    SizedBox(height: 10),
                    BigCard(text: "1"),
                    BigCard(text: "2"),
                    BigCard(text: "3"),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
