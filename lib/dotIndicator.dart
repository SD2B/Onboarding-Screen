import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      height: 8,
      width: isActive?24:8,
      decoration: BoxDecoration(
        color: isActive? Colors.purple:Colors.white,
        border: isActive?null:Border.all(color:Colors.purple),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
