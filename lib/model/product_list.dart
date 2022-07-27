import 'package:tokoperabot/model/product.dart';

class ProductList {
  List<Product> _productList = [
    Product('images/chair_grey.jpg', 'Kursi Abu-Abu', 100000, 15,
        'Produk ini adalah kursi berwarna abu-abu', false),
    Product('images/chair_party.jpg', 'Kursi Pesta', 35000000, 10,
        'Kursi ini cocok digunakan untuk pesta ulang tahun', false),
    Product(
        'images/kasur_tidur.jpg',
        'Spring Bed',
        150000,
        5,
        'Kasur tidur ini berukuran besar untuk digunakan oleh dua orang dan sangat nyaman',
        false),
    Product(
        'images/lemari_toilet.jpg',
        'Lemari Toilet',
        120000,
        10,
        'Lemari yang bagus untuk menyimpan banyak peralatan kamar mandi',
        false),
    Product('images/sofa_blue.jpg', 'Blue Enjoy Sofa', 80000, 10,
        'Sofa nyaman untuk kumpul bersama keluarga', false)
  ];

  List<Product> get productList{
    return _productList;
  }
  
}
