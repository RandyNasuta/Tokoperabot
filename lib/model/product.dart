class Product {
  String _image = '';
  String _productName = '';
  double _productPrice = 0.0;
  int _productStock = 0;
  String _productDescription = '';
  bool _isFavorit = false;

  Product(
    String image,
    String productName,
    double productPrice,
    int productStock,
    String productDescription,
    bool isFavorit,
  ) {
    this._image = image;
    this._productName = productName;
    this._productPrice = productPrice;
    this._productStock = productStock;
    this._productDescription = productDescription;
    this._isFavorit = isFavorit;
  }

  String get image => this._image;
  set image(String value) => this._image = value;

  String get productName => this._productName;
  set productName(value) => this._productName = value;

  double get productPrice => this._productPrice;
  set productPrice(value) => this._productPrice = value;

  int get productStock => this._productStock;
  set productStock(value) => this._productStock = value;

  String get productDescription => this._productDescription;
  set productDescription(value) => this._productDescription = value;

  bool get isFavorit => this._isFavorit;
  set isFavorit(value) => this._isFavorit = value;
}
