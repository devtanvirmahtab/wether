import 'package:flutter/cupertino.dart';

class HorizontalPadding extends StatelessWidget {
  const HorizontalPadding({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: child,
    );
  }
}
