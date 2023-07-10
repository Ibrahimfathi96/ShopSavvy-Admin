import 'package:flutter/material.dart';

class AddItems extends StatelessWidget {
  static const String routeName = '/add-item';
  const AddItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Container(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
