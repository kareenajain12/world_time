import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    String bgImage = data["isDaytime"] ? "day.png" : "night.png";
    Color bgColor = data["isDaytime"] ? Colors.blue : Colors.indigo.shade700;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assests/$bgImage"),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, "/location");
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDaytime': result['isDaytime'],
                      'flag': result['flag'],
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                ),
                label: const Text(" Edit Location"),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data["location"],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      letterSpacing: 2,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                data["time"],
                style: const TextStyle(fontSize: 66.0, color: Colors.white),
              )
            ],
          ),
        ),
      )),
    );
  }
}
