import 'package:flutter/material.dart';
import 'package:iaunila/models/models.dart';

class LulusanTerbaikCard extends StatefulWidget {
  final AlumniModel lulusan;
  const LulusanTerbaikCard({Key? key, required this.lulusan}) : super(key: key);

  @override
  State<LulusanTerbaikCard> createState() => _LulusanTerbaikCardState();
}

class _LulusanTerbaikCardState extends State<LulusanTerbaikCard> {
  String? nama_prodi = null;

  @override
  void initState() {
    DetailProdiModel.showNamaProdi(widget.lulusan.id_prodi.toString()).then((value) {
      setState(() {
        nama_prodi = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      padding: const EdgeInsets.only(top: 20, left: 29, right: 29, bottom: 24),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFECECEC),
      ),
      constraints: const BoxConstraints.expand(width: 340),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  widget.lulusan.nama_alumni!.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 200,
                child: Text(
                  (nama_prodi != null ? nama_prodi.toString() : 'Loading'),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              SizedBox(
                child: Text(
                  "IPK : ${widget.lulusan.ipk.toString()}",
                  style: const TextStyle(
                    backgroundColor: Colors.yellow,
                    color: Colors.green,
                  ),
                ),
              ),
              SizedBox(
                child: Text(
                  "Lama Studi : ${widget.lulusan.lama_study!/12} Tahun",
                  style: const TextStyle(
                    backgroundColor: Colors.green,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            height: 100,
            child: Image.asset(
              'assets/logo/lulusan_terbaik.png',
              width: 70,
              height: 70,
            ),
          ),
        ],
      ),
    );
  }
}

