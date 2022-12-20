import 'package:flutter/material.dart';
import 'package:iaunila/components/lulusan_terbaik_card.dart';
import 'package:iaunila/models/models.dart';

class LulusanTerbaikList extends StatelessWidget {
  final List<AlumniModel> lulusans;
  const LulusanTerbaikList({Key? key, required this.lulusans})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, bottom: 24),
      width: double.maxFinite,
      height: 190,
      child: ListView.builder(
        itemCount: lulusans.length,
        itemBuilder: (context, index) {
          final lulusan = lulusans[index];

          return LulusanTerbaikCard(lulusan: lulusan);
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
