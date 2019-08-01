class Kisi{

  String _kisiAdi;
  String _kisiTarihi;
  String _kisiDetay;
  String _kisiKucukResim;
  String _kisiBuyukResim;

  Kisi(this._kisiAdi, this._kisiTarihi, this._kisiDetay, this._kisiKucukResim,
      this._kisiBuyukResim);

  String get kisiBuyukResim => _kisiBuyukResim;

  set kisiBuyukResim(String value) {
    _kisiBuyukResim = value;
  }

  String get kisiKucukResim => _kisiKucukResim;

  set kisiKucukResim(String value) {
    _kisiKucukResim = value;
  }

  String get kisiDetay => _kisiDetay;

  set kisiDetay(String value) {
    _kisiDetay = value;
  }

  String get kisiTarihi => _kisiTarihi;

  set kisiTarihi(String value) {
    _kisiTarihi = value;
  }

  String get kisiAdi => _kisiAdi;

  set kisiAdi(String value) {
    _kisiAdi = value;
  }


}