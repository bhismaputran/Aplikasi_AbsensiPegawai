import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'model/absen.dart';
import 'webservice/api_absenpegawai.dart';

class DaftarPegawai extends StatefulWidget {
  const DaftarPegawai({Key? key}) : super(key: key);

  @override
  _DaftarPegawaiState createState() => _DaftarPegawaiState();
}

class _DaftarPegawaiState extends State<DaftarPegawai> {
  ApiAbsen? apiAbsen;
  @override
  void initState() {
    super.initState();
    apiAbsen = ApiAbsen();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: FutureBuilder<List<Absen>?>(
          future: apiAbsen!.getAbsenAll(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Absen>?> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error.toString());
              return Center(
                child: Text('Error ${snapshot.error.toString()}'),
              );
            } else if (snapshot.hasData) {
              List<Absen>? _absen = snapshot.data;
              if (_absen != null)
                return _buildListView(_absen);
              else
                return Text('Kosong');
            } else
              return CircularProgressIndicator();
          },
        ));
  }

  Widget _buildListView(List<Absen> absen) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Guru"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 7,
                child: ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: absen.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(absen[index].nama),
                          leading: Icon(Icons.people),
                          trailing: Icon(
                            Icons.star,
                            color: absen[index].statusDatang == '1'
                                ? Colors.blue
                                : Colors.black12,
                          ),
                        ),
                      );
                    })),
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      apiAbsen!.reset_absen();
                      setState(() {});
                    },
                    child: Text("Reset Absen")))
          ],
        ),
      ),
    );
  }
}
