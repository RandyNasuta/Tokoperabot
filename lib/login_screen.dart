import 'package:flutter/material.dart';
import 'package:tokoperabot/home_screen.dart';
import 'package:tokoperabot/model/user.dart';
import 'package:tokoperabot/register_screen.dart';

String _userEmailInputted = '';
String _userPasswordInputted = '';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserAccount userAccount = UserAccount();
  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.of(context).size.height;
    double widthSize = MediaQuery.of(context).size.width;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          top: heightSize * 0.2,
                          left: widthSize * 0.1,
                          right: widthSize * 0.1),
                      child: Image.asset('images/logo.png')),
                  SizedBox(
                    height: heightSize / 30,
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
                          _userEmailInputted = value;
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
                    height: heightSize / 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      checkUser(_userEmailInputted, _userPasswordInputted);
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(widthSize * 0.25, heightSize * 0.08),
                        primary: const Color.fromARGB(255, 132, 126, 188)),
                    child: const Text(
                      'Masuk',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Belum memiliki akun?',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 12),
                      ),
                      TextButton(
                          onPressed: () async {
                            userAccount = await Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const RegisterScreen();
                            }));
                          },
                          child: const Text(
                            'Daftar Di sini',
                            style: TextStyle(
                                color: Color.fromARGB(255, 132, 126, 188),
                                fontFamily: 'Poppins',
                                fontSize: 12),
                          ))
                    ],
                  )
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          top: heightSize * 0.2,
                          left: widthSize * 0.1,
                          right: widthSize * 0.1),
                      child: Image.asset('images/logo.png')),
                  SizedBox(
                    height: heightSize / 30,
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
                          _userEmailInputted = value;
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
                    height: heightSize / 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      checkUser(_userEmailInputted, _userPasswordInputted);
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(widthSize * 0.35, heightSize * 0.08),
                        primary: const Color.fromARGB(255, 132, 126, 188)),
                    child: const Text(
                      'Masuk',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: heightSize / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Belum memiliki akun?',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 16),
                      ),
                      TextButton(
                          onPressed: () async {
                            userAccount = await Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const RegisterScreen();
                            }));
                          },
                          child: const Text(
                            'Daftar Di sini',
                            style: TextStyle(
                                color: Color.fromARGB(255, 132, 126, 188),
                                fontFamily: 'Poppins',
                                fontSize: 16),
                          ))
                    ],
                  )
                ],
              ),
            );
          }
        },
      ),
      backgroundColor: const Color.fromARGB(255, 97, 192, 248),
    );
  }

  void checkUser(String email, String password) {
    if (userAccount.emailUserPassword.containsKey(email) &&
        userAccount.emailUserPassword[email] == password) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeScreen(
          email: email,
          userAccount: userAccount,
        );
      }));
    } else if (!userAccount.emailUserPassword.containsKey(email) ||
        (userAccount.emailUserPassword[email] != password)) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('Email atau Password tidak ditemukan'),
            );
          });
    }
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
            obscureText: isOpen,
            onChanged: (value) {
              setState(() {
                _userPasswordInputted = value;
              });
            },
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
