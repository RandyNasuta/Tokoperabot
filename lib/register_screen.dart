import 'package:flutter/material.dart';
import 'package:tokoperabot/model/product.dart';
import 'package:tokoperabot/model/product_list.dart';
import 'package:tokoperabot/model/user.dart';

UserAccount _userAccount = UserAccount();
String _checkPassword = '';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.of(context).size.height;
    double widthSize = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context, _userAccount);
            },
            icon: const Icon(Icons.arrow_back_ios_sharp)),
        backgroundColor: const Color.fromARGB(255, 97, 193, 248),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: heightSize / 50),
                      child: const Text(
                        'Daftar',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightSize / 80,
                  ),
                  Container(
                    height: heightSize * 0.1,
                    width: widthSize * 2,
                    margin: EdgeInsets.symmetric(horizontal: widthSize / 22),
                    padding: EdgeInsets.fromLTRB(
                        widthSize / 22, 0, widthSize / 22, heightSize / 35),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _userAccount.userName = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Nama Lengkap',
                        hintStyle:
                            TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightSize / 20,
                  ),
                  Container(
                    height: heightSize * 0.1,
                    width: widthSize * 2,
                    margin: EdgeInsets.symmetric(horizontal: widthSize / 22),
                    padding: EdgeInsets.fromLTRB(
                        widthSize / 22, 0, widthSize / 22, heightSize / 35),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _userAccount.userEmail = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle:
                            TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightSize / 20,
                  ),
                  Container(
                    height: heightSize * 0.1,
                    width: widthSize * 2,
                    margin: EdgeInsets.symmetric(horizontal: widthSize / 22),
                    padding: EdgeInsets.fromLTRB(
                        widthSize / 22, 0, widthSize / 22, heightSize / 35),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const LookPassword(),
                  ),
                  SizedBox(
                    height: heightSize / 20,
                  ),
                  Container(
                    height: heightSize * 0.1,
                    width: widthSize * 2,
                    margin: EdgeInsets.symmetric(horizontal: widthSize / 22),
                    padding: EdgeInsets.fromLTRB(
                        widthSize / 22, 0, widthSize / 22, heightSize / 35),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const ConfirmationPassword(),
                  ),
                  SizedBox(
                    height: heightSize / 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      registerAccount(
                          _userAccount.userName,
                          _userAccount.userEmail,
                          _userAccount.userPassword,
                          _checkPassword);
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(widthSize * 0.25, heightSize * 0.08),
                        primary: const Color.fromARGB(255, 132, 126, 188)),
                    child: const Text(
                      'Daftar',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: heightSize / 50),
                      child: const Text(
                        'Daftar',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightSize / 40,
                  ),
                  Container(
                    height: heightSize * 0.1,
                    width: widthSize * 2,
                    margin: EdgeInsets.symmetric(horizontal: widthSize / 22),
                    padding: EdgeInsets.fromLTRB(
                        widthSize / 22, 0, widthSize / 22, heightSize / 35),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _userAccount.userName = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Nama Lengkap',
                        hintStyle:
                            TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightSize / 20,
                  ),
                  Container(
                    height: heightSize * 0.1,
                    width: widthSize * 2,
                    margin: EdgeInsets.symmetric(horizontal: widthSize / 22),
                    padding: EdgeInsets.fromLTRB(
                        widthSize / 22, 0, widthSize / 22, heightSize / 35),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _userAccount.userEmail = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle:
                            TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightSize / 20,
                  ),
                  Container(
                    height: heightSize * 0.1,
                    width: widthSize * 2,
                    margin: EdgeInsets.symmetric(horizontal: widthSize / 22),
                    padding: EdgeInsets.fromLTRB(
                        widthSize / 22, 0, widthSize / 22, heightSize / 35),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const LookPassword(),
                  ),
                  SizedBox(
                    height: heightSize / 20,
                  ),
                  Container(
                    height: heightSize * 0.1,
                    width: widthSize * 2,
                    margin: EdgeInsets.symmetric(horizontal: widthSize / 22),
                    padding: EdgeInsets.fromLTRB(
                        widthSize / 22, 0, widthSize / 22, heightSize / 35),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const ConfirmationPassword(),
                  ),
                  SizedBox(
                    height: heightSize / 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      registerAccount(
                          _userAccount.userName,
                          _userAccount.userEmail,
                          _userAccount.userPassword,
                          _checkPassword);
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(widthSize * 0.35, heightSize * 0.08),
                        primary: const Color.fromARGB(255, 132, 126, 188)),
                    child: const Text(
                      'Daftar',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      backgroundColor: const Color.fromARGB(255, 97, 192, 248),
    );
  }

  void registerAccount(
      String nama, String email, String password1, String password2) {
    if (_userAccount.emailUserPassword.containsKey(email)) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('Email sudah digunakan'),
            );
          });
    } else if (password1 != password2) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('Konfirmasi password tidak sama'),
            );
          });
    } else if (password1 == password2 &&
        !(_userAccount.emailUserPassword.containsKey(email))) {
      addData(nama, email, password1);
      Navigator.pop(context, _userAccount);
    }
  }

  void addData(String nama, String email, String password) {
    ProductList products = ProductList();
    _userAccount.emailUserName[email] = nama;
    _userAccount.emailUserPassword[email] = password;
    _userAccount.userProductHistory[nama] = products.productList;
  }
}

class LookPassword extends StatefulWidget {
  const LookPassword({Key? key}) : super(key: key);

  @override
  State<LookPassword> createState() => _LookPasswordState();
}

class _LookPasswordState extends State<LookPassword> {
  bool isOpen = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextField(
            onChanged: (value) {
              setState(() {
                _userAccount.userPassword = value;
              });
            },
            obscureText: isOpen,
            decoration: const InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
            ),
          ),
        ),
        Expanded(
            flex: 0,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
                icon: Icon(isOpen ? Icons.visibility_off : Icons.visibility)))
      ],
    );
  }
}

class ConfirmationPassword extends StatefulWidget {
  const ConfirmationPassword({Key? key}) : super(key: key);

  @override
  State<ConfirmationPassword> createState() => _ConfirmationPassword();
}

class _ConfirmationPassword extends State<ConfirmationPassword> {
  bool isOpen = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextField(
            onChanged: (value) {
              setState(() {
                _checkPassword = value;
              });
            },
            obscureText: isOpen,
            decoration: const InputDecoration(
              hintText: 'Konfirmasi Password',
              hintStyle: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
            ),
          ),
        ),
        Expanded(
            flex: 0,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
                icon: Icon(isOpen ? Icons.visibility_off : Icons.visibility)))
      ],
    );
  }
}
