import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  const SmallCard({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onSecondary,
      fontSize: 15,
    );

    return Card(
      color: theme.colorScheme.tertiary,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(text, style: style),
      ),
    );
  }
}
