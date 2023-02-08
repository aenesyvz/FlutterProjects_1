import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key,required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 18 : 9,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? Colors.purple.shade600:Colors.grey.withOpacity(0.6),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}