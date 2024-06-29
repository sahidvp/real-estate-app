import 'package:flutter/material.dart';

class RichTexts extends StatelessWidget {
  final List<TextSpan> textspans;
  const RichTexts({super.key,required this.textspans});

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(children: textspans));
  }
}
