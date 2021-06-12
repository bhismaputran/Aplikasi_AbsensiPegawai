import 'dart:convert';
import 'model/absen.dart';
import 'package:http/http.dart' as http;

class ApiAbsen {
  final url = 'http://localhost:8080/db_absenpegawai/daftar_pegawai.php';
  Future<List<Absen>?> getAbsenAll() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return absenFromJson(response.body);
    } else {
      print("Error ${response.toString()}");
      return null;
    }
  }

  //Cek Absen
  Future<Absen?> cek_absen(String email) async {
    final response = await http.get(Uri.parse(
        'http://localhost:8080/db_absenpegawai/cek_absen.php?email=$email'));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return Absen.fromJson(result[0]);
    } else {
      print("Error ${response.toString()}");
      return null;
    }
  }

  //Update Kehadiran
  Future<bool> update_absen(Absen absen) async {
    final response = await http.get(Uri.parse(
        'http://localhost:8080/db_absenpegawai/update_status.php?pegawai_id=$pegawai_id'));
    if (response.statusCode == 200)
      return true;
    else
      return false;
  }

  //Reset Kehadiran
  Future<bool> reset_absen() async {
    final response = await http.get(
        Uri.parse('http://localhost:8080/db_absenpegawai/reset_absen.php'));
    if (response.statusCode == 200)
      return true;
    else
      return false;
  }
}
