class Biodata {
  int?id;
  int? nim;
  String? nama;
  int? no_hp;
  String? address;
  String? gender;

  Biodata({this.id, this.nim, this.nama, this.no_hp ,this.address, this.gender});

  Biodata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nim = json['nim'];
    nama = json['nama'];
    no_hp = json['no_hp'];
    address = json['address'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['nim'] = this.nim;
    data['nama'] = this.nama;
    data['no_hp'] = this.no_hp;
    data['address'] = this.address;
    data['gender'] = this.gender;
    return data;
  }
}
