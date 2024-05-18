import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../servies/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = "loading";
  Future<void> setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Berlin", flag: "germany.png", url: "Europe/Berlin");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDaytime": instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        body: const Center(
          child: SpinKitSpinningLines(
            color: Colors.white,
            size: 50.0,
          ),
        ));
  }
}
