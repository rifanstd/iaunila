import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iaunila/components/components.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int stopper = 1;

  @override
  void initState() {
    // TODO: implement initState

    // timer untuk meload data lulusan terbaik
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (stopper == 3) {
        timer.cancel();
      } else {
        setState(() {
          stopper++;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderHome(),
          const SizedBox(
            height: 33,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 29, right: 29, bottom: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Lulusan Terbaik Tahun Ini",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Indikator : IPK Tertinggi (Ilmu Komputer)",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          LulusanTerbaik(),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: const Text(
              "Menu",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ),
          Menu(),
        ],
      ),
    );
  }
}
