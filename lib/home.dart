import 'package:flutter/material.dart';
import 'daftar_pegawai.dart';
import 'scan_qr_code.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Absensi Pegawai IMBPN STORE"),
        leading: Icon(Icons.people_alt),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 1,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DaftarPegawai()));
                    },
                    child: Text(
                      "Daftar Pegawai",
                      style: TextStyle(fontSize: 40, color: Colors.cyanAccent),
                    ))),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QRViewExample()));
                    },
                    child: Text(
                      "Scan QR",
                      style: TextStyle(fontSize: 40, color: Colors.cyanAccent),
                    ))),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.people),
                        title: Text("Total Pegawai : 20"),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.people),
                        title: Text("Hadir : 20"),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.people),
                        title: Text("belum Hadir : 20"),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
