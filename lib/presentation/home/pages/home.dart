import 'package:flutter/material.dart';
import 'package:topshop/presentation/home/widgets/categories.dart';
import 'package:topshop/presentation/home/widgets/header.dart';
import 'package:topshop/presentation/home/widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 24.0),
            SearchField(),
            SizedBox(height: 24.0),
            Categories(),
          ],
        ),
      ),
    );
  }
}
