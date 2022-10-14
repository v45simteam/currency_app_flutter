class CurrencyModel {
  Developer? developer;
  List<TCMBAnlikKurBilgileri>? tCMBAnlikKurBilgileri;

  CurrencyModel({this.developer, this.tCMBAnlikKurBilgileri});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    developer = json['Developer'] != null
        ? new Developer.fromJson(json['Developer'])
        : null;
    if (json['TCMB_AnlikKurBilgileri'] != null) {
      tCMBAnlikKurBilgileri = <TCMBAnlikKurBilgileri>[];
      json['TCMB_AnlikKurBilgileri'].forEach((v) {
        tCMBAnlikKurBilgileri!.add(new TCMBAnlikKurBilgileri.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.developer != null) {
      data['Developer'] = this.developer!.toJson();
    }
    if (this.tCMBAnlikKurBilgileri != null) {
      data['TCMB_AnlikKurBilgileri'] =
          this.tCMBAnlikKurBilgileri!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Developer {
  String? name;
  String? website;
  String? email;

  Developer({this.name, this.website, this.email});

  Developer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    website = json['website'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['website'] = this.website;
    data['email'] = this.email;
    return data;
  }
}

class TCMBAnlikKurBilgileri {
  String? isim;
  String? currencyName;
  double? forexBuying;
  double? forexSelling;
  double? banknoteBuying;
  double? banknoteSelling;
  String? crossRateUSD;
  String? crossRateOther;

  TCMBAnlikKurBilgileri(
      {this.isim,
      this.currencyName,
      this.forexBuying,
      this.forexSelling,
      this.banknoteBuying,
      this.banknoteSelling,
      this.crossRateUSD,
      this.crossRateOther});

  TCMBAnlikKurBilgileri.fromJson(Map<String, dynamic> json) {
    isim = json['Isim'] == null ? "" : json['Isim'];
    currencyName = json['CurrencyName'];
    forexBuying = json['ForexBuying'] == "" ? 0.0 : json['ForexBuying'];
    forexSelling = json['ForexSelling'] == "" ? 0.0 : json['ForexSelling'];
    banknoteBuying =
        (json['BanknoteBuying']) == "" ? 0.0 : json['BanknoteBuying'];
    banknoteSelling =
        json['BanknoteSelling'] == "" ? 0.0 : json['BanknoteSelling'];
    crossRateUSD = json['CrossRateUSD'] == "" ? "" : "";
    crossRateOther = json['CrossRateOther'] == null ? "" : "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Isim'] = this.isim;
    data['CurrencyName'] = this.currencyName;
    data['ForexBuying'] = this.forexBuying;
    data['ForexSelling'] = this.forexSelling;
    data['BanknoteBuying'] = this.banknoteBuying;
    data['BanknoteSelling'] = this.banknoteSelling;
    data['CrossRateUSD'] = this.crossRateUSD;
    data['CrossRateOther'] = this.crossRateOther;
    return data;
  }
}
