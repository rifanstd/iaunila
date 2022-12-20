import 'package:flutter/material.dart';
import 'package:iaunila/api/iaunila_service.dart';
import 'package:iaunila/screens/screens.dart';

class Menu extends StatelessWidget {
  final List icon = [
    'mahasiswa.png',
    'prodi.png',
    'jurusan.png',
    'fakultas.png',
    'buku_ajar.png',
    'alumni.png',
    'mata_kuliah.png',
    'peserta_kelas.png',
    'buku_referensi.png',
    'penelitian.png'
  ];

  final List title = [
    'Mahasiswa',
    'Program Studi',
    'Jurusan',
    'Fakultas',
    'Buku Ajar',
    'Alumni',
    'Mata Kuliah',
    'Peserta Kelas',
    'Buku Referensi',
    'Penelitian'
  ];

  // final List<Material> myIcon = List.generate(
  //   10,
  //   (index) {
  //
  //
  //
  //
  //     return Material(
  //       borderRadius: BorderRadius.circular(20),
  //       elevation: 4,
  //       child: Container(
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(20),
  //         ),
  //         height: 40,
  //         width: 40,
  //         child: GestureDetector(
  //           onTap: () {
  //             Navigator.push(context, MaterialPageRoute(builder: (context) {
  //               return Menu();
  //             }));
  //             print('Menu ${title[index]} di kLik');
  //           },
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               SizedBox(
  //                 width: 40,
  //                 height: 40,
  //                 child: Image.asset(
  //                   'assets/logo/${icon[index]}',
  //                   width: 40,
  //                   height: 40,
  //                 ),
  //               ),
  //               SizedBox(
  //                 width: 70,
  //                 child: Text(
  //                   title[index],
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(fontSize: 13),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   },
  // );

  Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(left: 10, right: 10),
      height: 320,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
        ),
        children: [
          MenuItem(context, 0),
          MenuItem(context, 1),
          MenuItem(context, 2),
          MenuItem(context, 3),
          MenuItem(context, 4),
          MenuItem(context, 5),
          MenuItem(context, 6),
          MenuItem(context, 7),
        ],
      ),
    );
  }

  Widget MenuItem(BuildContext context, int index) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        height: 40,
        width: 40,
        child: GestureDetector(
          onTap: () {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const MahasiswaScreen();
                  },
                ),
              );
            }
            else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const ProdiScreen();
                  },
                ),
              );
            }
            print('Menu ${title[index]} di kLik');
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: Image.asset(
                  'assets/logo/${icon[index]}',
                  width: 40,
                  height: 40,
                ),
              ),
              SizedBox(
                width: 70,
                child: Text(
                  title[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
