import 'package:flutter/material.dart';

class ContactForSupport extends StatelessWidget {
  const ContactForSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Contact for Support",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Column(
          children: [
            mediaSocial('assets/logo/facebook.png', 'Rifan Setiadi'),
            const SizedBox(
              height: 8,
            ),
            mediaSocial('assets/logo/instagram.png', '@rifanstd'),
            const SizedBox(
              height: 8,
            ),
            mediaSocial('assets/logo/twitter.png', '@rifanstd'),
            const SizedBox(
              height: 8,
            ),
            mediaSocial('assets/logo/mail.png', '@rifan.setiadi2019@students.unila.ac.id'),
          ],
        ),
      ],
    );
  }
  
  Widget mediaSocial(String imgUrl, String title) {
    return InkWell(
      onTap: () {},
      highlightColor: Colors.blue.withOpacity(0.3),
      splashColor: Colors.grey.withOpacity(0.5),
      child: Ink(
        child: Row(
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: Image.asset(imgUrl),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(title,
                  style: const TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}
