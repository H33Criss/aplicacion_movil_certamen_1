import 'package:flutter/material.dart';

class AsesinoById extends StatelessWidget {
  final int id;
  const AsesinoById({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información'),
      ),
      body: Center(child: Text('$id')),
    );
  }
}
