
import 'package:flutter/material.dart';

class ItemsView extends StatelessWidget {
  static const String routeName = '/item-view';
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbarTitle'),
      ),
      body: Container(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
