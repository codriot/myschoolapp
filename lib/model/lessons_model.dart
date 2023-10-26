// ignore_for_file: non_constant_identifier_names

enum Gunler {
  pazartesi,
  sali,
  carsamba,
  persembe,
  cuma,
}

class Ders {
  final String dersadi;
  final String ders_zamani;
  String? ikinci_ders_adi;
  String? ikinci_dersin_zamani;

  Ders(this.dersadi, this.ders_zamani,
      {this.ikinci_ders_adi, this.ikinci_dersin_zamani});
}

extension GunlerDersEklentisi on Gunler {
  Ders dersdata() {
    switch (this) {
      case Gunler.pazartesi:
        return pazartesiDers();
      case Gunler.sali:
        return saliDers();
      case Gunler.carsamba:
        return carsambaDers();
      case Gunler.persembe:
        return persembeDers();
      case Gunler.cuma:
        return cumaDers();
    }
  }

  Ders pazartesiDers() {
    return Ders("ONLINE\niŞ SAĞLığı ve güvenliği", "10:20-12:00",
        ikinci_ders_adi: "BiLGiSAYAR AğLARı",
        ikinci_dersin_zamani: "13:25-15:15");
  }

  Ders saliDers() {
    return Ders("PHYTON PROGRAMLAMA", "09:25-12:00",
        ikinci_ders_adi: " Veritabanı Yönetim Sistemleri ",
        ikinci_dersin_zamani: "13:25-16:00");
  }

  Ders carsambaDers() {
    return Ders("Bilgisayar Organizasyonu", "09:25-12:00",
        ikinci_ders_adi: "ONLINE SECMELi EKOLOJi",
        ikinci_dersin_zamani: "15:15-16:55");
  }

  Ders persembeDers() {
    return Ders("DERS YOK", "-");
  }

  Ders cumaDers() {
    return Ders("Biçimsel Diller Ve Otomatlar", "09:25-12:00");
  }
}
