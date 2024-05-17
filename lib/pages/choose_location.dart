import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
@override
  void initState() {
    super.initState();
    print ( "int state");
  }
  @override
  Widget build(BuildContext context) {
  print ("build state run");
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("Choose a Location"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
