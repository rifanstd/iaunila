import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Column(
          children: [
            InkWell(
              onTap: () {
              },
              highlightColor: Colors.blue.withOpacity(0.3),
              splashColor: Colors.grey.withOpacity(0.5),
              child: Ink(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset('assets/logo/facebook.png'),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        "@OfficialUnila",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {},
              highlightColor: Colors.blue.withOpacity(0.3),
              splashColor: Colors.grey.withOpacity(0.5),
              child: Ink(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset('assets/logo/instagram.png'),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text("@official_unila",
                          style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {},
              highlightColor: Colors.blue.withOpacity(0.3),
              splashColor: Colors.grey.withOpacity(0.5),
              child: Ink(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset('assets/logo/twitter.png'),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text("@official_unila",
                          style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {},
              highlightColor: Colors.blue.withOpacity(0.3),
              splashColor: Colors.grey.withOpacity(0.5),
              child: Ink(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset('assets/logo/mail.png'),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text("humas@kpa.unila.ac.id",
                          style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
