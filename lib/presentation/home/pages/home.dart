import 'package:flutter/material.dart';
import 'package:topshop/presentation/home/widgets/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
          ],
        ),
      ),
    );
  }
}
