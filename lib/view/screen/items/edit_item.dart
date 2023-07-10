import 'package:flutter/material.dart';

class EditItems extends StatelessWidget {
  static const String routeName = '/edit_item';
  const EditItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Items'),
      ),
      body: Container(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
