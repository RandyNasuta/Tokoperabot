import 'package:flutter/material.dart';
import 'package:tokoperabot/model/product.dart';

class DetailScreen extends StatelessWidget {
  Product product;

  DetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.of(context).size.height;
    double widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 97, 193, 248),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, product.isFavorit);
            },
            icon: const Icon(Icons.arrow_back_ios_sharp)),
        title: Text(
          product.productName,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 97, 193, 248),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: heightSize / 50),
                  height: heightSize * 0.5,
                  width: widthSize * 0.9,
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0, 5),
                        blurRadius: 30),
                  ]),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Hero(
                        tag: 'location-img-${product.image}',
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.fill,
                        ),
                      )),
                ),
                SizedBox(
                  height: heightSize / 40,
                ),
                SizedBox(
                  height: heightSize * 0.35,
                  width: widthSize * 0.98,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: widthSize / 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.productName,
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Rp${product.productPrice.toStringAsFixed(0)}',
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Stok: ${product.productStock}',
                                      style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  right: 40.0, bottom: 50),
                              child: FavoriteButton(product: product),
                            ),
                          ],
                        ),
                        Container(
                          width: widthSize * 0.9,
                          margin:
                              EdgeInsets.symmetric(horizontal: widthSize / 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Deskripsi',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(product.productDescription)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize:
                                  Size(widthSize * 0.35, heightSize * 0.08),
                              primary: Colors.green),
                          onPressed: () {},
                          child: const Text('Masukkan Keranjang')),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize:
                                  Size(widthSize * 0.35, heightSize * 0.08),
                              primary: Colors.indigo),
                          onPressed: () {},
                          child: const Text('Beli Sekarang'))
                    ],
                  ),
                )
              ],
            ));
          } else {
            return SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: heightSize / 50),
                  height: heightSize * 0.5,
                  width: widthSize * 0.9,
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0, 5),
                        blurRadius: 30),
                  ]),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Hero(
                        tag: 'location-img-${product.image}',
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.fill,
                        ),
                      )),
                ),
                SizedBox(
                  height: heightSize / 40,
                ),
                SizedBox(
                  height: heightSize * 0.28,
                  width: widthSize * 0.98,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: widthSize / 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.productName,
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Rp${product.productPrice.toStringAsFixed(0)}',
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Stok: ${product.productStock}',
                                      style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  right: 40.0, bottom: 50),
                              child: FavoriteButton(product: product),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: widthSize * 0.9,
                          margin:
                              EdgeInsets.symmetric(horizontal: widthSize / 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Deskripsi',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(product.productDescription)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize:
                                  Size(widthSize * 0.35, heightSize * 0.08),
                              primary: Colors.green),
                          onPressed: () {},
                          child: const Text('Masukkan Keranjang')),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize:
                                  Size(widthSize * 0.35, heightSize * 0.08),
                              primary: Colors.indigo),
                          onPressed: () {},
                          child: const Text('Beli Sekarang'))
                    ],
                  ),
                )
              ],
            ));
          }
        },
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  Product product;
  FavoriteButton({required this.product});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            widget.product.isFavorit = !widget.product.isFavorit;
          });
        },
        icon: Icon(
          widget.product.isFavorit ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
          size: 60.0,
        ));
  }
}
