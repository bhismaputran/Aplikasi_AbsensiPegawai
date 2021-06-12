import 'dart:convert';

List<Absen> absenFromJson(String str) =>
    List<Absen>.from(json.decode(str).map((x) => Absen.fromJson(x)));

class Absen {
  String pegawaiId;
  String email;
  String nama;
  String statusDatang;
  String foto;

  Absen({
    required this.pegawaiId,
    required this.email,
    required this.nama,
    required this.statusDatang,
    required this.foto,
  });

  factory Absen.fromJson(Map<String, dynamic> json) => Absen(
        pegawaiId: json["pegawai_id"],
        email: json["email"],
        nama: json["nama"],
        statusDatang: json["status_datang"],
        foto: json["foto"],
      );

  Map<String, dynamic> toJson() => {
        "pegawai_id": pegawaiId,
        "email": email,
        "nama": nama,
        "status_datang": statusDatang,
        "foto": foto,
      };
}
