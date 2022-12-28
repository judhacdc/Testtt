class Biodata {
  int? id;
  int? nim;
  String? nama;
  String? nohp;
  String? address;
  String? gender;

  Biodata({this.id, this.nim, this.nama, this.nohp, this.address, this.gender});

  Biodata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nim = json['nim'];
    nama = json['nama'];
    nohp = json['nohp'];
    address = json['address'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['nim'] = this.nim;
    data['nama'] = this.nama;
    data['nohp'] = this.nohp;
    data['address'] = this.address;
    data['gender'] = this.gender;
    return data;
  }
}
