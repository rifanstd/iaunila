import 'package:flutter/material.dart';
import 'package:iaunila/components/components.dart';

class SupportDeveloperScreen extends StatelessWidget {
  const SupportDeveloperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, bottom: 80),
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                  bottomLeft: Radius.circular(70),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset('assets/logo/support.png'),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  GiveUsSupport(),
                  SizedBox(
                    height: 16,
                  ),
                  ContactForSupport(),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
