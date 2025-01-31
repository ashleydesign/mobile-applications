import 'package:flutter/material.dart';

class DestinationWidget extends StatelessWidget {
  const DestinationWidget({super.key, required this.destinationName});
  final String destinationName;

  
  @override
  Widget build(BuildContext context) {
    return Text(destinationName);
  }
}

