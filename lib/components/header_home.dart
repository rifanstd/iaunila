import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding:
      const EdgeInsets.only(top: 30, right: 20, bottom: 20, left: 20),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(
                width: 200,
                child: Text(
                  "Informasi Akademik Universitas Lampung",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  "Adalah aplikasi yang memberikan informasi terkait Akademik Universitas Lampung",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            child: Image.asset(
              "assets/logo/unila.png",
              width: 150,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}
