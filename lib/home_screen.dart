import 'package:flutter/material.dart';
import 'package:tokoperabot/detail_screen.dart';
import 'package:tokoperabot/model/product.dart';
import 'package:tokoperabot/model/user.dart';

bool _isFavoriteCheck = false, _isTrue = false;
String _nama = '';

class HomeScreen extends StatefulWidget {
  String email = '';
  UserAccount userAccount;
  HomeScreen({required this.email, required this.userAccount});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.of(context).size.height;
    double widthSize = MediaQuery.of(context).size.width;
    _nama = widget.userAccount.emailUserName[widget.email]!;
    List? userProductList = [...?widget.userAccount.userProductHistory[_nama]];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 97, 193, 248),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      width: widthSize,
                      height: heightSize * 0.25,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(255, 95, 182, 231),
                                Color.fromARGB(255, 0, 255, 255),
                              ]),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                offset: Offset(0, 10),
                                blurRadius: 20),
                          ]),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: widthSize / 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: widthSize / 20,
                                  vertical: heightSize / 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Welcome',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      widget.userAccount
                                          .emailUserName[widget.email]!,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  userProductList.clear();
                                },
                                icon: const Icon(
                                  Icons.logout_sharp,
                                  color: Colors.white,
                                  size: 35,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(widthSize / 22),
                        height: heightSize * 0.68,
                        width: widthSize * 0.90,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 2,
                                  childAspectRatio: 15 / 20),
                          itemBuilder: (context, index) {
                            Product product = userProductList[index];
                            return InkWell(
                              onTap: () async {
                                _isTrue = await Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailScreen(
                                    product: product,
                                  );
                                }));
                                setState(() {
                                  _isFavoriteCheck = _isTrue;
                                });
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: SizedBox(
                                            width: widthSize * 0.43,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Hero(
                                                tag:
                                                    'location-img-${product.image}',
                                                child: Image.asset(
                                                  product.image,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ))),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  product.productName,
                                                  style: const TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10),
                                                ),
                                                Text(
                                                    'Rp${product.productPrice.toStringAsFixed(0)}',
                                                    style: const TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 10)),
                                                Text(
                                                    'Stok: ${product.productStock}',
                                                    style: const TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 10)),
                                              ],
                                            ),
                                            FavoriteButton(product: product),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: 5,
                        )),
                  ],
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      width: widthSize,
                      height: heightSize * 0.25,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(255, 95, 182, 231),
                                Color.fromARGB(255, 0, 255, 255),
                              ]),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                offset: Offset(0, 10),
                                blurRadius: 20),
                          ]),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: widthSize / 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: widthSize / 20,
                                  vertical: heightSize / 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Welcome',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      widget.userAccount
                                          .emailUserName[widget.email]!,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  userProductList.clear();
                                },
                                icon: const Icon(
                                  Icons.logout_sharp,
                                  color: Colors.white,
                                  size: 40,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(widthSize / 22),
                        height: heightSize * 0.68,
                        width: widthSize * 0.90,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 2,
                                  childAspectRatio: 10 / 12),
                          itemBuilder: (context, index) {
                            Product product = userProductList[index];
                            return InkWell(
                              onTap: () async {
                                _isTrue = await Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailScreen(
                                    product: product,
                                  );
                                }));
                                setState(() {
                                  _isFavoriteCheck = _isTrue;
                                });
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: SizedBox(
                                            width: widthSize * 0.43,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Hero(
                                                tag:
                                                    'location-img-${product.image}',
                                                child: Image.asset(
                                                  product.image,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ))),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  product.productName,
                                                  style: const TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                    'Rp${product.productPrice.toStringAsFixed(0)}',
                                                    style: const TextStyle(
                                                        fontFamily: 'Poppins')),
                                                Text(
                                                    'Stok: ${product.productStock}',
                                                    style: const TextStyle(
                                                        fontFamily: 'Poppins')),
                                              ],
                                            ),
                                            FavoriteButton(product: product),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: 5,
                        )),
                  ],
                ),
              ),
            );
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
  UserAccount userAccount = UserAccount();
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            _isFavoriteCheck = !_isFavoriteCheck;
            widget.product.isFavorit = _isFavoriteCheck;
          });
        },
        icon: Icon(
          widget.product.isFavorit ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ));
  }
}
