import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/widgets/side_manu.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: SideMenu(),
        ),
        Expanded(
          flex: 5,
          child: Container(
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}
